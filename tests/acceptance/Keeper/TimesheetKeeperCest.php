<?php

namespace acceptance\Keeper;

use AcceptanceTester;
use Core\Models\Acl;
use Core\Models\User;
use Models\FactoryMeta;
use Models\KeeperValueChanges;
use Models\PrepaymentRow;
use Models\Prepayments;
use Models\PrepaymentsSignatures;
use Models\Retention;
use Models\Surcharge;
use Models\Timesheet;
use Models\TimesheetTotals;
use Models\TimesheetTotalsMaster;
use Models\TimetableChecks;
use Models\UnitsContract;
use const USERNAME_CURATOR;
use const USERNAME_KEEPER;
use const USERNAME_MASTER;
use const USERNAME_OPERATING_OFFICER;

class TimesheetKeeperCest
{

    public function _before(AcceptanceTester $I)
    {
        $I->seedUnit();
        $I->seedFactory();
        $I->seedUserTable();
        $I->seedUnitProfession();
        $I->seedWorkDate();
        $I->seedProfession();
        // костыль, чтобы колонки нормально показывались
        $I->resizeWindow(3000, 1080);
        $I->login(USERNAME_KEEPER);
    }

    public function _after(AcceptanceTester $I)
    {
        $I->resizeWindow(1440, 768);
    }

    protected function setShift(AcceptanceTester $I, int $unitId, string $date, int $state, int $time, ?int $outage = null)
    {
        $data = [
            'unit_id' => $unitId,
            'profession_id' => 1,
            'master_id' => 0,
            'factory_id' => 1,
            'date' => $date,
            'state' => $state,
            'time' => $time,
            'outage' => $outage,
        ];

        $I->haveInDatabase(Timesheet::$tableName, $data);
    }

    protected function setSurcharge(AcceptanceTester $I, int $unitId, string $date, int $type, int $amount)
    {
        $I->haveInDatabase(Surcharge::$tableName,
            [
                'unit_id' => $unitId,
                'user_id' => Acl::ROLE_KEEPER,
                'date' => $date,
                'title' => Surcharge::$types[$type],
                'amount' => $amount,
                'type' => $type,
            ]
        );
    }

    protected function setRetention(AcceptanceTester $I, int $unitId, string $date, int $type, int $amount)
    {
        $I->haveInDatabase(Retention::$tableName,
            [
                'unit_id' => $unitId,
                'user_id' => Acl::ROLE_KEEPER,
                'type' => $type,
                'amount' => $amount,
                'date' => $date,
                'created_at' => $date,
                'updated_at' => $date,
            ]
        );
    }

    protected function setPrepayment(AcceptanceTester $I, int $factoryId, int $unitId, string $date, int $status, int $amount, int $prepaymentId)
    {
        $today = date('Y-m-d');
        $I->haveInDatabase(Prepayments::$tableName,
            [
                'id' => $prepaymentId,
                'factory_id' => $factoryId,
                'user_id' => $I->grabFromDatabase(User::$tableName, 'id', ['login' => USERNAME_MASTER]),
                'created_at' => $date,
                'status' => $status,
            ]
        );
        $I->waitAndSeeInDatabase(Prepayments::$tableName, ['factory_id' => $factoryId, 'status' => Prepayments::STATUS_COMPLETE]);
        $I->haveInDatabase(PrepaymentRow::$tableName,
            [
                'prepayment_id' => $prepaymentId,
                'unit_id' => $unitId,
                'status' => $status,
                'amount' => $amount,
                'payed_at' => $date,
                'payed' => $amount,
            ]
        );
        $this->setPrepaymentsSignatures($I, USERNAME_MASTER, $today, PrepaymentsSignatures::TYPE_MASTER, $prepaymentId);
        $this->setPrepaymentsSignatures($I, USERNAME_CURATOR, $today, PrepaymentsSignatures::TYPE_CURATOR, $prepaymentId);
        $this->setPrepaymentsSignatures($I, USERNAME_OPERATING_OFFICER, $today, PrepaymentsSignatures::TYPE_OPERATING_OFFICER, $prepaymentId);
        $this->setPrepaymentsSignatures($I, USERNAME_KEEPER, $today, PrepaymentsSignatures::TYPE_KEEPER, $prepaymentId);
    }

    protected function setPrepaymentsSignatures(AcceptanceTester $I, string $user, string $date, int $type, int $prepaymentId)
    {
        $I->haveInDatabase(PrepaymentsSignatures::$tableName,
            [
                'prepayment_id' => $prepaymentId,
                'user_id' => $I->grabFromDatabase(User::$tableName, 'id', ['login' => $user]),
                'type' => $type,
                'created_at' => $date,
            ]
        );
    }

    protected function checkSavedValue(AcceptanceTester $I, int $columnNumber, string $field)
    {
        $I->amOnPage('keeper/timetable');
        $I->doubleClick('#timetable-table tr:nth-child(3) > td:nth-child(' . $columnNumber . ')');
        $I->clearField('#timetable-table > div.handsontableInputHolder > textarea');
        $I->fillField('#timetable-table > div.handsontableInputHolder > textarea', 1);
        $I->click('h4 span.text-semibold');
        $I->waitForElementClickable('#message');
        $I->fillField('#message', '#message');
        $I->click('#changeValueForm button.btn-primary');
        $I->waitAndSeeInDatabase(TimesheetTotals::$tableName, ['factory_id' => 1, $field => 1]);
        $I->clearTables([TimesheetTotals::$tableName, KeeperValueChanges::$tableName, TimetableChecks::$tableName]);
    }

    protected function checkSavedValueWithoutModal(AcceptanceTester $I, int $columnNumber, int $type = 0)
    {
        $I->amOnPage('keeper/timetable');
        $I->doubleClick('#timetable-table tr:nth-child(3) > td:nth-child(' . $columnNumber . ')');
        $I->clearField('#timetable-table > div.handsontableInputHolder > textarea');
        $I->fillField('#timetable-table > div.handsontableInputHolder > textarea', 1);
        $I->click('h4 span.text-semibold');
        if (!empty($type)) {
            $I->waitAndSeeInDatabase(Retention::$tableName, ['unit_id' => 1, 'amount' => 1, 'type' => $type]);
        }
    }


    /**
     * Видим информацию в табеле
     *
     * @group other
     */
    public function testSeeTimesheet(AcceptanceTester $I)
    {
        $partOfSelector = 'table.htCore tr:nth-child(3) > ';
        $unitId = 1;
        $shiftHours = 11;
        $outage = 1;

        $officialSalary = 6.00;
        $ndfl = 7.00;
        $alimony = 8.00;
        $utilities = 16.00;
        $watch = 17.00;
        $fines = 9.00;
        $lunch = 5.00;
        $workBook = 3.00;
        $loan = 6.00;
        $medicalBoard = 7.00;
        $patent = 8.00;
        $overalls = 11.00;

        $factoryId = 1;
        $delay = 5;
        $today = date('Y-m-d');
        $rate = 200;
        $rateNight = 240;
        $outageMultiplier = 1.1;
        $nightShiftMultiplier = 1.2;

        $shiftCount = 0;
        $dayShiftCount = 0;
        $nightShiftCount = 0;
        $outageShiftCount = 0;

        $this->setShift($I, $unitId, date('Y-m-01'), Timesheet::STATE_WORK_DAY, $shiftHours, $outage);
        $this->setShift($I, $unitId, date('Y-m-02'), Timesheet::STATE_WORK_DAY, $shiftHours, $outage);
        $dayShiftCount += 2;
        $outageShiftCount += 2;
        $this->setShift($I, $unitId, date('Y-m-03'), Timesheet::STATE_WORK_NIGHT, $shiftHours);
        $this->setShift($I, $unitId, date('Y-m-04'), Timesheet::STATE_WORK_NIGHT, $shiftHours);
        $nightShiftCount += 2;
        $shiftCount += 4;

        $transfer = 2;
        $transport = 1;

        $accommodationSurcharge = 3;
        $medbookSurcharge = 5;
        $overallsSurcharge = 6;
        $bountySurcharge = 4;

        $totalDay = $dayShiftCount * ($shiftHours - $outage);
        $totalNight = $nightShiftCount * $shiftHours;
        $outageRate = $rate * $outageMultiplier;
        $outageTotal = $outageShiftCount * $outageRate;
        $travel = $transfer + ($transport * $shiftCount);
        $totalRetention = $officialSalary + $ndfl + $alimony + $fines + $lunch + $overalls + $workBook + $loan + $medicalBoard + $patent + $utilities + $watch;
        $fot = ($totalDay * $rate) + ($totalNight * $rateNight) + $outageTotal;
        $salary = $fot + $accommodationSurcharge + $travel + $medbookSurcharge + $overallsSurcharge + $bountySurcharge;
        $salaryForGet = $salary - $totalRetention;

        $I->haveInDatabase(TimesheetTotals::$tableName,
            [
                'factory_id' => $factoryId,
                'unit_id' => $unitId,
                'profession_id' => 1,
                'rate' => $rate,
                'user_id' => Acl::ROLE_KEEPER,
                'date' => date('Y-m-t'),
                'official_salary' => $officialSalary,
                'ndfl' => $ndfl,
                'alimony' => $alimony,
                'utilities' => $utilities,
                'watch' => $watch,
                'fines' => $fines,
                'overalls' => $overalls,
                'work_date_id' => 1,
            ]
        );
        $I->haveInDatabase(FactoryMeta::$tableName, ['key' => FactoryMeta::META_NIGHT_SHIFT_MULTIPLIER, 'value' => $nightShiftMultiplier, 'factory_id' => $factoryId]);
        $I->haveInDatabase(FactoryMeta::$tableName, ['key' => FactoryMeta::META_OUTAGE_MULTIPLIER, 'value' => $outageMultiplier, 'factory_id' => $factoryId]);

        $this->setSurcharge($I, $unitId, $today, Surcharge::TYPE_TRANSPORT, 1);
        $this->setSurcharge($I, $unitId, $today, Surcharge::TYPE_TRANSFER, 2);
        $this->setSurcharge($I, $unitId, $today, Surcharge::TYPE_ACCOMMODATION, 3);
        $this->setSurcharge($I, $unitId, $today, Surcharge::TYPE_BOUNTY, 4);
        $this->setSurcharge($I, $unitId, $today, Surcharge::TYPE_MEDBOOK, 5);
        $this->setSurcharge($I, $unitId, $today, Surcharge::TYPE_OVERALLS, 6);

        $this->setRetention($I, $unitId, $today, Retention::TYPE_WORK_BOOK, 3);
        $this->setRetention($I, $unitId, $today, Retention::TYPE_LUNCH, 5);
        $this->setRetention($I, $unitId, $today, Retention::TYPE_LOAN, 6);
        $this->setRetention($I, $unitId, $today, Retention::TYPE_MEDICAL_BOARD, 7);
        $this->setRetention($I, $unitId, $today, Retention::TYPE_PATENT, 8);

        // Несколько авансов для проверки создания дополнительных колонок
        $prepaymentAmount = 4;
        $this->setPrepayment($I, $factoryId, $unitId, $today, PrepaymentRow::STATUS_COMPLETE, $prepaymentAmount, 5);
        $this->setPrepayment($I, $factoryId, $unitId, $today, PrepaymentRow::STATUS_COMPLETE, $prepaymentAmount, 6);
        $this->setPrepayment($I, $factoryId, $unitId, $today, PrepaymentRow::STATUS_COMPLETE, $prepaymentAmount, 7);
        $this->setPrepayment($I, $factoryId, $unitId, $today, PrepaymentRow::STATUS_COMPLETE, $prepaymentAmount, 8);
        $prepaymentCount = 4;

        $I->amOnPage('keeper/timetable');
        $I->waitForText('Предприятие1', $delay, 'h4 span.text-semibold');
        // TODO В дампе
        $I->waitForText('Тестовый Тест Тестович', $delay, $partOfSelector . 'td');
        // Кол-во часов
        $I->waitForText((string) $totalDay, $delay, $partOfSelector . 'td:nth-child(2)');
        // Расценка
        $I->waitForText((string) $rate, $delay, $partOfSelector . 'td:nth-child(3)');
        // Кол-во часов ночь
        $I->waitForText((string) $totalNight, $delay, $partOfSelector . 'td:nth-child(4)');
        // Расценка ночь
        $I->waitForText((string) $rateNight, $delay, $partOfSelector . 'td:nth-child(5)');
        // Часов простоя
        $I->waitForText((string) ($outage * $outageShiftCount), $delay, $partOfSelector . 'td:nth-child(6)');
        // Простой
        $I->waitForText((string) ($outageRate * $outageShiftCount), $delay, $partOfSelector . 'td:nth-child(7)');
        // Комп. жилья
        $I->waitForText((string) Surcharge::TYPE_ACCOMMODATION, $delay, $partOfSelector . 'td:nth-child(8)');
        // Проезд
        $I->waitForText((string) $travel, $delay, $partOfSelector . 'td:nth-child(9)');
        // Мед.ком
        $I->waitForText((string) Surcharge::TYPE_MEDBOOK, $delay, $partOfSelector . 'td:nth-child(10)');
        // Спец. одежда
        $I->waitForText((string) Surcharge::TYPE_OVERALLS, $delay, $partOfSelector . 'td:nth-child(11)');
        // Премия
        $I->waitForText((string) Surcharge::TYPE_BOUNTY, $delay, $partOfSelector . 'td:nth-child(12)');
        // ФОТ
        $I->waitForText((string) $fot, $delay, $partOfSelector . 'td:nth-child(13)');
        // Всего начислено
        $I->waitForText((string) $salary, $delay, $partOfSelector . 'td:nth-child(14)');
        // Столбцы удержания
        // Официалы з/п
        $I->waitForText((string) $officialSalary, $delay, $partOfSelector . 'td:nth-child(15)');
        // НДФЛ
        $I->waitForText((string) $ndfl, $delay, $partOfSelector . 'td:nth-child(16)');
        // Исполнительный лист
        $I->waitForText((string) $alimony, $delay, $partOfSelector . 'td:nth-child(17)');
        // Штрафы
        $I->waitForText((string) $fines, $delay, $partOfSelector . 'td:nth-child(18)');
        // Обед
        $I->waitForText((string) Retention::TYPE_LUNCH, $delay, $partOfSelector . 'td:nth-child(19)');
        // Спец. одежда
        $I->waitForText((string) $overalls, $delay, $partOfSelector . 'td:nth-child(20)');
        // Трудовая книжка
        $I->waitForText((string) Retention::TYPE_WORK_BOOK, $delay, $partOfSelector . 'td:nth-child(21)');
        // Займ
        $I->waitForText((string) Retention::TYPE_LOAN, $delay, $partOfSelector . 'td:nth-child(22)');
        // Мед.ком
        $I->waitForText((string) Retention::TYPE_MEDICAL_BOARD, $delay, $partOfSelector . 'td:nth-child(23)');
        // Патент
        $I->waitForText((string) Retention::TYPE_PATENT, $delay, $partOfSelector . 'td:nth-child(24)');
        // Комунал. услуги
        $I->waitForText((string) $utilities, $delay, $partOfSelector . 'td:nth-child(25)');
        // Вахта
        $I->waitForText((string) $watch, $delay, $partOfSelector . 'td:nth-child(26)');
        // Всего удержано
        $I->waitForText((string) $totalRetention, $delay, $partOfSelector . 'td:nth-child(27)');
        // ЗП к выдаче
        $I->waitForText((string) $salaryForGet, $delay, $partOfSelector . 'td:nth-child(28)');
        // Аванс
        $I->waitForText((string) $prepaymentAmount, $delay, $partOfSelector . 'td:nth-child(29)');
        // Аванс второй
        $I->waitForText((string) $prepaymentAmount, $delay, $partOfSelector . 'td:nth-child(30)');
        // Аванс третий
        $I->waitForText((string) $prepaymentAmount, $delay, $partOfSelector . 'td:nth-child(31)');
        // Аванс третий
        $I->waitForText((string) $prepaymentAmount, $delay, $partOfSelector . 'td:nth-child(32)');
        // Выплачено ранее
        $I->waitForText('0', $delay, $partOfSelector . 'td:nth-child(33)');
        // Остатки с НПД
        $I->waitForText((string) ($salaryForGet - ($prepaymentAmount * $prepaymentCount)), $delay, $partOfSelector . 'td:nth-child(34)');
    }

    /**
     * Бухгалтер ставит Комп. жилья в колонку 8
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function testSetAccommodation(AcceptanceTester $I)
    {
        $this->checkSavedValue($I, 8, 'housing_compensation');
    }

    /**
     * Бухгалтер ставит Проезд в колонку 9
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function testSetTransportCompensation(AcceptanceTester $I)
    {
        $this->checkSavedValue($I, 9, 'transport_compensation');
    }

    /**
     * Бухгалтер ставит Мед.ком. в колонку 10
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function testSetMedBookCompensation(AcceptanceTester $I)
    {
        $this->checkSavedValue($I, 10, 'med_book_compensation');
    }

    /**
     * Бухгалтер ставит Спец.одежда. в колонку 11
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function testSetOverallsCompensation(AcceptanceTester $I)
    {
        $this->checkSavedValue($I, 11, 'overalls_compensation');
    }

    /**
     * Бухгалтер ставит Премия в колонку 12
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function testSetBounty(AcceptanceTester $I)
    {
        $this->checkSavedValue($I, 12, 'bounty');
    }

    /**
     * Бухгалтер ставит Официалы з/п в колонку 15
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function testSetOfficialSalary(AcceptanceTester $I)
    {
        $this->checkSavedValueWithoutModal($I, 15);
        $I->waitAndSeeInDatabase(TimesheetTotals::$tableName, ['factory_id' => 1, 'official_salary' => 1]);

        $I->clearTables([Retention::$tableName, TimesheetTotals::$tableName]);
    }

    /**
     * Бухгалтер ставит НДФЛ з/п в колонку 16
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function testSetNdfl(AcceptanceTester $I)
    {
        $this->checkSavedValueWithoutModal($I, 16);
        $I->waitAndSeeInDatabase(TimesheetTotals::$tableName, ['factory_id' => 1, 'ndfl' => 1]);


        $I->clearTables([Retention::$tableName, TimesheetTotals::$tableName]);
    }

    /**
     * Бухгалтер ставит Исполнительный лист в колонку 17
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function testSetAlimony(AcceptanceTester $I)
    {
        $this->checkSavedValueWithoutModal($I, 17);
        $I->waitAndSeeInDatabase(TimesheetTotals::$tableName, ['factory_id' => 1, 'alimony' => 1]);


        $I->clearTables([Retention::$tableName, TimesheetTotals::$tableName]);
    }

    /**
     * Бухгалтер ставит Штраф в колонку 18
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function testSetFines(AcceptanceTester $I)
    {
        $this->checkSavedValue($I, 18, 'fines');
    }

    /**
     * Бухгалтер ставит Спец.одежда удержание в колонку 20
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function testSetOveralls(AcceptanceTester $I)
    {
        $this->checkSavedValue($I, 20, 'overalls');
    }

    /**
     * Бухгалтер ставит Трудовая книжка в колонку 21
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function testSetWorkBook(AcceptanceTester $I)
    {
        $I->haveInDatabase(UnitsContract::$tableName, [
            'id' => 1,
            'number' => '1',
            'from' => date('Y-m-01'),
            'unit_id' => 1,
            'contractor' => 1,
            'type' => UnitsContract::TYPE_EMPLOYMENT_CONTRACT,
            'is_current' => 1,
            'created_at' => date('Y-m-01'),
            'held_1s' => 1,
        ]);
        $this->checkSavedValueWithoutModal($I, 21, Retention::TYPE_WORK_BOOK);


        $I->clearTables([Retention::$tableName, UnitsContract::$tableName]);
    }

    /**
     * Бухгалтер ставит Заим в колонку 22
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function testSetLoan(AcceptanceTester $I)
    {
        $this->checkSavedValueWithoutModal($I, 22, Retention::TYPE_LOAN);
    }

    /**
     * Бухгалтер ставит Мед.ком. удержание в колонку 23
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function testSetMedBook(AcceptanceTester $I)
    {
        $this->checkSavedValueWithoutModal($I, 23, Retention::TYPE_MEDICAL_BOARD);
    }

    /**
     * Бухгалтер ставит Патент в колонку 24
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function testSetPatent(AcceptanceTester $I)
    {
        $this->checkSavedValueWithoutModal($I, 24, Retention::TYPE_PATENT);
    }

    /**
     * Бухгалтер ставит Комунал.услуги удержание в колонку 25
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function testSetUtilities(AcceptanceTester $I)
    {
        $this->checkSavedValue($I, 25, 'utilities');
    }

    /**
     * Бухгалтер ставит Вахта в колонку 26
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function testSetWatch(AcceptanceTester $I)
    {
        $this->checkSavedValueWithoutModal($I, 26);
        $I->waitAndSeeInDatabase(TimesheetTotals::$tableName, ['factory_id' => 1, 'watch' => 1]);
        $I->clearTables([TimesheetTotals::$tableName, TimesheetTotalsMaster::$tableName, TimetableChecks::$tableName]);
    }

    // /** !!!! Написать тесты на невывод левых записей и на закрытие табеля (с хорошими и плохими условиями)
    //  * Бухгалтер закрывает табель
    //  * @param AcceptanceTester $I
    //  * @group other
    //  */
    // public function _testSet(AcceptanceTester $I)
    // {
    //     $unitId = 2;
    //     $i = 1;
    //     //счет для добавления смен
    //     while ($i <= date('t')) {
    //         $this->setShift($I, $unitId, date('Y-m-'.$i), Timesheet::STATE_WORK_DAY, 8);
    //         $i++;
    //     }
    //     $I->haveInDatabase(TimetableChecks::$tableName,
    //         [
    //             'date' => date('Y-m-01'),
    //             'created_at' => date('Y-m-01'),
    //             'factory_id' => 1,
    //             'status' => 8,
    //         ]
    //     );
    //     $I->amOnPage('keeper/timetable');
    //     $I->wait(30);
    // }


}
