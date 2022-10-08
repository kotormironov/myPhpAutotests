<?php

namespace acceptance\Plan;

use AcceptanceTester;
use Models\GroupFactoryRelation;
use Models\GroupUserRelation;
use Models\RecruitsGroup;
use Models\Request;
use const USERNAME_MASTER;
use const USERNAME_RECRUITER;
use const USERNAME_SUPER_MASTER;

class PlanCest
{

    public function _before(AcceptanceTester $I)
    {
        $I->seedFactory();
        $I->seedFactory(2);
        $I->seedUserTable();
        $I->seedProfession();
        $I->seedProfession(2);
    }

    private function _createRequest(AcceptanceTester $I)
    {
        $factoryId = 1;
        $groupId = 1;
        $I->haveInDatabase(GroupFactoryRelation::$tableName, ['group_id' => $groupId, 'factory_id' => $factoryId]);
        $I->haveInDatabase(RecruitsGroup::$tableName,
            [
                'name' => 'Группа_1',
                'deleted' => 0,
                'active' => 1,
                'protected' => 1,
            ]
        );
        $I->haveInDatabase(GroupUserRelation::$tableName, ['group_id' => $groupId, 'user_id' => 2]);
        $I->haveInDatabase(Request::$tableName,
            [
                'profession_id' => 1,
                'factory_id' => $factoryId,
                'count' => 5,
                'comment' => '',
                'status' => Request::STATUS_CONFIRMED,
                'created_at' => date('Y-m-d', strtotime('-1 day')),
                'class' => '1;9',
                'rate' => 250.00,
                'conditions' => '',
                'requirements' => '',
                'duties' => '',
                'author_id' => 103,
                'deadline_date' => date('Y-m-d', strtotime('-1 day')), // чтобы красная строка была
                'priority' => Request::PRIORITY_HIGH, // красный
            ]
        );
    }

    /**
     * Вижу заявку в плане группы.
     * Заявка просрочена. Высокий приоритет.
     *
     * @param AcceptanceTester $I
     *
     * @before _createRequest
     */
    public function testSeeRequest(AcceptanceTester $I)
    {
        $I->login(USERNAME_RECRUITER);
        $I->amOnPage('plan?action=group_1&group_id=1');
        $I->waitForText('Предприятие1', 5, '#plan tr:nth-child(2) > td');
        $I->waitForText(USERNAME_SUPER_MASTER, 5, '#plan tr:nth-child(3) td:nth-child(2)');
        $I->waitForText('Профессия1', 5, '#plan tr:nth-child(3) td:nth-child(3)');
        $I->waitForText('5', 5, '#plan tr:nth-child(3) td:nth-child(5)');
        $I->waitForText('0', 5, '#plan tr:nth-child(3) > td:nth-child(6)');
        $I->waitForText('5', 5, '#plan tr:nth-child(3) > td:nth-child(7)');
        $I->waitForText('0', 5, '#plan tr:nth-child(3) > td:nth-child(8)');
        $I->waitForText('250.00', 5, '#plan tr:nth-child(3) > td:nth-child(10)');
        $I->waitForElementVisible('#plan tr:nth-child(3) > td:nth-child(9) i.text-warning');
        $I->waitForElementVisible('#plan tr:nth-child(3).danger');
    }

    /**
     * Фильтрация По мастеру
     *
     * @param AcceptanceTester $I
     *
     * @before _createRequest
     */
    public function testFiltered(AcceptanceTester $I)
    {
        $factoryId = 2;
        $groupId = 1;
        $I->haveInDatabase(GroupFactoryRelation::$tableName, ['group_id' => $groupId, 'factory_id' => $factoryId]);
        $I->haveInDatabase(RecruitsGroup::$tableName, ['name' => 'Группа_1', 'deleted' => 0, 'active' => 1, 'protected' => 1]);
        $I->haveInDatabase(GroupUserRelation::$tableName, ['group_id' => $groupId, 'user_id' => 2]);
        $I->haveInDatabase(Request::$tableName,
            [
                'profession_id' => 2,
                'factory_id' => $factoryId,
                'count' => 5,
                'comment' => '',
                'status' => Request::STATUS_CONFIRMED,
                'created_at' => date('Y-m-d', strtotime('-1 day')),
                'class' => '1;9',
                'rate' => 250.00,
                'conditions' => '',
                'requirements' => '',
                'duties' => '',
                'author_id' => 3,
                'deadline_date' => date('Y-m-d', strtotime('-1 day')), // чтобы красная трока была
                'priority' => Request::PRIORITY_HIGH, //красный
            ]
        );

        $I->login(USERNAME_RECRUITER);
        $I->amOnPage('plan?action=group_' . $groupId . '&group_id=' . $groupId);
        $I->selectOption('#master_id', 3);
        $I->selectOption('#factory_id', $factoryId);
        $I->selectOption('#profession_id', 2);
        $I->click('.form-inline.mobile-center .btn-info');
        $I->waitForText('Предприятие2', 5, '#plan tr:nth-child(2) > td');
        $I->waitForText(USERNAME_MASTER, 5, '#plan tr:nth-child(3) td:nth-child(2)');
        $I->waitForText('Профессия2', 5, '#plan tr:nth-child(3) td:nth-child(3)');

        $I->dontSee('Предприятие1', '#plan tr:nth-child(2) > td');
        $I->dontSee(USERNAME_SUPER_MASTER, '#plan tr:nth-child(3) td:nth-child(2)');
        $I->dontSee('Профессия1', '#plan tr:nth-child(3) td:nth-child(3)');
    }

//    /**
//     * Продолжить потом. Сделать проверки, чтобы не отображались в плане ненужные заявки
//     * @param AcceptanceTester $I
//     * !!!!Не обязательная. Не получается заполнить ячейку. Делается через js
//     */
//    public function tryToTest(AcceptanceTester $I)
//    {
//        $I->login('Manager',1);
//        $I->amOnPage('plan');
//        $I->fillField('#plan > tbody > tr:nth-child(3) > td:nth-child(11)',1);
//        $I->wait(60);
//    }

}




