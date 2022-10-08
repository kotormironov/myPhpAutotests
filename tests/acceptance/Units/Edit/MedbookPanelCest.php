<?php

use Models\Unit;
use Models\UnitsMeta;
use Models\WorkDate;

class MedbookPanelCest
{

    public function _before(AcceptanceTester $I)
    {
        $I->seedUserTable();
        $I->seedUnit();
    }

    /**
     *  Создание соискателю блока Медицинская книжка
     *
     * @param AcceptanceTester $I
     * @group other
     */
    public function testSaveBlockMedical(AcceptanceTester $I)
    {
        $I->login(USERNAME_HR);
        $I->amOnPage('units/edit/1');
        $I->fillField('#medbookForm #medbook_date', '23.03.2019');
        $I->fillField('#medbookForm #medbook_end_date', date('d.m.Y', strtotime("+1 day")));
        $I->selectOption('#medbookForm [name="has_medbook"]',1);
        $I->selectOption('#medbookForm [name="has_measles_vaccine"]',1);
        $I->selectOption('#medbookForm [name="has_medical_commission"]',1);

        $I->click('#medbookForm .submit-button');
        $I->waitForText('Успешно обновлено', 5, '#medbookForm label.validation-valid-label');
        $I->seeInDatabase(UnitsMeta::$tableName, ['uid' => 1, 'key' => 'medbook_date', 'value' => '23.03.2019']);
        $I->seeInDatabase(UnitsMeta::$tableName, ['uid' => 1, 'key' => 'medbook_end_date', 'value' => date('d.m.Y', strtotime("+1 day"))]);
        $I->seeInDatabase(UnitsMeta::$tableName, ['uid' => 1, 'key' => 'has_medbook', 'value' => 1]);
        $I->seeInDatabase(UnitsMeta::$tableName, ['uid' => 1, 'key' => 'has_measles_vaccine', 'value' => 1]);
        $I->seeInDatabase(UnitsMeta::$tableName, ['uid' => 1, 'key' => 'has_medical_commission', 'value' => 1]);
    }

    /**
     *  Видим вывод соискателю блока Медицинская книжка
     *
     * @param AcceptanceTester $I
     * @group other
     */
    public function testSeeBlockMedical(AcceptanceTester $I)
    {
        $I->haveInDatabase(UnitsMeta::$tableName, ['uid' => 1, 'key' => 'has_medbook', 'value' => 1]);
        $I->haveInDatabase(UnitsMeta::$tableName, ['uid' => 1, 'key' => 'medbook_date', 'value' => '23.03.2019']);
        $I->haveInDatabase(UnitsMeta::$tableName, ['uid' => 1, 'key' => 'medbook_end_date', 'value' => '23.03.2022']);
        $I->haveInDatabase(UnitsMeta::$tableName, ['uid' => 1, 'key' => 'has_measles_vaccine', 'value' => 1]);
        $I->haveInDatabase(UnitsMeta::$tableName, ['uid' => 1, 'key' => 'has_medical_commission', 'value' => 1]);
        $I->haveInDatabase(WorkDate::$tableName, ['unit_id' => 1, 'applied_at' => date('Y-m-d'), 'factory_id' => '1', 'is_current' => 1]);
        $I->updateInDatabase(Unit::$tableName, ['status' => 1], ['id' => 1]);
        $I->login(USERNAME_HR);
        $I->amOnPage('units/edit/1');
        $I->seeCheckboxIsChecked('#medbookForm [name="has_medbook"]');
        $I->seeCheckboxIsChecked('#medbookForm [name="has_measles_vaccine"]');
        $I->seeCheckboxIsChecked('#medbookForm [name="has_medical_commission"]');
        $I->seeInField('#medbookForm #medbook_date', '23.03.2019');
        $I->seeInField('#medbookForm #medbook_end_date', '23.03.2022');
    }
}
