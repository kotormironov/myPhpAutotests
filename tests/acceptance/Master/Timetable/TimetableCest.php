<?php

use Codeception\Example;
use Core\Models\Acl;
use Models\FactoryMeta;
use Models\PrepaymentRow;
use Models\Prepayments;
use Models\Retention;
use Models\Surcharge;
use Models\Timesheet;
use Models\TimesheetTotalsMaster;
use Models\Unit;

class TimetableCest
{

    public function _before(AcceptanceTester $I)
    {
        $I->seedUserTable();
        $I->seedFactory();
        $I->seedUserFactoryRelation();
        $I->seedUnit(['status' => Unit::STATUS_APPLICANT]);
        $I->seedWorkDate();
        $I->seedProfession();
        $I->login(USERNAME_MASTER);
    }

    /** Костыль чтобы весь табель было видно */
    public function _setResizeWindow(AcceptanceTester $I): void
    {
        $I->resizeWindow(3000, 1080);
    }

    /**
     * before
     */
    public function _setСoefficient(AcceptanceTester $I)
    {
        $factoryId = 1;
        $I->seedFactoryMeta($factoryId, FactoryMeta::META_OUTAGE, 1);
        $I->seedFactoryMeta($factoryId, FactoryMeta::META_OUTAGE_MULTIPLIER, 1.1);
    }

    protected function _setState(AcceptanceTester $I, int $unitId, string $date, int $state, ?int $time = null)
    {
        $data = [
            'unit_id' => $unitId,
            'profession_id' => 1,
            'master_id' => 0,
            'factory_id' => 1,
            'date' => $date,
            'state' => $state,
        ];
        if (isset($time)) {
            $data['time'] = $time;
        }
        $I->haveInDatabase(Timesheet::$tableName, $data);
    }

    // Выдача номера колонки с поправкой на разное кол-во дней в месяце
    protected function _getSelectorByColumn(string $columnName)
    {
        $arrayColNum =
            [
                'realHour' => 43,
                'outageTime' => 37,
                'retention' => 45,
                'prepayment' => 46,
                'hourGeneral' => 34,
                'nominatedHours' => 35,
                'nominatedNightHours' => 36,
                'coefficient' => 38,
                'shift' => 39,
                'surcharges' => 44,
                'clickSurcharges' => 43,
                'seeRetention' => 44,
            ];

        return '#timetable-table tr:nth-child(2) td:nth-child(' . $arrayColNum[$columnName] . ')';
    }

    protected function _seeShiftSelector(int $colNum, string $selectorPart = null)
    {
        return '#timetable-table tr:nth-child(2) td:nth-child(' . $colNum . ')' . $selectorPart;
    }

    protected function _setRetention(AcceptanceTester $I, int $unitId, string $date, int $type)
    {
        $data = [
            'unit_id' => $unitId,
            'type' => $type,
            'description' => 'ЗаполнениеОписания',
            'amount' => 3000,
            'date' => $date,
            'created_at' => $date,
            'updated_at' => $date,
            'user_id' => 1,
        ];
        $I->haveInDatabase(Retention::$tableName, $data);
    }

    protected function _setShift(AcceptanceTester $I, ?int $state, $field = 0, int $time = 0)
    {
        $factoryId = 1;
        $I->amOnPage('master/timetable?factory_id=' . $factoryId);
        $I->doubleClick('#timetable-table tr:nth-child(2) td:nth-child(4)');
        $I->fillField('#timetable-table div.handsontableInputHolder textarea', $field);
        $I->click('h4[class="text-semibold"]');
        $this->_seeAndDeleteInDatabase($I, Timesheet::$tableName, ['profession_id' => 1, 'time' => $time, 'state' => $state]);
    }

    protected function _seeAndDeleteInDatabase(AcceptanceTester $I, $table, $newData)
    {
        $unitId = 1;
        $data = ['unit_id' => $unitId];
        if ($table != (Retention::$tableName || Surcharge::$tableName)) {
            $data['factory_id'] = 1;
        }
        foreach ($newData as $column => $value) {
            $data[$column] = $value;
        }
        $I->waitAndSeeInDatabase($table, $data, 5);
        $I->deleteFromDatabase($table, $data);
        $I->waitAndDontSeeInDatabase($table, $data, 5);
    }

    protected function _getStepItemWrapper(AcceptanceTester $I, string $selector = '.htItemWrapper')
    {
        $I->amOnPage('master/timetable?factory_id=1');
        $I->clickWithRightButton('table.htCore tbody tr:nth-child(2) td:nth-child(4)');
        $I->click($selector);
    }

    protected function _getStepStandardHours(AcceptanceTester $I, int $hourCount, string $columnName = 'nominatedHours')
    {
        $I->amOnPage('master/timetable?factory_id=1');
        $I->doubleClick($this->_getSelectorByColumn($columnName));
        $I->fillField('#timetable-table div.handsontableInputHolder textarea', $hourCount);
    }

    protected function _waitVisibleAndClickable(AcceptanceTester $I, string $selectorVisible = '#outageModal .modal-content', string $selectorClickable = '#outageModal .modal-content')
    {
        $I->waitForElementVisible($selectorVisible);
        $I->waitForElementClickable($selectorClickable);
    }

    protected function _fillModal(AcceptanceTester $I, string $modifierId, int $amountCount, string $description = 'ЗаполнениеОписания')
    {
        $I->click($modifierId . 'ModalForm [name="date"]');
        $I->click($modifierId . 'ModalForm [aria-label="' . date('d.m.Y') . '"]');//на mac на локалке надо менять расширение, если не headless. Модалка прыгает.
        $I->fillField($modifierId . 'ModalForm [name="title"]', $description);
        $I->fillField($modifierId . 'ModalForm [name="amount"]', $amountCount);
    }

    /**
     * Вывод строки по соискателю
     * @param AcceptanceTester $I
     * @before _setСoefficient
     * @before _setResizeWindow
     * @group other
     */
    public function testSeeTimetableRow(AcceptanceTester $I)
    {
        $unitId = 1;
        $factoryId = 1;
        $this->_setState($I, $unitId, date('Y-m-01'), Timesheet::STATE_CUSTOM, 8);
        $this->_setState($I, $unitId, date('Y-m-02'), Timesheet::STATE_ABSENT);
        $this->_setState($I, $unitId, date('Y-m-03'), Timesheet::STATE_UNKNOWN);
        $this->_setState($I, $unitId, date('Y-m-04'), Timesheet::STATE_SICK);
        $this->_setState($I, $unitId, date('Y-m-05'), Timesheet::STATE_FREE_DAY);
        $this->_setState($I, $unitId, date('Y-m-06'), Timesheet::STATE_WORK);
        $this->_setState($I, $unitId, date('Y-m-07'), Timesheet::STATE_WORK_DAY, 9);
        $this->_setState($I, $unitId, date('Y-m-08'), Timesheet::STATE_WORK_NIGHT, 10);
        $I->haveInDatabase(
            Retention::$tableName,
            [
                'unit_id' => $unitId,
                'type' => Retention::TYPE_FINE,
                'date' => date('Y-m-09'),
                'description' => 'ЗаполнениеКомментария',
                'amount' => 3000.00,
                'user_id' => 1,
                'created_at' => date('Y-m-d'),
                'updated_at' => date('Y-m-d'),
            ]
        );
        $I->haveInDatabase(Surcharge::$tableName, ['date' => date('Y-m-d'), 'amount' => 100, 'type' => Surcharge::TYPE_MEDBOOK, 'unit_id' => $unitId]);
        $I->updateInDatabase(Timesheet::$tableName, ['outage' => 1], ['factory_id' => $factoryId, 'date' => date('Y-m-01')]);
        $I->haveInDatabase(Prepayments::$tableName, [ 'factory_id' => $factoryId, 'created_at' => date('Y-m-d'), 'user_id' => Acl::ROLE_MANAGER, 'status' => Prepayments::STATUS_NEW]);
        $I->haveInDatabase(PrepaymentRow::$tableName,
            [
                'prepayment_id' => $I->grabFromDatabase(Prepayments::$tableName, 'id', ['created_at' => date('Y-m-d')]),
                'unit_id' => $unitId,
                'amount' => 100,
                'status' => PrepaymentRow::STATUS_NEW,
            ]
        );
        $I->seedUnitsMeta($unitId, 'salary_project', 1);
        $I->seedUnitsMeta($unitId, 'salary_project_rosBank', 1);
        $I->seedUnitsMeta($unitId, 'salary_project_other', 1);

        $I->amOnPage('master/timetable/'.$factoryId.'?startDate=2022-06-01&action=check');

        // Колонка с расценкой
        $I->see('200', $this->_seeShiftSelector(2));
        // Колонка 1 число с часами
        $I->see('8', $this->_seeShiftSelector(4));
        // Колонка 2 число с часами
        $I->see(Timesheet::getShortState(Timesheet::STATE_ABSENT), $this->_seeShiftSelector(5));
        // Колонка 3 число с часами
        $I->see(Timesheet::getShortState(Timesheet::STATE_UNKNOWN), $this->_seeShiftSelector(6));
        // Колонка 4 число с часами
        $I->see(Timesheet::getShortState(Timesheet::STATE_SICK), $this->_seeShiftSelector(7));
        // Колонка 5 число с часами
        $I->see(Timesheet::getShortState(Timesheet::STATE_FREE_DAY), $this->_seeShiftSelector(8));
        // Колонка 6 число с часами
        $I->see(Timesheet::getShortState(Timesheet::STATE_WORK), $this->_seeShiftSelector(9));
        // колонка 7 число с часами
        $I->see('9', $this->_seeShiftSelector(10));
        $I->seeElement($this->_seeShiftSelector(10, '.green'));
        // колонка 8 число с часами
        $I->see('10', $this->_seeShiftSelector(11));
        $I->seeElement($this->_seeShiftSelector(11, '.green.night_shift'));
        // смотрим часы Общее
        $I->see('27', $this->_getSelectorByColumn('hourGeneral'));
        // смотрим Нормочасы
        $I->see('16', $this->_getSelectorByColumn('nominatedHours'));
        // смотрим ночные нормочасы
        $I->see('10', $this->_getSelectorByColumn('nominatedNightHours'));
        // смотрим коэффициент К
        $I->see('96,3%', $this->_getSelectorByColumn('coefficient'));
        // смотрим кол-во смен
        $I->see('3', $this->_getSelectorByColumn('shift'));

        // Колонка "Надбавки"
        $I->see('100', $this->_getSelectorByColumn('surcharges'));
        // Колонка "Удержания"
        $I->see('3000', $this->_getSelectorByColumn('retention'));
        $I->seeElement('i.fa.fa-ticket');//??????
        // вывод зарплаты
        $I->see('5420', $this->_getSelectorByColumn('realHour'));
        // вывод Аванса
        $I->see('100', $this->_getSelectorByColumn('prepayment'));
        // смотрим  Простой
        $I->see('1', $this->_getSelectorByColumn('outageTime'));
        $I->click($this->_getSelectorByColumn('outageTime'));

        $I->waitForElementVisible('#outageTableBody');
        $I->see('1', '#outageTableBody');
        // смотрю зарплатный проект
        $I->seeCheckboxIsChecked('#timetable-table .changeSalaryProject');
        $I->seeCheckboxIsChecked('#timetable-table .changeSalaryProjectRosBank');
        $I->seeCheckboxIsChecked('#timetable-table .changeSalaryProjectOther');
    }

    /**
     * Видим Удержания в модалке
     * @param AcceptanceTester $I
     * @before _setResizeWindow
     * @group other
     */
    public function testSeeRetention(AcceptanceTester $I)
    {
        $statFine = Retention::TYPE_FINE;
        $statOverall = Retention::TYPE_OVERALL;
        $statUtilities = Retention::TYPE_UTILITIES;
        $statLunch = Retention::TYPE_LUNCH;
        $unitId = 1;
        $dataRetention = date('Y-m-d');

        $this->_setRetention($I, $unitId, $dataRetention, $statFine);
        $this->_setRetention($I, $unitId, $dataRetention, $statOverall);
        $this->_setRetention($I, $unitId, $dataRetention, $statUtilities);
        $this->_setRetention($I, $unitId, $dataRetention, $statLunch);

        $I->amOnPage('master/timetable?factory_id=1&sdate=' . $dataRetention . '&fdate=' . date('Y-m-t') . '&view=list');
        $I->click($this->_getSelectorByColumn('seeRetention'));
        $I->waitForElementVisible('#retentionsTableBody td:nth-child(1)');
        $I->waitForElementClickable('#retentionsTableBody td:nth-child(1)');
        $I->see(date('d.m.Y'), '#retentionsTableBody td:nth-child(1)');
        $I->see(Retention::getType($statFine), '#retentionsTableBody tr:nth-child(1) td:nth-child(2)');
        $I->see(Retention::getType($statOverall), '#retentionsTableBody tr:nth-child(2) td:nth-child(2)');
        $I->see(Retention::getType($statUtilities), '#retentionsTableBody tr:nth-child(3) td:nth-child(2)');
        $I->see(Retention::getType($statLunch), '#retentionsTableBody tr:nth-child(4) td:nth-child(2)');
        $I->see('ЗаполнениеОписания', '#retentionsTableBody td:nth-child(3)');
        $I->see(3000, '#retentionsTableBody td:nth-child(4)');
    }

// +---------------------+
// |                     |
// |  Тесты на действия  |
// |                     |
// +---------------------+

    // TODO Сделать через датапровайдер

    /**
     * Датапровайдер для функций на выставление смены
     */
    protected function _setShiftDataProvider(): array
    {
        return $data =
            [
                ['state' => Timesheet::STATE_CUSTOM, 'field' => 10, 'time' => 10],//Обновление времени смены. $state 8 выставляется по умолчанию для дневной смены
                ['state' => Timesheet::STATE_ABSENT, 'field' => 0, 'time' => 0],//Ставим прогул
                ['state' => Timesheet::STATE_UNKNOWN, 'field' => Timesheet::getShortState(Timesheet::STATE_UNKNOWN), 'time' => 0],//Ставим отсутвует
                ['state' => Timesheet::STATE_SICK, 'field' => Timesheet::getShortState(Timesheet::STATE_SICK), 'time' => 0],//Ставим больничный
                ['state' => Timesheet::STATE_WORK, 'field' => '+', 'time' => 0],//Ставим "+"
                ['state' => Timesheet::STATE_FREE_DAY, 'field' => Timesheet::getShortState(Timesheet::STATE_FREE_DAY), 'time' => 0],//Ставим выходной

            ];
    }

    /**
     * Обновление смены
     * @param AcceptanceTester $I
     * @param Example $example
     * @dataProvider _setShiftDataProvider
     * @group smoke
     */
    public function testChangeShift(AcceptanceTester $I, Example $example)
    {
        $this->_setShift($I, $example['state'], $example['field'], $example['time']);
    }

    /**
     * Пометим ячейку как дневную смену
     * @param AcceptanceTester $I
     * @group other
     */
    public function testSetDayShift(AcceptanceTester $I)
    {
        $this->_getStepItemWrapper($I);
        $I->waitForElementVisible('.green.current.highlight');
        $this->_seeAndDeleteInDatabase($I, Timesheet::$tableName, ['profession_id' => 1, 'state' => Timesheet::STATE_WORK_DAY]);
    }

    /**
     * Пометим ячейку как ночную смену
     * @param AcceptanceTester $I
     * @group other
     */
    public function testSetNigthShift(AcceptanceTester $I)
    {
        $this->_getStepItemWrapper($I, '.wtSpreader tr:nth-child(2) .htItemWrapper');
        $I->waitForElementVisible('.green.night_shift');
        $this->_seeAndDeleteInDatabase($I, Timesheet::$tableName, ['state' => Timesheet::STATE_WORK_NIGHT]);
    }

    /**
     * Ставим штраф
     * @param AcceptanceTester $I
     * @group other
     */
    public function testFine(AcceptanceTester $I)
    {
        $amount = '3000.00';
        $this->_getStepItemWrapper($I, '//div[@class="htItemWrapper"][contains(text(), "Штраф")]');
        $I->waitForElementClickable('#fineModalForm input[name="amount"]');
        $I->click('#fineModalForm input[name="amount"]');
        $I->fillField('#fineModalForm input[name="amount"]', $amount);
        $I->fillField('#fineModalForm textarea', 'ЗаполнениеКомментария');
        $I->click('#fineModalForm button.btn-primary');
        $this->_seeAndDeleteInDatabase($I, Retention::$tableName, [ 'type' => Retention::TYPE_FINE, 'date' => date('Y-m-01'), 'description' => 'ЗаполнениеКомментария', 'amount' => $amount]);
    }

    /**
     * Ставим Комментарий
     * @param AcceptanceTester $I
     * @group other
     */
    public function testSetComment(AcceptanceTester $I)
    {
        $this->_getStepItemWrapper($I, '//div[@class="htItemWrapper"][contains(text(), "Комментарий")]');
        $I->click('#commentModalForm > div.modal-body > div');
        $I->fillField('#commentModalForm textarea[name="text"]', 'ЗаполнениеКомментария');
        $I->click('#modalFooter button.btn-primary');
        $this->_seeAndDeleteInDatabase($I, Timesheet::$tableName,['date' => date('Y-m-01'), 'comment' => 'ЗаполнениеКомментария', 'state' => Timesheet::STATE_NULL]);
    }

    /**
     * Редактирование Нормочасов день
     * @param AcceptanceTester $I
     * @before _setResizeWindow
     * @group other
     */
    public function testStandardHoursDay(AcceptanceTester $I)
    {
        $hourCount = 100;
        $todayData = date('Y-m-t');

        $this->_getStepStandardHours($I, $hourCount);
        $I->click('h4[class="text-semibold"]');
        $this->_seeAndDeleteInDatabase($I, TimesheetTotalsMaster::$tableName, ['total' => $hourCount, 'date' => $todayData]);
    }

    /**
     * Редактирование Нормочасов ночь
     * @param AcceptanceTester $I
     * @before _setResizeWindow
     * @group other
     */
    public function testStandardHoursNight(AcceptanceTester $I)
    {
        $hourCount = 100;
        $todayData = date('Y-m-t');

        $this->_getStepStandardHours($I, $hourCount, 'nominatedNightHours');
        $I->click('h4[class="text-semibold"]');
        $this->_seeAndDeleteInDatabase($I, TimesheetTotalsMaster::$tableName, ['total_night' => $hourCount, 'date' => $todayData]);
    }

    /**
     * Массив для теста Надбавок
     * @return array
     */
    protected function _dataProviderSurcharges()
    {
        return $data =
            [
                ['type' => Surcharge::TYPE_TRANSPORT],
                ['type' => Surcharge::TYPE_TRANSFER],
                ['type' => Surcharge::TYPE_ACCOMMODATION],
                ['type' => Surcharge::TYPE_BOUNTY],
                ['type' => Surcharge::TYPE_MEDBOOK],
                ['type' => Surcharge::TYPE_OVERALLS],
            ];
    }

    /**
     * Выставление Надбавки в модалке
     * @param AcceptanceTester $I
     * @param Example $example
     * @dataProvider _dataProviderSurcharges
     * @before _setResizeWindow
     * @group other
     */
    public function testSetSurcharges(AcceptanceTester $I, Example $example)
    {
        $amountCount = 3000.00;
        $todayData = date('Y-m-d');;
        $I->amOnPage('master/timetable?factory_id=1&sdate=' . $todayData . '&fdate=' . date('Y-m-t') . '&view=list');
        $I->click($this->_getSelectorByColumn('clickSurcharges'));

        $I->waitForElementClickable('#surchargesModalForm select[name="type"]');
        $I->selectOption('#surchargesModalForm select[name="type"]', $example["type"]);

        $this->_fillModal($I, '#surcharges', $amountCount);
        $I->attachFile('#file', 'check-mark.png');
        $I->click('.btn-success');
        $this->_seeAndDeleteInDatabase($I, Surcharge::$tableName, ['date' => $todayData, 'amount' => $amountCount, 'type' => $example['type']]);
    }

    /**
     * Массив для теста Удержаний
     * @return array
     */
    public function _dataProviderRetention()
    {
        return $data =
            [
                ['type' => Retention::TYPE_FINE],
                ['type' => Retention::TYPE_OVERALL],
                ['type' => Retention::TYPE_UTILITIES],
                ['type' => Retention::TYPE_LUNCH],
            ];
    }

    /**
     * Создаем Удержание в моделке
     * @param AcceptanceTester $I
     * @param Example $example
     * @throws Exception
     * @dataProvider _dataProviderRetention
     * @before _setResizeWindow
     * @group other
     */
    public function testSetRetention(AcceptanceTester $I, Example $example)
    {
        $amountCount = '3000.00';
        $todayData = date('Y-m-d');
        $description = 'ЗаполнениеОписания';

        $I->amOnPage('master/timetable?factory_id=1&sdate=' . $todayData . '&fdate=' . date('Y-m-t') . '&view=list');
        $I->click($this->_getSelectorByColumn('seeRetention'));

        $I->waitForElementClickable('#retentionModalForm select[name="type"]');
        $I->selectOption('#retentionModalForm select[name="type"]', $example['type']);
        $this->_waitVisibleAndClickable($I, '#retentionModalForm', '#retentionModalForm span[id*="select2-type"]');
        $this->_fillModal($I, '#retention', $amountCount, $description);
        $I->click('#modalFooter .btn-success');
        $this->_seeAndDeleteInDatabase($I, Retention::$tableName, ['type' => $example['type'], 'description' => $description, 'amount' => $amountCount, 'date' => $todayData]);
    }

    /**
     * Фильтрация по ФИО
     * @param AcceptanceTester $I
     * @group other
     */
    public function testFilteredFIO(AcceptanceTester $I)
    {
        $I->updateInDatabase(Unit::$tableName, ['fio' => 'Михаил Тестовый Тест'], ['id' => 1]);
        $I->amOnPage('master/timetable?factory_id=1&sdate=' . date('Y-m-01') . '&fdate=' . date('Y-m-t') . '&view=list');
        $I->fillField('#fio', 'Михаил');
        $I->see('Михаил Т. Т.', '.short-name');
        $I->dontSee('Андрей Т. Т.', '#timetable-table tr:nth-child(3) span.short-name');
    }

    /**
     * Выставление Простоя в модалке
     * @param AcceptanceTester $I
     * @before _setСoefficient
     * @before _setResizeWindow
     * @group other
     */
    public function testSetOutage(AcceptanceTester $I)
    {
        $firstData = date('Y-m-01');
        $factoryId = 1;
        $I->haveInDatabase(
            Timesheet::$tableName,
            [
                'unit_id' => 1,
                'profession_id' => 1,
                'master_id' => 0,
                'factory_id' => $factoryId,
                'date' => $firstData,
                'time' => 8,
                'state' => Timesheet::STATE_CUSTOM,
            ]
        );
        $I->amOnPage('master/timetable/' . $factoryId);
        $I->click($this->_getSelectorByColumn('outageTime'));
        $this->_waitVisibleAndClickable($I);
        $I->fillField('[name="outages[]"]', 1);
        $I->click('#modalFooter > div > button.btn.btn-primary');
        $this->_seeAndDeleteInDatabase($I, Timesheet::$tableName, ['outage' => 1]);
    }

    /**
     * Не предлагает поставить простой в ночную смену и выходной
     * @param AcceptanceTester $I
     * @before _setСoefficient
     * @before _setResizeWindow
     * @group other
     *
     */
    public function testCantSetOutage(AcceptanceTester $I)
    {
        $firstData = date('Y-m-01');
        $I->haveInDatabase(
            Timesheet::$tableName,
            [
                'unit_id' => 2,
                'profession_id' => 1,
                'master_id' => 0,
                'factory_id' => 1,
                'date' => $firstData,
                'time' => 8,
                'state' => Timesheet::STATE_WORK_NIGHT,
            ]
        );
        //через базу поставить выходным в другой проверке
        $I->amOnPage('master/timetable?factory_id=1&sdate=' . $firstData . '&fdate=' . date('Y-m-t') . '&view=list');
        $I->click($this->_getSelectorByColumn('outageTime'));
        $this->_waitVisibleAndClickable($I);
        $I->dontSeeElement('[name="outages[]"]');
        $I->dontSeeElementInDOM('[name="outages[]"]');
    }
}
