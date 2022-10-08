<?php

use Core\Models\Acl;
use Crons\CalcWorkDateWorkedTime;
use Models\Timesheet;
use Models\TimesheetTotalsMaster;
use Models\Unit;
use Models\WorkDate;


class WorkStatisticsCest
{

    public function _before(AcceptanceTester $I)
    {
        $factoryId = 1;
        $professionId = 1;
        $unitId = 1;
        $unitId2 = 2;
        $masterId = Acl::ROLE_MASTER;

        $firstDayLastMonth = date('Y-m-01', strtotime('-1 month'));
        $lastDayLastMonth = date('Y-m-t', strtotime('-1 month'));

        $workDateDate = [
            'applied_at' => $firstDayLastMonth,
            'profession_id' => $professionId,
            'factory_id' => $factoryId,
            'work_by' => 3,
            'rate' => 200,
            'request_id' => 1,
        ];

        $workDateDate['id'] = 2;
        $workDateDate['unit_id'] = $unitId2;
        $I->haveInDatabase(WorkDate::$tableName, $workDateDate);
        $workDateDate['id'] = 1;
        $workDateDate['unit_id'] = $unitId;
        $workDateDate['fired_at'] = $lastDayLastMonth;
        $workDateDate['is_current'] = 0;
        $workDateDate['is_fired'] = 1;
        $I->haveInDatabase(WorkDate::$tableName, $workDateDate);

        $timesheetTotalsMaster = ['factory_id' => $factoryId, 'profession_id' => $professionId, 'rate' => 200, 'unit_id' => $unitId, 'user_id' => $masterId, 'work_date_id' => 1, 'date' => $lastDayLastMonth];
        $I->haveInDatabase(TimesheetTotalsMaster::$tableName, $timesheetTotalsMaster);
        $timesheetTotalsMaster['unit_id'] = $unitId2;
        $timesheetTotalsMaster['work_date_id'] = 2;
        $I->haveInDatabase(TimesheetTotalsMaster::$tableName, $timesheetTotalsMaster);

        $timesheetData = ['unit_id' => $unitId, 'factory_id' => $factoryId, 'profession_id' => $professionId, 'master_id' => $masterId, 'state' => Timesheet::STATE_WORK_DAY, 'time' => 12.00];
        for ($i = 0; $i <= 5; $i++) {
            $timesheetData['date'] = date('Y-m-d', strtotime($firstDayLastMonth . ' +' . $i . ' day'));
            $I->haveInDatabase(Timesheet::$tableName, $timesheetData);
        }
        $timesheetData['date'] = date('Y-m-d', strtotime($firstDayLastMonth . ' +' . $i . ' day'));
        $timesheetData['time'] = 7;
        $I->haveInDatabase(Timesheet::$tableName, $timesheetData);

        $timesheetData = ['unit_id' => $unitId2, 'factory_id' => $factoryId, 'profession_id' => $professionId, 'master_id' => 103, 'state' => Timesheet::STATE_WORK_DAY, 'time' => 10.00];
        for ($i = 0; $i < 8; $i++) {
            $timesheetData['date'] = date('Y-m-d', strtotime($firstDayLastMonth . ' +' . $i . ' day'));
            $I->haveInDatabase(Timesheet::$tableName, $timesheetData);
        }

        (new CalcWorkDateWorkedTime($firstDayLastMonth))->showOutput(false)->showEcho(false)->execute();
    }

    protected function setState(AcceptanceTester $I, int $unitId, string $firstDayLastMonth, int $factoryId, int $professionId, int $workDateId)
    {
        $masterId = Acl::ROLE_MASTER;

        $timesheetData = [
            'unit_id' => $unitId,
            'profession_id' => $professionId,
            'master_id' => $masterId,
            'factory_id' => $factoryId,
            'state' => Timesheet::STATE_WORK_DAY,
            'time' => 12.00,
        ];
        for ($i = 0; $i <= 5; $i++) {
            $timesheetData['date'] = date('Y-m-d', strtotime($firstDayLastMonth . ' +' . $i . ' day'));
            $I->haveInDatabase(Timesheet::$tableName, $timesheetData);
        }
        $timesheetData['date'] = date('Y-m-d', strtotime($firstDayLastMonth . ' +' . $i . ' day'));
        $timesheetData['time'] = 7;
        $I->haveInDatabase(Timesheet::$tableName, $timesheetData);

        $I->haveInDatabase(WorkDate::$tableName,
            [
                'id' => $workDateId,
                'unit_id' => $unitId,
                'applied_at' => $firstDayLastMonth,
                'profession_id' => $professionId,
                'class' => '1;9',
                'factory_id' => $factoryId,
                'rate' => 200,
                'request_id' => 1,
                'deleted' => 'false',
                'work_by' => 2,
            ]
        );
        $I->haveInDatabase(TimesheetTotalsMaster::$tableName,
            [
                'factory_id' => $factoryId,
                'profession_id' => $professionId,
                'rate' => 200,
                'unit_id' => $unitId,
                'user_id' => $masterId,
                'work_date_id' => 3,
                'date' => date('Y-m-t', strtotime('-1 month')),
            ]
        );
    }

    /**
     * Видим строку
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function _testSeeList(AcceptanceTester $I)
    {
        $I->login(USERNAME_MANAGER);
        $I->amOnPage('/statistic/work');
        $I->waitForText('Предприятие1', 5, '#work > tbody th:nth-child(1)');
        $I->waitForText('Профессия1', 5, '#work > tbody tr.profession-row td:nth-child(1)');
        $I->waitForText('M', 5, '#work > tbody > tr.fio-row.success.pay > td:nth-child(2)');
        $I->waitForText('Master', 5, '#work > tbody > tr.fio-row.success.pay > td:nth-child(2)');
        $I->waitForText('Предприятие1', 5, '#work tr.fio-row.success.pay > td:nth-child(3)');
        $I->waitForText('Профессия1', 5, '#work tr.fio-row.success.pay > td:nth-child(4)');
        $I->waitForText('Тестовый Тест Тестович2', 5, '#work tr.fio-row.success.pay > td:nth-child(5)');
        $I->waitForText(date('01.m.Y', strtotime('-1 month')), 5, '#work tr.fio-row.success.pay > td:nth-child(7)');
        $I->waitForText('Тестовый_источник_звонка1', 5, '#work tr.fio-row.success.pay > td:nth-child(10)');
        $I->seeElement('.icon-gift.text-warning-400');
        $I->waitForText('80.00', 5, '#work > tbody > tr.fio-row.success.pay > td:nth-child(9)');
        // Уволенный
        $I->waitForText('Тестовый Тест Тестович', 5, '#work > tbody > tr.fio-row.danger > td:nth-child(5)');
        $I->waitForText('2', 5, '#work > tfoot td:nth-child(2)');
    }

    /**
     * Видим фильтрованную строку списка
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function _testSeeListFiltered(AcceptanceTester $I)
    {
        $factoryId = 1;
        $factoryId2 = 2;
        $professionId = 1;
        $professionId2 = 2;
        $unitId3 = 3;
        $unitId4 = 4;
        $masterId = Acl::ROLE_MASTER;

        $firstDayLastMonth = date('Y-m-01', strtotime('-1 month'));
        $lastDayLastMonth = date('Y-m-t', strtotime('-1 month'));

        $I->haveInDatabase(Unit::$tableName,
            [
                'id' => 4,
                'fio' => 'Тестовый Тест Тестович4',
                'feedback' => 1,
                'status' => '1',
                'location' => 'Тестовый город2',
                'bdate' => '1989-12-20',
                'created_by' => $masterId,
                'citizenship_id' => 1,
                'email' => 'kotor3@gmail.com',
            ]
        );

        $this->setState($I, $unitId3, $firstDayLastMonth, $factoryId, $professionId, 3);
        $this->setState($I, $unitId4, $firstDayLastMonth, $factoryId2, $professionId2, 4);

        $I->login(USERNAME_MANAGER);
        $I->amOnPage('statistic/work');
        $I->click('button.daterange-ranges');
        $I->fillField('input[name="daterangepicker_start"]', $firstDayLastMonth);
        $I->fillField('input[name="daterangepicker_end"]', $lastDayLastMonth);
        $I->click('.range_inputs button.bg-slate-600');
        $I->waitForElementVisible('#fiopart');
        $I->fillField('#fiopart', 'Тестовый Тест Тестович4');
        $I->selectOption('#factory_id', 2);
        $I->selectOption('#profession_id', 2);
        $I->selectOption('#recruit_id', 2);
        $I->click('.btn.btn-info[value="Применить"]');
        $I->waitForText('Тестовый Тест Тестович4', 5, '#work tr.fio-row > td:nth-child(5)');
    }

}

