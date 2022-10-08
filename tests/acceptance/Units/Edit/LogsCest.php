<?php

class LogsCest
{

    public function _before(AcceptanceTester $I)
    {
        $I->seedUserTable();
        $I->seedUnit();
    }

    /**
     * Переход в Логи соискателя
     * @param AcceptanceTester $I
     * @group other
     */
    public function testGoToLogs(AcceptanceTester $I)
    {
        $I->login(USERNAME_MANAGER);
        $I->amOnPage('units/edit/1');
        $I->click('.category-content a[href="/logs/view/1"]');
        $I->waitForText('Логи соискателя',5,'h4');
    }
}
