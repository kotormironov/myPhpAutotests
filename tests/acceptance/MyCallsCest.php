<?php

use \Codeception\Example;

class MyCallsCest
{
    public function _before(AcceptanceTester $I)
    {
        $I->initBase();
        $I->init();
    }

    public function _after(AcceptanceTester $I)
    {
        $I->amOnPage('/?logout');
    }

    // tests

    /**
     * Массив для теста Вывода данных таблицы
     *
     * @return array
     */
    protected function callStatus()
    {
        $userName =
            [
                'Manager',
                'SuperManager',
                'ManagerChief',
                'Recruiter',
                'SuperRecruiter',
                'Master',
                'SuperMaster',
                'Curator',
                'SuperCurator',
                'Contact',
                'SuperContact',
                'Redactor',
                'SuperRedactor',
                'Admin',
                'SuperAdmin',
                'Hr',
                'SuperHr',
                'Accountant',
                'SuperAccountant',
                'HeadDepartment',
                'SuperHeadDepartment',
                'RecruitmentAgency',
                'SuperRecruitmentAgency',
                'Client',
                'SuperClient',
                'CuratorOfClient',
                'SuperCuratorOfClient'
            ];
        $status =
            [
                date( "Y-m-d", strtotime('-1 day')) => 'tr.delayed',
                date( "Y-m-d")=> 'tr.delayed',
                date( "Y-m-d", strtotime('+1 day')) => 'tr.scheduled',
            ];
        return ['userName'=>$userName, 'status'=>key($status), 'color'=>$status];
    }

    /**
     *  Видим список Все звонки, смотрим выделение статусов
     *
     * @param AcceptanceTester $I
     * @param Example $example
     * @throws Exception
     *
     * @dataProvider callStatus
     *
     * @skip
     */

    //посмотреть, на каких ползователях
    public function _testAllCallsSee(AcceptanceTester $I, Example $example)
    {
        $idUser = $I->grabColumnFromDatabase('ev_users', 'id', ['username' => $example['userName']]);
        $I->haveInDatabase('call_task', ['user_id'=>$idUser, 'unit_id'=>1, 'to_call_at'=>$example['status'], 'created_at'=>$example['status']]);
        $I->login($example['userName'], 1);
        $I->amOnPage('/cabinet/myCalls/');
        $I->seeElement('#callTasksTable > tbody > '.$example['color']);
    }

    /**
     *  Видим список Звонки на сегодня
     *
     * @param AcceptanceTester $I
     * @param Example $example
     * @throws Exception
     *
     * @dataProvider callStatus
     *
     * @skip
     */

    //посмотреть, на каких ползователях
    public function _testСallSeeToday(AcceptanceTester $I, Example $example)
    {
        $idUser = $I->grabColumnFromDatabase('ev_users', 'id', ['username' => $example['userName']]);
        $I->haveInDatabase('call_task', ['user_id'=>$idUser, 'unit_id'=>1, 'to_call_at'=>date( "Y-m-d"), 'created_at'=>date( "Y-m-d")]);
        $I->login($example['userName'], 1);
        $I->amOnPage('/cabinet/myCalls/');
        $I->see('Тестовый Тест Тестович','#callTasksTodayTable > tbody > tr');
    }

}
