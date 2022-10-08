<?php

use Models\UnitsMeta;

class WishesPanelCest
{

    public function _before(AcceptanceTester $I)
    {
        $I->seedUserTable();
        $I->seedUnit();
    }

    /**
     *  Заполняю блок Пожелания соискателя
     * @param AcceptanceTester $I
     * @group other
     */
    public function testSaveWishes(AcceptanceTester $I)
    {
        $I->login(USERNAME_RECRUITER);
        $I->amOnPage('units/edit/1');
        $I->fillField('#wishes', 'Проверка_Пожелания_соискателю');
        $I->click('#unitWishesForm .submit-button');
        $I->waitForElementVisible('#unitWishesForm label.validation-valid-label', 5);
        $I->see('Пожелания успешно обновлены', '#unitWishesForm label.validation-valid-label');
        $I->waitAndSeeInDatabase(UnitsMeta::$tableName, ['key' => 'wishes', 'value' => 'Проверка_Пожелания_соискателю']);
    }

    /**
     *  Вижу блок Пожелания соискателя
     * @param AcceptanceTester $I
     * @group other
     */
    public function testSeeWishes(AcceptanceTester $I)
    {
        $unitId = 1;
        $I->haveInDatabase(UnitsMeta::$tableName, ['uid' => $unitId, 'key' => 'wishes', 'value' => 'Проверка_Пожелания_соискателю']);
        $I->login(USERNAME_RECRUITER);
        $I->amOnPage('units/edit/'.$unitId);
        $I->waitForElementVisible('#wishes');
        $I->seeInField('#wishes', 'Проверка_Пожелания_соискателю');
    }
}
