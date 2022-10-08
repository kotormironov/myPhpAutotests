<?php

use Models\FreelancerUnitRelation;
use Models\Phone;
use Models\PhoneRelations;

class RecruitmentAgencyCest
{

    public function _before(AcceptanceTester $I)
    {
        $I->seedUserTable();
        $I->seedUnit();
        $I->haveInDatabase(Phone::$tableName, 
            [
                'id' => 1,
                'phone' => 79995255120
            ]
        );
        $I->haveInDatabase(PhoneRelations::$tableName, 
            [
                'phone_id' => 1,
                'object_id' => 1,
                'object_type' => 'unit'
            ]
        );
    }

    /**
     * Даем доступ Кадровым агенствам при совпадении номера
     * @param AcceptanceTester $I
     * @group other
     */
    public function testGetAccessApplicant(AcceptanceTester $I)
    {
        $I->login(USERNAME_RECRUITMENT_AGENCY);
        $I->amOnPage('units');
        $I->waitForElementVisible('.btn-success');
        $I->click('.btn-success');
        $I->waitForElementVisible('#unitCardPanel [name="phone[]"]');
        $I->waitForElementClickable('#unitCardPanel [name="phone[]"]');

        $I->fillField('#unitCardPanel [name="phone[]"]', '79995255120');
        $I->waitForElementVisible('#phonesBlock [class="help-block"]');
        $I->see('Соискатель уже существует', '#phonesBlock [class="help-block"]');
        $I->waitForElement('#phonesBlock [href="/units/edit/1"]');
        $I->click('#phonesBlock [href="/units/edit/1"]');
        $I->seeCurrentUrlEquals('/units/edit/1');
        $I->seeInDatabase(FreelancerUnitRelation::$tableName, ['freelancer_id' => 12, 'unit_id' => 1]);
    }
}
