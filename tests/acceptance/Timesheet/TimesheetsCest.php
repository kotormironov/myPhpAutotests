<?php

use \Codeception\Example;
use Models\Timesheet;

class TimesheetsCest
{

    public function _before(AcceptanceTester $I)
    {
        $I->init();
    }

    /*
     * TODO
     * - Использовать роли только основные
     * - Удалять созданные данные из базы после теста ($I->deleteFromDatabase(таблица, массив ключ значение для поиска в базу );)
     * - clickAndCheck разбить на 2 метода, клик уже есть можешь пока только чек свой оставить
     * - статусы и типы сущностей брать из моделей и "нн" "бл" и т.п.
     * - названия таблиц брать из моделей
     * - цифровые значения не надо писать строками
     * - убрать все @depricated методы
     * - заменить везде где надо это $count = 31 - date("t");
     */

    /**
     * Обновление времени смены в ячейке в табеле Мастера
     *
     * @param AcceptanceTester $I
     * @param Example $example
     * @throws Exception
     *
     * @example ["Manager"]
     * @example ["SuperManager"]
     * @example ["Master"]
     * @example ["SuperMaster"]
     * @example ["Admin"]
     * @example ["SuperAdmin"]
     * @example ["Hr"]
     *
     * @group smoke
     */
    public function _testTimesheetsWorkDayUpdate(AcceptanceTester $I, Example $example)
    {
        $I->login($example[0], 1);
        $I->amOnPage('/master/timetable?factory_id=1');
        $I->doubleClick('#timetable-table tr:nth-child(2) td:nth-child(4)');
        $I->fillField('#timetable-table div.handsontableInputHolder textarea', 10);
        $I->clickAndCheck('h4[class="text-semibold"]');
        $I->seeInDatabase('timesheet',
            // Timesheet::$table_name,
            [
                'unit_id' => '2',
                'profession_id' => '1',
                'factory_id' => '1',
                'time' => '10',
            ]
        );
        $I->deleteFromDatabase(Timesheet::$tableName,['unit_id' => 2]);
    }

    /**
     * Ставим прогул в табеле Мастера
     *
     * @param AcceptanceTester $I
     * @param Example $example
     * @throws Exception
     *
     * @example ["Manager"]
     * @example ["SuperManager"]
     * @example ["Master"]
     * @example ["SuperMaster"]
     * @example ["Admin"]
     * @example ["SuperAdmin"]
     * @example ["Hr"]
     *
     * @group other
     */
    public function _timesheetsWorkDayCreateOther(AcceptanceTester $I, Example $example)
    {
        $I->login($example[0], 1);
        $I->amOnPage('/master/timetable?factory_id=1');
        $I->doubleClick('table.htCore tbody tr:nth-child(2) td:nth-child(4)');
        $I->fillField('.handsontableInput', '0');

        $I->clickAndCheck('h4'); // TODO Селектор по тегу это не хорошо надо больше вложенность
        $I->see('пр', 'table.htCore tbody tr:nth-child(2) td:nth-child(4)');
        $I->waitAndSeeInDatabase('timesheet',
            // Timesheet::$table_name,
            [
                'unit_id' => '2',
                'profession_id' => '1',
                'factory_id' => '1',
                'time' => '0',
                'state' => '5',
            ]
        );
    }

    /**
     * Ставим отсуствует в табеле Мастера
     *
     * @param AcceptanceTester $I
     * @param Example $example
     * @throws Exception
     *
     * @example ["Manager"]
     * @example ["SuperManager"]
     * @example ["Master"]
     * @example ["SuperMaster"]
     * @example ["Admin"]
     * @example ["SuperAdmin"]
     * @example ["Hr"]
     *
     * @group other
     */
    public function _timesheetsWorkDayCreateNotWork(AcceptanceTester $I, Example $example)
    {
        $I->login($example[0], 1);
        $I->amOnPage('/master/timetable?factory_id=1');
        $I->doubleClick('table.htCore tbody tr:nth-child(2) td:nth-child(4)');
        $I->fillField('.handsontableInput', 'нн');
        $I->clickAndCheck('h4');
        $I->see('нн', 'table.htCore tbody tr:nth-child(2) td:nth-child(4)');
        $I->waitAndSeeInDatabase('timesheet',
            // Timesheet::$table_name,
            [
                'unit_id' => '2',
                'profession_id' => '1',
                'factory_id' => '1',
                'time' => '0',
                'state' => '10',
            ]
        );
    }

    /**
     * Ставим больничный в табель Мастера
     *
     * @param AcceptanceTester $I
     * @param Example $example
     * @throws Exception
     *
     * @example ["Manager"]
     * @example ["SuperManager"]
     * @example ["Master"]
     * @example ["SuperMaster"]
     * @example ["Admin"]
     * @example ["SuperAdmin"]
     * @example ["Hr"]
     *
     * @group other
     */
    public function _timesheetsWorkDayCreateHospital(AcceptanceTester $I, Example $example)
    {
        $I->login($example[0], 1);
        $I->amOnPage('/master/timetable?factory_id=1');
        $I->doubleClick('table.htCore tbody tr:nth-child(2) td:nth-child(4)');
        $I->fillField('.handsontableInput', 'бл');
        $I->clickAndCheck('h4');
        $I->waitAndSeeInDatabase('timesheet',
            // Timesheet::$table_name,
            [
                'unit_id' => '2',
                'profession_id' => '1',
                'factory_id' => '1',
                'time' => '0',
                'state' => '6',
            ]
        );

    }

    /**
     * Ставим выходной в табеле Мастера
     *
     * @param AcceptanceTester $I
     * @param Example $example
     * @throws Exception
     *
     * @example ["Manager"]
     * @example ["SuperManager"]
     * @example ["Master"]
     * @example ["SuperMaster"]
     * @example ["Admin"]
     * @example ["SuperAdmin"]
     * @example ["Hr"]
     *
     * @group other
     */
    public function _timesheetsWorkDayCreateWeekend(AcceptanceTester $I, Example $example)
    {
        $I->login($example[0], 1);
        $I->amOnPage('/master/timetable?factory_id=1');
        $I->doubleClick('table.htCore tbody tr:nth-child(2) td:nth-child(4)');
        $I->fillField('.handsontableInput', 'вх');
        $I->clickAndCheck('h4');
        $I->waitAndSeeInDatabase('timesheet',
            // Timesheet::$table_name,
            [
                'unit_id' => '2',
                'profession_id' => '1',
                'factory_id' => '1',
                'time' => '0',
                'state' => '4',
            ]
        );
    }

    /**
     * Ставим "+" в табеле Мастера
     *
     * @param AcceptanceTester $I
     * @param Example $example
     * @throws Exception
     *
     * @example ["Manager"]
     * @example ["SuperManager"]
     * @example ["Master"]
     * @example ["SuperMaster"]
     * @example ["Admin"]
     * @example ["SuperAdmin"]
     * @example ["Hr"]
     *
     * @group other
     */
    public function _timesheetsWorkDayCreatePlus(AcceptanceTester $I, Example $example)
    {
        $I->login($example[0], 1);
        $I->amOnPage('/master/timetable?factory_id=1');
        $I->doubleClick('table.htCore tbody tr:nth-child(2) td:nth-child(4)');
        $I->fillField('.handsontableInput', '+');
        $I->clickAndCheck('h4');
        $I->waitAndSeeInDatabase('timesheet',
            // Timesheet::$table_name,
            [
                'unit_id' => '2',
                'profession_id' => '1',
                'factory_id' => '1',
                'time' => '0',
                'state' => '9',
            ]
        );
    }

    /**
     * Пометим ячейку как дневную смену в табеле Мастера
     *
     * @param AcceptanceTester $I
     *
     * @param Example $example
     *
     * @throws Exception
     *
     * @example ["Manager"]
     * @example ["SuperManager"]
     * @example ["Master"]
     * @example ["SuperMaster"]
     * @example ["Admin"]
     * @example ["SuperAdmin"]
     * @example ["Hr"]
     *
     * @group other
     */
    public function _timesheetsCreateWorkDay(AcceptanceTester $I, Example $example)
    {
        $I->login($example[0], 1);
        $I->amOnPage('/master/timetable?factory_id=1');
        $I->clickWithRightButton('table.htCore tbody tr:nth-child(2) td:nth-child(4)');
        $I->clickAndCheck('.htItemWrapper');
        $I->seeElement('.green.current.highlight');
        $I->waitAndSeeInDatabase('timesheet',
            // Timesheet::$table_name,
            [
                'unit_id' => '2',
                'profession_id' => '1',
                'factory_id' => '1',
                'state' => '1',
            ]
        );
    }

    /**
     * Пометим ячейку как ночную смену в табеле Мастера
     *
     * @param AcceptanceTester $I
     * @param Example $example
     * @throws Exception
     *
     * @example ["Manager"]
     * @example ["SuperManager"]
     * @example ["Master"]
     * @example ["SuperMaster"]
     * @example ["Admin"]
     * @example ["SuperAdmin"]
     * @example ["Hr"]
     *
     * @group other
     */
    public function _timesheetsCreateNigthDay(AcceptanceTester $I, Example $example)
    {
        $I->login($example[0], 1);
        $I->amOnPage('/master/timetable?factory_id=1');
        $I->clickWithRightButton('table.htCore tbody tr:nth-child(2) td:nth-child(4)');
        $I->clickAndCheck('.wtSpreader tr:nth-child(2) .htItemWrapper');
        $I->seeElement('.green.night_shift');
        $I->waitAndSeeInDatabase('timesheet',
            // Timesheet::$table_name,
            [
                'unit_id' => '2',
                'profession_id' => '1',
                'factory_id' => '1',
                'state' => '2',
            ]
        );
    }

    /**
     * Ставим штраф в табеле Мастера
     *
     * @param AcceptanceTester $I
     * @param Example $example
     * @throws Exception
     *
     * @example ["Manager"]
     * @example ["SuperManager"]
     * @example ["Master"]
     * @example ["SuperMaster"]
     * @example ["Admin"]
     * @example ["SuperAdmin"]
     * @example ["Hr"]
     *
     * @group other
     */
    public function _timesheetsFine(AcceptanceTester $I, Example $example)
    {
        $I->login($example[0], 1);
        $I->amOnPage('/master/timetable?factory_id=1');
        $I->clickWithRightButton('#timetable-table tr:nth-child(2) > td:nth-child(4)');
        $I->click('//div[@class="htItemWrapper"][contains(text(), "Штраф")]');
        $I->waitForElementClickable('[name="amount"]');
        $I->click('[name="amount"]');
        $I->fillField('[name="amount"]', '3000');
        $I->fillField('#fineModalForm textarea', 'ЗаполнениеКомментария');
        $I->clickAndCheck('#fineModalForm button.btn-primary');
        $I->waitAndSeeInDatabase('retentions',
            [
                'unit_id' => '2',
                'type' => '1',
                'date' => date('Y-m-01'),
                'description' => 'ЗаполнениеКомментария',
                'amount' => '3000.00',
            ]
        );
    }

    /**
     * Ставим Комментарий в табеле Мастера
     *
     * @param AcceptanceTester $I
     * @param Example $example
     * @throws Exception
     *
     * @example ["Manager"]
     * @example ["SuperManager"]
     * @example ["Master"]
     * @example ["SuperMaster"]
     * @example ["Admin"]
     * @example ["SuperAdmin"]
     * @example ["Hr"]
     *
     * @group other
     */
    public function _timesheetsComment(AcceptanceTester $I, Example $example)
    {
        $I->login($example[0], 1);
        $I->amOnPage('/master/timetable?factory_id=1');
        $I->clickWithRightButton('#timetable-table tr:nth-child(2) > td:nth-child(4)');
        $I->click('//div[@class="htItemWrapper"][contains(text(), "Комментарий")]');
        $I->waitForElementClickable('[name="text"]');
        $I->click('[name="text"]');
        $I->fillField('[name="text"]', 'ЗаполнениеКомментария');
        $I->clickAndCheck('#modalFooter button.btn-primary');
        $I->waitAndSeeInDatabase('timesheet',
            [
                'unit_id' => '2',
                'date' => date('Y-m-01'),
                'factory_id' => '1',
                'comment' => 'ЗаполнениеКомментария',
                'state' => '0',
            ]
        );
    }

//    /**
//     * Смотрим штраф
//     * !!!!!!Не понятно, как это сделать. Не вижу коммент в теле, видел в скрипте, но сейчас не очень
//     *
//     * @param AcceptanceTester $I
//     * @param Example $example
//     * @throws Exception
//     *
//     * @example ["Manager"]
//     * @ example ["SuperManager"]
//     * @ example ["Master"]
//     * @ example ["SuperMaster"]
//     * @ example ["Admin"]
//     * @ example ["SuperAdmin"]
//     * @ example ["Hr"]
//     * @ example ["Accountant"]
//     * @ example ["SuperAccountant"]
//     *
//     * @group other
//     */
//    public function _timesheetsSeeComment(AcceptanceTester $I, Example $example)
//    {
//        $I->haveInDatabase('timesheet',
//            [
//                'unit_id' => '2',
//                'date' => date('Y-m-01'),
//                'factory_id' => '1',
//                'comment' => 'ЗаполнениеКомментария',
//                'state' => '0',
//                'profession_id' => '1',
//                'master_id' => '2',
//            ]
//        );
//        $I->login($example[0], 1);
//        $I->resizeWindow('3000', '1080');
//        $I->amOnPage('/master/timetable?factory_id=1');
//        $I->moveMouseOver('#timetable-table tr:nth-child(2) > td:nth-child(4)');
////        $I->waitForElementVisible('.htCommentTextArea');
//        $I->wait(160);
//        $I->seeInSource('"comment":"ЗаполнениеКомментария"', '');
////        $I->executeJS();
//        $I->seeInPageSource('ЗаполнениеКомментария');
//
////        $I->grab
//    }

    // +-----------------------------------------+
    // |          Параметры предприятия          |
    // +-----------------------------------------+

    /**
     * Сохраняем параметры предприятия
     *
     * @param AcceptanceTester $I
     * @param Example $example
     * @throws Exception
     *
     * @example ["Manager"]
     * @example ["SuperManager"]
     * @example ["Master"]
     * @example ["SuperMaster"]
     *
     * @group other
     */
    public function _timesheetsParams(AcceptanceTester $I, Example $example)
    {
        $I->login($example[0], 1);
        $I->amOnPage('/master/timetable?factory_id=1');
        $I->fillFieldMulti(
            [
                '[name="outage_multiplier"]' => '1.1',
                '[name="night_shift_multiplier"]' => '1.4',
                '[name="number"]' => 'Номер договора',
                '[name="address"]' => 'Адрес предприятия',
                '[name="info"]' => 'Специфика предприятия',
            ]
        );

        $I->clickMulti(
            [
                '#outage',
            ]
        );
        $I->clickAndCheck('#factoryMetaForm > div.text-right > button');
        $I->waitAndSeeInDatabaseMulti(
            [
                'factory_meta' => [
                    ['key' => 'outage', 'value' => '1', 'factory_id' => '1'],
                    ['key' => 'outage_multiplier', 'value' => '1.1', 'factory_id' => '1'],
                    ['key' => 'night_shift_multiplier', 'value' => '1.4', 'factory_id' => '1'],
                    ['key' => 'info', 'value' => 'Специфика предприятия', 'factory_id' => '1'],
                    ['key' => 'address', 'value' => 'Адрес предприятия', 'factory_id' => '1'],
                    ['key' => 'number', 'value' => 'Номер договора', 'factory_id' => '1'],
                ],
            ]
        );
    }

    /**
     * Сохраняем смены предприятия
     *
     * @param AcceptanceTester $I
     *
     * @param Example $example
     *
     * @throws Exception
     *
     * @example ["Manager"]
     * @example ["SuperManager"]
     * @example ["Master"]
     * @example ["SuperMaster"]
     * @example ["Admin"]
     * @example ["SuperAdmin"]
     *
     * @group other
     */
    public function _testTimesheetsChange(AcceptanceTester $I, Example $example)
    {
        $I->login($example[0], 1);
        $I->amOnPage('/master/timetable?factory_id=1');
        $I->fillField('[name="day_time"]', '10');
        $I->fillField('[name="night_time"]', '11');
        $I->clickAndCheck('#shiftTimeForm button');
        $I->waitAndSeeInDatabaseMulti(
            [
                'shift_time' => [
                    [
                        'id' => '1',
                        'factory_id' => '1',
                        'type' => '1',
                        'hours' => '10',
                    ],
                    [
                        'id' => '2',
                        'factory_id' => '1',
                        'type' => '2',
                        'hours' => '11',
                    ],
                ],
            ]
        );
    }

    /**
     * Редактирование Нормочасов день
     *
     * @param AcceptanceTester $I
     *
     * @param Example $example
     *
     * @throws Exception
     *
     * @example ["Manager"]
     * @example ["SuperManager"]
     * @example ["Master"]
     * @example ["SuperMaster"]
     * @example ["Admin"]
     * @example ["SuperAdmin"]
     * @example ["Hr"]
     *
     * @group other
     */
    public function _testTimesheetsHoursDay(AcceptanceTester $I, Example $example)
    {
        // Номер колонки с НЧ, меняется в зависимости от кол-ва дней в месяце
        $realHourColNum = 36+ 31 - date('t');

        $I->resizeWindow('3000', '1080');
        $I->login($example[0], 1);
        $I->amOnPage('/master/timetable?factory_id=1&sdate='.date('Y-m-d').'&fdate='.date('Y-m-t').'&view=list');
        $I->doubleClick('#timetable-table tr:nth-child(2) > td:nth-child('.$realHourColNum.')');
        $I->fillField('.handsontableInput', '100');
        $I->click('h4');
        $I->waitAndSeeInDatabase('timesheet_totals_master', ['factory_id' => '1', 'total' => '100', 'date' => date('Y-m-t')]);
    }

    /**
     * Редактирование Нормочасов ночь
     *
     * @param AcceptanceTester $I
     *
     * @param Example $example
     *
     * @throws Exception
     *
     * @example ["Manager"]
     * @example ["SuperManager"]
     * @example ["Master"]
     * @example ["SuperMaster"]
     * @example ["Admin"]
     * @example ["SuperAdmin"]
     * @example ["Hr"]
     *
     * @group other
     *
     */
    public function _testTimesheetsNight(AcceptanceTester $I, Example $example)
    {
        $count = 31 - date("t"); // для гибкого выбора Нормочаса

        $I->resizeWindow('3000', '1080');
        $I->login($example[0], 1);
        $I->amOnPage('/master/timetable?factory_id=1&sdate='.date('Y-m-d').'&fdate='.date('Y-m-t').'&view=list');
        $I->doubleClick('#timetable-table tr:nth-child(2) > td:nth-child('.(37+$count).')');
        $I->fillField('.handsontableInput', '100');
        $I->click('h4');
        $I->waitAndSeeInDatabase('timesheet_totals_master', ['factory_id' => '1', 'total_night' => '100', 'date' => date('Y-m-t')]);
    }

    /**
     * Массив для теста Надбавок
     *
     * @return array
     */
    protected function selectSurcharges()
    {
        $userName =
            [
                'Manager',
                'SuperManager',
                'Master',
                'SuperMaster',
//                'Admin', Не могу выдать. Говорит, что нет подходячего периода работы. Хотя он есть
//                'SuperAdmin',
            'Hr',
        ];
        $select =
            [
                '1' => 'сменный проезд',
                '2' => 'однократный проезд',
                '3' => 'проживание',
                '4' => 'премия',
                '5' => 'медицинская книжка',
                '6' => 'спецодежда и инструменты'
            ];
        $data = [];
        foreach ($userName as $value) {
            foreach ($select as $key => $valueSelect) {
                $data[] = [
                    'login' => $value,
                    'select' => $valueSelect,
                    'type' => $key,
                ];
            }
        }
        return $data;
    }

    /**
     * Выставление Надбавки в модалке
     *
     * @param AcceptanceTester $I
     * @param Example $example
     * @throws Exception
     * @dataProvider selectSurcharges
     * @group other
     */
    public function _testTimesheetSurcharges(AcceptanceTester $I, Example $example)
    {
        $count = 31 - date("t"); // для гибкого выбора
        $I->resizeWindow('3000', '1080');

        $I->login($example['login'], 1);
        $I->amOnPage('/master/timetable?factory_id=1&sdate='.date('Y-m-d').'&fdate='.date('Y-m-t').'&view=list');
        $I->click('#timetable-table tr:nth-child(2) > td:nth-child('.(44+$count).')');
        $I->waitForElementVisible('#surchargesModalForm');
        $I->waitForElementClickable('#surchargesModalForm span[id*="select2-type"]');

        $I->click('#surchargesModalForm span[id*="select2-type"]');
        $I->waitForElementVisible('//li[contains(text(),"'.$example["select"].'")] [contains (@id, "select2-type")]', 10);
        $I->waitForElementClickable('//li[contains(text(),"'.$example["select"].'")] [contains (@id, "select2-type")]', 10);
        $I->click('//li[contains(text(),"'.$example["select"].'")] [contains (@id, "select2-type")]');
        $I->click('#surchargesModalForm [name="date"]');
        $I->click('#surchargesModalForm [data-pick="'.strtotime(date('Y-m-d')) . '000"]');

        $I->fillFieldMulti([
            '#surchargesModalForm [name="title"]' => 'ЗаполнениеОписания',
            '#surchargesModalForm [name="amount"]' => '3000',
        ]);
        $I->attachFile('#file', 'check-mark.png');
        $I->clickAndCheck('.btn-success');
        $I->waitAndSeeInDatabase('surcharges',
            [
                'date' => date('Y-m-d'),
                'amount' => '3000',
                'type' => $example['type'],
                'file' => '1',
                'unit_id' => '2'
            ]
        );
    }

    /**
     * Массив для теста Удержаний
     *
     * @return array
     */
    protected function selectRetention()
    {
        $userName =
            [
                'Manager',
                'SuperManager',
                'Master',
                'SuperMaster',
//                'Admin',    говорит, что нет подходящего периода. Оно он есть
//                'SuperAdmin',
            'Hr',
        ];
        $select =
            [
                '1' => 'штраф',
                '2' => 'спецодежда',
                '4' => 'коммунальные услуги',
                '5' => 'обед',
            ];
        $data = [];
        foreach ($userName as $value) {
            foreach ($select as $key=>$valueSelect) {
                $data[] = [
                    'userName' => $value,
                    'select' => $valueSelect,
                    'type' => $key,
                ];
            }
        }
        return $data;
    }

    /**
     * Создаем Удержание в моделке
     *
     * @param AcceptanceTester $I
     * @param Example $example
     * @throws Exception
     *
     * @dataProvider selectRetention
     * @group other
     */
    public function _testTimesheetsCreateRetention(AcceptanceTester $I, Example $example)
    {
        $count = 31 - date("t"); // для гибкого выбора
        $I->resizeWindow('3000', '1080');

        $I->login($example['userName'], 1);
        $I->amOnPage('/master/timetable?factory_id=1&sdate='.date('Y-m-d').'&fdate='.date('Y-m-t').'&view=list');
        $I->click('#timetable-table tr:nth-child(2) > td:nth-child('.(45+$count).')');

        $I->waitForElementVisible('#retentionModalForm');
        $I->waitForElementClickable('#retentionModalForm span[id*="select2-type"]');
        $I->click('#retentionModalForm span[id*="select2-type"]');

        $I->waitForElementVisible('//li[contains(text(),"'.$example["select"].'")] [contains (@id, "select2-type")]', 10);
        $I->waitForElementClickable('//li[contains(text(),"'.$example["select"].'")] [contains (@id, "select2-type")]', 10);
        $I->click('//li[contains(text(),"'.$example["select"].'")] [contains (@id, "select2-type")]');

        $I->click('#retentionModalForm [name="date"]');
        $I->click('#retentionModalForm [data-pick="'.strtotime(date('Y-m-d')) . '000"]');
        $I->fillFieldMulti(
            [
                '#retentionModalForm [name="title"]' => 'ЗаполнениеОписания',
                '#retentionModalForm [name="amount"]' => 3000,
            ]);
        $I->clickAndCheck('#modalFooter .btn-success');
        try {
            date('Y-m-d') === $I->grabColumnFromDatabase('retentions', 'Date created_at', ['date' => date('Y-m-d')]);
        } catch (Exception $e) {
            echo 'Дата не совпадает: ',  $e->getMessage(), "\n";
        }
        $I->waitAndSeeInDatabase('retentions',
            [
                'unit_id' => '2',
                'type' => $example['type'],
                'description' => 'ЗаполнениеОписания',
                'amount' => '3000',
                'date' => date('Y-m-d'),
            ]
        );
    }

    /**
     * Видим Удержания в модалке
     *
     * @param AcceptanceTester $I
     * @param Example $example
     * @throws Exception
     *
     * @dataProvider selectRetention
     * @group other
     */
    public function _testTimesheetsSeeRetention(AcceptanceTester $I, Example $example)
    {
        $count = 31 - date("t"); // для гибкого выбора
        $I->resizeWindow('3000', '1080');
        $I->haveInDatabase('retentions',
            [
                'unit_id' => '2',
                'type' => $example['type'],
                'description' => 'ЗаполнениеОписания',
                'amount' => '3000',
                'date' => date('Y-m-d'),
                'created_at' => date('Y-m-d'),
                'updated_at' => date('Y-m-d'),
                'user_id' => '1',
            ]
        );

        $I->login($example['userName'], 1);
        $I->amOnPage('/master/timetable?factory_id=1&sdate='.date('Y-m-d').'&fdate='.date('Y-m-t').'&view=list');
        $I->click('#timetable-table tr:nth-child(2) > td:nth-child('.(45+$count).')');
        $I->waitForElementVisible('#retentionsTableBody td:nth-child(1)');
        $I->waitForElementClickable('#retentionsTableBody td:nth-child(1)');
        $I->seeMulti(
            [
                date('d.m.Y') => '#retentionsTableBody td:nth-child(1)',
                $example['select'] => '#retentionsTableBody td:nth-child(2)',
                'ЗаполнениеОписания' => '#retentionsTableBody td:nth-child(3)',
                3000 =>'#retentionsTableBody td:nth-child(4)'
            ]
        );
    }

    /**
     * Фильтрация по ФИО
     *
     * @param AcceptanceTester $I
     * @param Example $example
     * @throws Exception
     *
     * @example ["Manager"]
     * @example ["SuperManager"]
     * @example ["Recruiter"]
     * @example ["SuperRecruiter"]
     * @example ["Master"]
     * @example ["SuperMaster"]
     * @example ["Curator"]
     * @example ["SuperCurator"]
     * @example ["Admin"]
     * @example ["SuperAdmin"]
     * @example ["Hr"]
     *
     * @group other
     */
    public function _testTimesheetsFilteredFIO(AcceptanceTester $I, Example $example)
    {
        $I->updateInDatabase('ev_units', ['fio' => 'Михаил Тестовый Тест'], ['id' => '1']);
        $I->haveInDatabase('work_date',
            [
                'unit_id' => '1',
                'applied_at' => date('Y-m-01'),
                'profession_id' => '1',
                'class' => '1;9',
                'factory_id' => '1',
                'is_current' => '1',
                'work_by' => '3',
                'rate' => '200'
            ]
        );
        $I->login($example[0], 1);
        $I->amOnPage('/master/timetable?factory_id=1&sdate='.date('Y-m-01').'&fdate='.date('Y-m-t').'&view=list');
        $I->fillField('#fio', 'Михаил');
        $I->see('Михаил Т. Т.', '.short-name');
        $I->dontSee('Андрей Т. Т.', '#timetable-table tr:nth-child(3) span.short-name');
    }

    /**
     * Считаем отработанные часы и зарплату (ночные часы)
     *
     * @param AcceptanceTester $I
     * @param Example $example
     * @throws Exception
     *
     * @example ["Manager"]
     * @example ["SuperManager"]
     * @example ["Recruiter"]
     * @example ["SuperRecruiter"]
     * @example ["Master"]
     * @example ["SuperMaster"]
     * @example ["Curator"]
     * @example ["SuperCurator"]
     * @example ["Admin"]
     * @example ["SuperAdmin"]
     * @example ["Hr"]
     *
     * @group other
     */
    public function _testTimesheetsSalary(AcceptanceTester $I, Example $example)
    {
        $count = 31 - date("t"); // для гибкого выбора
        $I->resizeWindow('3000', '1080');

        $I->login($example[0], 1);
        $I->haveInDatabase('timesheet',
            // Timesheet::$table_name,
            [
                'unit_id' => '1',
                'profession_id' => '1',
                'master_id' => '0',
                'factory_id' => '1',
                'date' => date('Y-m-01'),
                'time' => '8',
                'state' => '8',
            ]
        );
        $I->updateInDatabase('work_date',
            // WorkDate::$table_name,
            [
                'unit_id' => '1',
                'profession_id' => '1',
                'factory_id' => '1',
                'rate' => '200',
                'class' => '0',
            ]
        );
        $I->amOnPage('/master/timetable?factory_id=1&sdate='.date('Y-m-d').'&fdate='.date('Y-m-t').'&view=list');
        $I->see('1600', '#timetable-table tr:nth-child(2) > td:nth-child('.(43+$count).')');
        $I->see('8', '#timetable-table tr:nth-child(2) > td:nth-child('.(35+$count).')');
    }

    /**
     * Выставление Простоя в модалке
     * @param AcceptanceTester $I
     * @param Example $example
     * @throws Exception
     *
     * @example ["Manager"]
     * @example ["SuperManager"]
     * @example ["Master"]
     * @example ["SuperMaster"]
     * @example ["Curator"]
     * @example ["SuperCurator"]
     * @example ["Admin"]
     * @example ["SuperAdmin"]
     * @example ["Hr"]
     *
     * @group other
     */
    public function _testTimesheetCreateOutages(AcceptanceTester $I, Example $example)
    {
        $count = 31 - date("t"); // для гибкого выбора
        $I->resizeWindow('3000', '1080');
        $I->haveInDatabase('timesheet',
            // Timesheet::$table_name,
            [
                'unit_id' => '2',
                'profession_id' => '1',
                'master_id' => '0',
                'factory_id' => '1',
                'date' => '2021-07-01',
                'time' => '8',
                'state' => '8',
            ]
        );
        $I->haveInDatabaseMulti(
            [
                'factory_meta' => [
                    ['key' => 'outage', 'value' => '1', 'factory_id' => '1'],
                    ['key' => 'outage_multiplier', 'value' => '1.1', 'factory_id' => '1'],
                ],
            ]
        );
        $I->login($example[0], 1);
        $I->amOnPage('/master/timetable?factory_id=1&sdate=2021-07-01&fdate=2021-07-31&view=list');
        $I->click('#timetable-table tr:nth-child(2) > td:nth-child('.(38+$count).')');
        $I->waitForElementVisible('#outageModal .modal-content');
        $I->waitForElementClickable('#outageModal .modal-content');
        $I->fillFieldMulti([
            '[name="outages[]"]' => 1,
        ]);
        $I->click('#modalFooter > div > button.btn.btn-primary');
        $I->waitAndSeeInDatabase('timesheet', ['outage' => '1', 'factory_id' => '1']);
    }

    /**
     * Смотрю Простой
     * @param AcceptanceTester $I
     *
     * @param Example $example
     *
     * @throws Exception
     *
     * @example ["Manager"]
     * @example ["SuperManager"]
     * @example ["Master"]
     * @example ["SuperMaster"]
     * @example ["Curator"]
     * @example ["SuperCurator"]
     * @example ["Admin"]
     * @example ["SuperAdmin"]
     * @example ["Hr"]
     *
     * @group other
     */
    public function _testTimesheetsSeeOutages(AcceptanceTester $I, Example $example)
    {
        $count = 31 - date("t"); // для гибкого выбора
        $I->resizeWindow('3000', '1080');

        $I->haveInDatabase('timesheet',
            // Timesheet::$table_name,
            [
                'unit_id' => '2',
                'profession_id' => '1',
                'master_id' => '0',
                'factory_id' => '1',
                'date' => '2021-07-01',
                'time' => '8',
                'state' => '8',
            ]
        );
        $I->haveInDatabaseMulti(
            [
                'factory_meta' => [
                    ['key' => 'outage', 'value' => '1', 'factory_id' => '1'],
                    ['key' => 'outage_multiplier', 'value' => '1.1', 'factory_id' => '1'],
                ],
            ]
        );
        $I->updateInDatabase('timesheet', ['outage' => '1'], ['factory_id' => '1']);

        $I->login($example[0], 1);
        $I->amOnPage('/master/timetable?factory_id=1&sdate=2021-07-01&fdate=2021-07-31&view=list');

        $I->see('1', '#timetable-table tr:nth-child(2) > td:nth-child('.(38+$count).')');
        $I->click('#timetable-table tr:nth-child(2) > td:nth-child('.(38+$count).')');

        $I->waitForElementVisible('#outageTableBody');
        $I->see('1', '#outageTableBody');
    }

    /**
     * Не предлагает поставить простой в ночную смену и выходной
     * @param AcceptanceTester $I
     * @param Example $example
     * @throws Exception
     *
     * @example ["Manager"]
     * @example ["SuperManager"]
     * @example ["Recruiter"]
     * @example ["SuperRecruiter"]
     * @example ["Master"]
     * @example ["SuperMaster"]
     * @example ["Curator"]
     * @example ["SuperCurator"]
     * @example ["Admin"]
     * @example ["SuperAdmin"]
     * @example ["Hr"]
     *
     * @group other
     *
     */
    public function _testTimesheetsDontSeeOutages(AcceptanceTester $I, Example $example)
    {
        $count = 31 - date("t"); // для гибкого выбора
        $I->resizeWindow('3000', '1080');

        $I->haveInDatabase('timesheet',
            // Timesheet::$table_name,
            [
                'unit_id' => '2',
                'profession_id' => '1',
                'master_id' => '0',
                'factory_id' => '1',
                'date' => '2021-07-01',
                'time' => '8',
                'state' => '2',
            ]
        );
        $I->haveInDatabaseMulti(
            [
                'factory_meta' => [
                    ['key' => 'outage', 'value' => '1', 'factory_id' => '1'],
                    ['key' => 'outage_multiplier', 'value' => '1.1', 'factory_id' => '1'],
                ],
            ]
        );

        //через базу поставить выходным в другой проверке
        $I->login($example[0], 1);
        $I->amOnPage('/master/timetable?factory_id=1&sdate=2021-07-01&fdate=2021-07-31&view=list');
        $I->click('#timetable-table tr:nth-child(2) > td:nth-child('.(38+$count).')');
        $I->waitForElementVisible('#outageModal .modal-content');
        $I->waitForElementClickable('#outageModal .modal-content');
        $I->dontSeeElement('[name="outages[]"]');
        $I->dontSeeElementInDOM('[name="outages[]"]');
    }

    /**
     * Видим иконки договоров
     *
     * @param AcceptanceTester $I
     *
     * @param Example $example
     *
     * @throws Exception
     *
     * @example ["Manager", ['01.04.2021', '02.04.2021']]
     * @example ["SuperManager", ['01.04.2021', '02.04.2021']]
     * @example ["Recruiter", ['01.04.2021', '02.04.2021']]
     * @example ["SuperRecruiter", ['01.04.2021', '02.04.2021']]
     * @example ["Master", ['01.04.2021', '02.04.2021']]
     * @example ["SuperMaster", ['01.04.2021', '02.04.2021']]
     * @example ["Curator", ['01.04.2021', '02.04.2021']]
     * @example ["SuperCurator", ['01.04.2021', '02.04.2021']]
     * @example ["Contact", ['01.04.2021', '02.04.2021']]
     * @example ["SuperContact", ['01.04.2021', '02.04.2021']]
     * @example ["Redactor", ['01.04.2021', '02.04.2021']]
     * @example ["SuperRedactor", ['01.04.2021', '02.04.2021']]
     * @example ["Admin", ['01.04.2021', '02.04.2021']]
     * @example ["SuperAdmin", ['01.04.2021', '02.04.2021']]
     * @example ["Hr", ['01.04.2021', '02.04.2021']]
     * @example ["Accountant", ['01.04.2021', '02.04.2021']]
     * @example ["SuperAccountant", ['01.04.2021', '02.04.2021']]
     * @example ["RecruitmentAgency", ['01.04.2021', '02.04.2021']]
     * @example ["SuperRecruitmentAgency", ['01.04.2021', '02.04.2021']]
     * @example ["Client", ['01.04.2021', '02.04.2021']]
     * @example ["SuperClient", ['01.04.2021', '02.04.2021']]
     * @example ["CuratorOfClient", ['01.04.2021', '02.04.2021']]
     * @example ["SuperCuratorOfClient", ['01.04.2021', '02.04.2021']]
     *
     * @skip Не доделана база
     *
     * А надо ли это вообще?
     *
     */
    // public function _testTimesheetsSeeIcon(AcceptanceTester $I, Example $example)
    // {
    //     $I->login($example[0], 1);
    //     $I->amOnPage('/master/timetable?factory_id=1&sdate=2020-04-01&fdate=2020-04-30&view=list');
    //     $I->seeElement('');
    //     $I->dontSee($example[1], '#outageTableBody td:nth-child(1)');
    // }

    /**
     * Мастер сдает табель
     * !!!!!Сделать запросы на подготовку табеля к сдаче.
     *
     * @param AcceptanceTester $I
     *
     * @param Example $example
     *
     * @throws Exception
     *
     * @example ["Manager"]
     * @example ["SuperManager"]
     * @example ["Recruiter"]
     * @example ["SuperRecruiter"]
     * @example ["Master"]
     * @example ["SuperMaster"]
     * @example ["Curator"]
     * @example ["SuperCurator"]
     * @example ["Contact"]
     * @example ["SuperContact"]
     * @example ["Redactor"]
     * @example ["SuperRedactor"]
     * @example ["Admin"]
     * @example ["SuperAdmin"]
     * @example ["Hr"]
     * @example ["Accountant"]
     * @example ["SuperAccountant"]
     * @example ["RecruitmentAgency"]
     * @example ["SuperRecruitmentAgency"]
     * @example ["Client"]
     * @example ["SuperClient"]
     * @example ["CuratorOfClient"]
     * @example ["SuperCuratorOfClient"]
     *
     * @group other
     */
    // public function testTimesheetsCheckMaster(AcceptanceTester $I, Example $example)
    // {
    //     $I->login($example[0], 1);
    //     $I->amOnPage('/master/timetable?action=check&sdate='.date('Y-m-1').'&fdate='.date('date("Y-m-d", strtotime("last day of this month")').'&factory_id=1');
    //     $I->clickAndCheck('.btn-success.pull-right');
    //     // $I->waitAndSeeInDatabase([]);//смотреть изменение статуса
    // }

    /**
     * Мастер сдает табель
     * !!!!!Сделать запросы на подготовку табеля к сдаче
     *
     * @param AcceptanceTester $I
     *
     * @param Example $example
     *
     * @throws Exception
     *
     * @example ["Manager"]
     * @example ["SuperManager"]
     * @example ["Recruiter"]
     * @example ["SuperRecruiter"]
     * @example ["Master"]
     * @example ["SuperMaster"]
     * @example ["Curator"]
     * @example ["SuperCurator"]
     * @example ["Contact"]
     * @example ["SuperContact"]
     * @example ["Redactor"]
     * @example ["SuperRedactor"]
     * @example ["Admin"]
     * @example ["SuperAdmin"]
     * @example ["Hr"]
     * @example ["Accountant"]
     * @example ["SuperAccountant"]
     * @example ["RecruitmentAgency"]
     * @example ["SuperRecruitmentAgency"]
     * @example ["Client"]
     * @example ["SuperClient"]
     * @example ["CuratorOfClient"]
     * @example ["SuperCuratorOfClient"]
     *
     * @skip Не доделана база
     *
     */
    // public function _testTimesheetsCheckCuator(AcceptanceTester $I, Example $example)
    // {
    //     $I->login($example[0], 1);
    //     $I->amOnPage('/master/timetable?action=check&sdate='.date('Y-m-1').'&fdate='.date('date("Y-m-d", strtotime("last day of this month")').'&factory_id=1');
    //     $I->clickAndCheck('.btn-success.pull-right');
    //     $I->waitAndSeeInDatabase([]);//смотреть изменение статуса
    // }

}
