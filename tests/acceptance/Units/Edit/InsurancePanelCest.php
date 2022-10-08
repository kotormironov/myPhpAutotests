<?php

use Models\Insurance;
use Models\Unit;

class InsurancePanelCest
{

    public function _before(AcceptanceTester $I)
    {
        $I->seedUserTable();
        $I->seedUnit();
        $I->seedInsuranceCompany();
    }

    /**
     * Заполнение соискателю блока Полис
     * @param AcceptanceTester $I
     * @group other
     */
    public function testSaveInsurance(AcceptanceTester $I)
    {
        $I->updateInDatabase(Unit::$tableName, ['status' => 1, 'citizenship_id' => 3], ['id' => 1]);
        $I->login(USERNAME_HR);
        $I->amOnPage('units/edit/1');
        $I->click('#insurancePanel a.rotate-180');
        $I->checkOption('#insurancePanel [name="insurance_type"]');
        $I->fillField('#insurancePanel [name="insurance_start_date"]', '31.03.2020');//сделать гибче дату
        $I->fillField('#insurancePanel [name="insurance_end_date"]', date('d.m.Y', strtotime("+1 day")));
        $I->fillField('#insurance_add_block [name="series"]', '2352352135235');
        $I->fillField('#insurance_add_block [name="number"]', '23523521sdyre');
        $I->selectOption('#insuranceForm #with_whom', 1);
        $I->click('#insuranceForm button');
        $I->waitForElement('#insuranceForm .validation-valid-label');
        $I->seeInDatabase(Insurance::$tableName,
            [
                'unit_id' => 1,
                'type' => 1,
                'start_date' => '2020-03-31',
                'end_date' => date('Y-m-d', strtotime("+1 day")),
                'series' => '2352352135235',
                'number' => '23523521sdyre',
                'with_whom' => 1,
                'is_current' => 1,
            ]
        );
    }
}
