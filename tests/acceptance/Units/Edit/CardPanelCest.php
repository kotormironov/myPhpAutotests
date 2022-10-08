<?php

use Models\Citizenship;
use Models\Unit;
use Models\UnitsMeta;

class CardPanelCest
{

    public function _before(AcceptanceTester $I)
    {
        $I->seedUserTable();
        $I->seedUnit();
        $I->seedCitizenshipTable();
        $I->seedFeedback();
    }

    /**
     * Редактирование панели "Карточка соискателя"
     *
     * @param AcceptanceTester $I
     * @group smoke
     */
    public function testSaveUnitCard(AcceptanceTester $I)
    {
        $I->login(USERNAME_RECRUITER);
        $I->amOnPage('units/edit/1');

        $email = 'kotormironov@gmail.com';
        $birthDate = '20.12.2019';
        $citizenship = 'гражданство';
        // $location = 'Тестовый город2'; А как теперь проверять выбор города?
        $feedbackId = 1;
        $emergencyPhone = '884848484848';
        $I->click('#unitCardForm #fio_lastname');
        $I->waitForElement('#fio');
        $I->pressKey('#fio', '1');
        $I->click('#unitCardForm [name="gender"][value="m"]');
        $I->fillField('#unitCardForm #email', $email);
        $I->fillField('#unitCardForm [name="bdate"]', $birthDate);
        $I->selectOption('#unitCardForm #citizenship_id', Citizenship::RF_ID);
        $I->fillField('#unitCardForm #citizenship', $citizenship);
        $I->selectOption('#unitCardForm #conviction', 'снята');
        // $I->fillField('#unitCardForm #location', $location);
        $I->selectOption('#unitCardForm #feedback', $feedbackId);
        $I->fillField('#unitCardForm #emergency_phone', $emergencyPhone);
        $I->click('#unitCardForm .submit-button');
        $I->waitForElement('#unitCardForm .validation-valid-label');// NotVisible('#unitCardForm i.icon-spinner2.spinner');
        $I->waitAndSeeInDatabase(Unit::$tableName, [
            'fio' => '1Тестовый Тест Тестович',
            'email' => $email,
            'bdate' => date('Y-m-d', strtotime($birthDate)),
            'citizenship_id' => Citizenship::RF_ID,
            // 'location' => $location,
            'feedback' => $feedbackId,
        ]);
        $I->seeInDatabase(UnitsMeta::$tableName, ['uid' => 1, 'key' => UnitsMeta::GENDER, 'value' => 'm']);
        $I->seeInDatabase(UnitsMeta::$tableName, ['uid' => 1, 'key' => UnitsMeta::CITIZENSHIP, 'value' => $citizenship]);
        $I->seeInDatabase(UnitsMeta::$tableName, ['uid' => 1, 'key' => UnitsMeta::CONVICTION, 'value' => 'снята']);
        $I->seeInDatabase(UnitsMeta::$tableName, ['uid' => 1, 'key' => UnitsMeta::EMERGENCY_PHONE, 'value' => $emergencyPhone]);
    }

    /**
     * Не сохраняется Блок Карточка соискателя для прочих
     * Через заполнение полей
     *
     * @param AcceptanceTester $I
     * @group other
     */
    public function testCantSaveUnitCard(AcceptanceTester $I)
    {
        $I->login(USERNAME_KEEPER);
        $I->amOnPage('units/edit/1');

        $email = 'kotormironov@gmail.com';
        $birthDate = '20.12.2019';
        $citizenship = 'гражданство';
        // $location = 'Тестовый город2';
        $feedbackId = 1;
        $emergencyPhone = '884848484848';
        $I->click('#unitCardForm #fio_lastname');
        $I->waitForElement('#fio');
        $I->pressKey('#fio', '1');
        $I->click('#unitCardForm [name="gender"][value="m"]');
        $I->fillField('#unitCardForm #email', $email);
        $I->fillField('#unitCardForm [name="bdate"]', $birthDate);
        $I->selectOption('#unitCardForm #citizenship_id', Citizenship::RF_ID);
        $I->fillField('#unitCardForm #citizenship', $citizenship);
        $I->selectOption('#unitCardForm #conviction', 'снята');
        // $I->fillField('#unitCardForm #location', $location);
        $I->selectOption('#unitCardForm #feedback', $feedbackId);
        $I->fillField('#unitCardForm #emergency_phone', $emergencyPhone);

        $I->click('#unitCardForm .submit-button');
        $I->waitForText('У вас недостаточно прав для редактирования соискателя',5, 'label.response.validation-error-label');
    }
}
