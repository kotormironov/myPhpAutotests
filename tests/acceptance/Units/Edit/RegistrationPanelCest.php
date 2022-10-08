<?php

use Models\UnitsContract;

class RegistrationPanelCest
{

    public function _before(AcceptanceTester $I)
    {
        $I->seedUserTable();
        $I->seedUnit();
        $I->seedUnitContractContractorsTable();
    }

    /**
     * Создание соискателю блока Оформление (РВ, Трудовой договор)
     * Без проведения в 1С (сделать проведение в отдельном тесте)
     *
     * @param AcceptanceTester $I
     * TODO Добавить разных вариантов данных
     *
     * @group other
     * @group registration
     */
    public function testPositiveContractCreate(AcceptanceTester $I)
    {
        $contractor = 2;
        $unitId = 1;
        $I->login(USERNAME_HR);
        $I->amOnPage('units/edit/'.$unitId);
        $I->waitForElementClickable('[name="unit_contract_number"]');

        $I->fillField('[name="unit_contract_number"]', 'Тестовый номер договора');
        $I->fillField('[name="unit_contract_from"]', '12.09.2019');
        $I->fillField('[name="unit_contract_to"]', '16.09.2022');

        $I->selectOption('#contractForm [name="unit_contract_type"]', UnitsContract::TYPE_EMPLOYMENT_CONTRACT);
        $I->selectOption('#contractForm [name="unit_contract_contractor"]', $contractor);
        $I->click('#contractForm span.ladda-label');
        $I->waitForElementNotVisible('#registrationBlock i.icon-spinner2.spinner');
        $I->seeInDatabase(UnitsContract::$tableName, [
            'number' => 'Тестовый номер договора',
            'from' => '2019-09-12',
            'to' => '2022-09-16',
            'unit_id' => $unitId,
            'contractor' => $contractor,
            'type' => UnitsContract::TYPE_EMPLOYMENT_CONTRACT,
            'is_current' => 1,
            'held_1s' => 0,
        ],5
        );

        $I->clearTables([UnitsContract::$tableName]);
    }

    /**
     * Отображение данных блока Оформление
     * (!!сделать отдельно вывод проведения в 1С)
     *
     * @param AcceptanceTester $I
     * TODO Добавить разных вариантов данных
     *
     * @group other
     * @group registration
     */
    public function testPositiveContractView(AcceptanceTester $I)
    {
        $unitId = 1;
        $contractName = UnitsContract::getType(UnitsContract::TYPE_EMPLOYMENT_CONTRACT);
        $contractorName = 'Контрактор2';
        $I->haveInDatabase(UnitsContract::$tableName, [
            'id' => 1,
            'number' => 'Тестовый номер договора',
            'from' => '2019-09-12',
            'to' => '2022-09-16',
            'unit_id' => $unitId,
            'contractor' => 2,
            'created_at' => '2020-03-21 14:30:22',
            'type' => 2,
            'is_current' => 1,
            'held_1s' => 1,
        ]);
        $I->login(USERNAME_HR);
        $I->amOnPage('units/edit/' . $unitId);

        $I->seeInField('[name=unit_contract_number]', 'Тестовый номер договора');
        $I->seeInField('[name="unit_contract_from"]', '12.09.2019');
        $I->seeInField('[name="unit_contract_to"]', '16.09.2022');
        // $I->wait(300);

        $I->waitForText($contractName, 3, '#contractForm [title*="'.$contractName.'"]');
        $I->waitForText($contractorName, 3, '#contractForm [title*="'.$contractorName.'"]');

        $I->clearTables([UnitsContract::$tableName]);
    }

    /**
     * Обновления соискателю блока Оформление
     *
     * @param AcceptanceTester $I
     * TODO добавить отдельный тест на обновление договора в истории
     *
     * @group other
     * @group registration
     */
    public function testPositiveCurrentContractUpdate(AcceptanceTester $I)
    {
        $I->haveInDatabase(UnitsContract::$tableName, [
                'id' => 1,
                'number' => 'Тестовый номер договора',
                'from' => '2019-09-12',
                'to' => '2022-09-16',
                'unit_id' => 1,
                'contractor' => 2,
                'created_at' => '2020-03-21 14:30:22',
                'type' => 2,
                'is_current' => 1,
                'held_1s' => 0,
            ]
        );
        $I->login(USERNAME_HR);
        $I->amOnPage('units/edit/1');

        $I->fillField('[name=unit_contract_number]', 'Тестовый номер договора');
        $I->fillField('[name="unit_contract_from"]', '12.09.2019');
        $I->fillField('[name="unit_contract_to"]', '16.09.2022');

        $I->click('//span[contains(@id, "select2-unit_contract_type")]');
        $I->click('//li[contains(@id, "select2-unit_contract_type")][contains(text(), "Оказания услуг")]');
        $I->click('//span[contains(@id, "select2-unit_contract_contractor")]');
        $I->click('//li[contains(@id, "select2-unit_contract_contractor")][contains(text(), "Контрактор1")]');
        $I->click('#contractForm span.ladda-label');

        $I->waitForElementNotVisible('#registrationBlock i.icon-spinner2.spinner');
        $I->seeInDatabase(UnitsContract::$tableName, [
            'id' => 1,
            'number' => 'Тестовый номер договора',
            'from' => '2019-09-12',
            'to' => '2022-09-16',
            'unit_id' => 1,
            'contractor' => 1,
            'type' => 1,
            'is_current' => 1,
        ]);

        $I->clearTables([UnitsContract::$tableName]);
    }

    /**
     * Блок Оформление. Нет даты начала
     *
     * @param AcceptanceTester $I
     *
     * @group other
     * @group registration
     */
    public function testNegativeContractWithOutStartDateCreate(AcceptanceTester $I)
    {
        $I->login(USERNAME_HR);
        $I->amOnPage('units/edit/1');
        $I->click('#contractForm button');
        $I->waitForElementNotVisible('#registrationBlock i.icon-spinner2.spinner');
        $I->see('Значение поля «Дата начала договора» не может быть пустым', '.response.validation-error-label');
    }

    /**
     * Блок оформления. Дата окончания больше даты начала
     *
     * @param AcceptanceTester $I
     *
     * @group other
     * @group registration
     */
    public function testContractWithShuffledDateCreate(AcceptanceTester $I)
    {
        $I->login(USERNAME_HR);
        $I->amOnPage('units/edit/1');
        $I->fillField('[name="unit_contract_from"]', '08.05.2020');
        $I->fillField('[name="unit_contract_to"]', '07.05.2020');
        $I->click('#contractForm button');
        $I->waitForElementNotVisible('#registrationBlock i.icon-spinner2.spinner');
        $I->see('Дата окончания договора должна быть больше даты начала', '.response.validation-error-label');
    }

    /**
     * Блок оформления. Нет номера договора при закрытии
     *
     * @param AcceptanceTester $I
     *
     * @group other
     * @group registration
     */
    public function testContractWithOutNumberClose(AcceptanceTester $I)
    {
        $unitId = 1;
        $I->haveInDatabase(UnitsContract::$tableName, [
                'id' => 1,
                'from' => '2019-09-12',
                'to' => '2022-09-16',
                'unit_id' => $unitId,
                'contractor' => 2,
                'created_at' => '2020-03-21 14:30:22',
                'type' => 2,
                'is_current' => 1,
                'held_1s' => 1,
            ]
        );
        $I->login(USERNAME_HR);
        $I->amOnPage('units/edit/' . $unitId);
        $I->click('#contractForm .js-close-contract');
        $I->waitForElement('#registrationBlock .validation-error-label');
        $I->see('Нельзя закрыть договор без номера', '.response.validation-error-label');

        $I->clearTables([UnitsContract::$tableName]);
    }

}
