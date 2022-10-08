<?php

use Models\Unit;

class DeletedUnitCest
{

    public function _before(AcceptanceTester $I)
    {
        $I->seedUserTable();
        $I->seedUnit();
    }

    /**
     *  Удаление соискателя
     * @param AcceptanceTester $I
     * @group other
     */
    public function testDeletedUnit(AcceptanceTester $I)
    {
        $I->login(USERNAME_MANAGER);
        $I->amOnPage('units/edit/1');
        $I->click('.category-content [data-target="#unitDeleteModal"]');
        $I->waitForElementVisible('textarea#delete_message');
        $I->fillField('textarea#delete_message', 'Проверка_удаления_соискателя');
        $I->click('#unitDeleteForm .btn-primary');
        $I->waitAndSeeInDatabase(Unit::$tableName, ['fio' => 'Тестовый Тест Тестович', 'deleted' => 1]);
    }

    /**
     *  Вижу удаленного соискателя
     * @param AcceptanceTester $I
     * @group other
     */

    public function testSeeDeletedUnit(AcceptanceTester $I)
    {
        $I->updateInDatabase(Unit::$tableName, ['deleted' => 1], ['id' => 1]);
        $I->login(USERNAME_MANAGER);
        $I->amOnPage('units/edit/1');
        $I->waitForElementVisible('.alert-danger');
        $I->waitForText('Пользователь удалён',5,'.alert-danger');
    }

    /**
     *  Вижу удаленного соискателя. В списке соискателей (для прочих)
     * @param AcceptanceTester $I
     * @group other
     */
    public function testSeeDeletedUnitForOther(AcceptanceTester $I)
    {
        $I->updateInDatabase(Unit::$tableName, ['deleted' => 1], ['id' => 1]);
        $I->login(USERNAME_RECRUITER);
        $I->amOnPage('units/edit/1');
        $I->waitForElementVisible('.ui-pnotify-text');
        $I->waitForText('Соискатель был удалён',5,'.ui-pnotify-text');
    }
}

