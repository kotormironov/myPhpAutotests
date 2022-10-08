<?php

use Codeception\Example;
use Core\Models\Acl;
use Models\Factories;
use Models\FactoriesAccommodationPlacesRelations;
use Models\FactoryMeta;
use Models\FactoryRateRelation;
use Models\GroupFactoryRelation;
use Models\RecruitsGroup;
use Models\ShiftTime;
use Models\UnitContractContractors;

class ParamsCest
{

    public function _before(AcceptanceTester $I)
    {
        $I->seedUserTable();
        $I->seedUserFactoryRelation();
        $I->seedFactory();
    }

    protected function _userGoToEdit(AcceptanceTester $I, string $user, int $factoryId)
    {
        $I->login($user);
        $I->amOnPage('factories/edit/' . $factoryId);
    }

    protected function _getStepSelectOption(AcceptanceTester $I, string $tableName, string $formId, string $selectedOption, string $tableColunm, string $text = 'Данные обновлены успешно', int $valueColunm = 1)
    {
        $factoryId = 1;
        $this->_userGoToEdit($I, USERNAME_MANAGER, $factoryId);
        $I->selectOption($formId . ' ' . $selectedOption, $valueColunm);
        $I->click($formId . ' button.btn-primary');
        $I->waitForText($text,5,$formId . ' .response.validation-valid-label');
        $I->waitAndSeeInDatabase($tableName,[$tableColunm => $valueColunm,'factory_id' => $factoryId]);
        $I->clearTables([$tableName]);
    }

    protected function _getStepFactoryMeta(AcceptanceTester $I, string $field, string $key, $value)
    {
        $factoryId = 1;
        $this->_userGoToEdit($I, USERNAME_MANAGER, $factoryId);
        $I->fillfield($field, $value);
        $I->click('#factoryMetaForm button.btn-primary');
        $I->waitForText('Данные обновлены успешно', 5, '#factoryMetaForm .validation-valid-label');
        $I->waitAndSeeInDatabase(FactoryMeta::$tableName,['key' => $key,'value' => $value, 'factory_id' => $factoryId]);
        $I->clearTables([FactoryMeta::$tableName]);
    }

    protected function _notVisibleAndSeeInDatabase(AcceptanceTester $I, string $tableName, array $data)
    {
        $I->waitForElementNotVisible('#factoryRates .icon-spinner2 spinner',5);
        $I->waitAndSeeInDatabase($tableName, $data, 5);
    }

    /**
     * Проверка вывода параметров предприятия
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function testSeeParams(AcceptanceTester $I)
    {
        $factoryId = 1;

        $number = 'Номер договора';
        $info = 'Специфика предприятия';
        $address = 'Адрес предприятия';

        $I->seedFactoryMeta($factoryId, FactoryMeta::META_OUTAGE, '1');
        $I->seedFactoryMeta($factoryId, FactoryMeta::META_OUTAGE_MULTIPLIER, '1.1');
        $I->seedFactoryMeta($factoryId, FactoryMeta::META_NIGHT_SHIFT_MULTIPLIER, '1.4');
        $I->seedFactoryMeta($factoryId, FactoryMeta::META_NUMBER, $number);
        $I->seedFactoryMeta($factoryId, FactoryMeta::META_INFO, $info);
        $I->seedFactoryMeta($factoryId, FactoryMeta::META_ADDRESS, $address);

        $this->_userGoToEdit($I, USERNAME_MASTER, $factoryId);

        $I->seeCheckboxIsChecked('#outage');
        $I->seeInField('[name="' . FactoryMeta::META_OUTAGE_MULTIPLIER . '"]', '1,1');
        $I->seeInField('[name="' . FactoryMeta::META_NIGHT_SHIFT_MULTIPLIER . '"]', '1,4');
        $I->seeInField('[name="' . FactoryMeta::META_NUMBER . '"]', $number);
        $I->seeInField('[name="' . FactoryMeta::META_INFO . '"]', $info);
        $I->seeInField('[name="' . FactoryMeta::META_ADDRESS . '"]', $address);
    }

    /**
     * Прикрепляем группу Предприятия
     * @param AcceptanceTester $I
     * @group other
     */
    public function testSelectGroup(AcceptanceTester $I)
    {
        $I->haveInDatabase(RecruitsGroup::$tableName, ['id' => 1, 'name' => 'Группа_1', 'active' => 1]);
        $this->_getStepSelectOption($I, GroupFactoryRelation::$tableName, '#groupForm', '#group_id', 'group_id');
    }

    /**
     * Выставляем место проживания Предприятия
     * @param AcceptanceTester $I
     * @group other
     */
    public function testSelectAccommodationPlaces(AcceptanceTester $I)
    {
        $I->seedAccommodationPlace();
        $this->_getStepSelectOption($I, FactoriesAccommodationPlacesRelations::$tableName, '#accommodationPlacesForm', '#places', 'place_id', 'Успешно сохранено');
    }

    /**
     * Сохранение информации по предприятию (коэффициенты, адреса)
     * @param AcceptanceTester $I
     * @param Example $example
     * @example ["#factoryMetaForm [name='outage_multiplier']", "outage_multiplier", "1"]
     * @example ["#factoryMetaForm [name='night_shift_multiplier']", "night_shift_multiplier", "1"]
     * @example ["#factoryMetaForm [name='number']", "number", "Заполнение"]
     * @example ["#factoryMetaForm [name='info']", "info", "Заполнение"]
     * @example ["#factoryMetaForm [name='address']", "address", "Заполнение"]
     * @group other
     */
    public function testTakeMeta(AcceptanceTester $I, Example $example)
    {
        $this->_getStepFactoryMeta($I, $example[0], $example[1], $example[2]);
    }

    /**
     * Выставление расценки Предприятия
     * @param AcceptanceTester $I
     * @group other
     */
    public function testTakeRate(AcceptanceTester $I)
    {
        $I->seedProfession();
        $factoryId = 1;
        $professionId = 1;

        $this->_userGoToEdit($I, USERNAME_MANAGER, $factoryId);
        $I->selectOption('#factoryRatesForm #profession_id', $professionId);
        $I->fillfield('#factoryRatesForm input[name="rate"]', 1);
        $I->fillfield('#factoryRatesForm input[name="clientRate"]', 1);
        $I->click('#factoryRatesForm button');
        $this->_notVisibleAndSeeInDatabase($I, FactoryRateRelation::$tableName,
            [
                'factory_id' => $factoryId,
                'profession_id' => $professionId,
                'class' => '1;9',
                'rate' => 1.00,
                'client_rate' => 1.00,
            ]
        );
        $I->clearTables([FactoryRateRelation::$tableName]);
    }

    /**
     * Удаление расценки Предприятия
     * @param AcceptanceTester $I
     * @group other
     */
    public function testDeleteRate(AcceptanceTester $I)
    {
        $factoryId = 1;
        $professionId = 1;
        $I->haveInDatabase(FactoryRateRelation::$tableName,
            [
                'factory_id' => $factoryId,
                'profession_id' => $professionId,
                'class' => '1;9',
                'rate' => 1.00,
            ]
        );
        $this->_userGoToEdit($I, USERNAME_MANAGER, $factoryId);
	    $I->click('#factoryRatesTableBlock i.icon-trash.text-danger-400');
        $I->waitForElementVisible('#okButton');
	    $I->click('#okButton');
        $I->waitForElementNotVisible('#factoryRates .icon-spinner2 spinner',5);
        $I->waitAndDontSeeInDatabase(FactoryRateRelation::$tableName,
            [
                'factory_id' => $factoryId,
                'profession_id' => $professionId,
                'class' => '1;9',
                'rate' => 1.00,
            ]
        );
    }

    /**
     * Редактирование расценки Предприятия
     * @param AcceptanceTester $I
     * @group other
     */
    public function testEditRate(AcceptanceTester $I)
    {
        $factoryId = 1;
        $I->haveInDatabase(FactoryRateRelation::$tableName,
            [
                'factory_id' => $factoryId,
                'profession_id' => 1,
                'class' => '1;9',
                'rate' => 1.00,
            ]
        );

        $this->_userGoToEdit($I, USERNAME_MANAGER, $factoryId);
	    $I->click('#factoryRatesTableBlock i.icon-pencil7.text-primary-400');
	    $I->fillfield('#factoryRatesTableBlock input[name="rateRow"]', 2);
	    $I->click('#factoryRatesTableBlock i.icon-checkmark.text-success-400');
        $this->_notVisibleAndSeeInDatabase($I, FactoryRateRelation::$tableName,
            [
                'factory_id' => $factoryId,
                'profession_id' => 1,
                'class' => '1;9',
                'rate' => 2.00,
            ],
        );
    }

    /**
     * Выставляем контрактора Предприятию
     * @param AcceptanceTester $I
     * @group other
     */
    public function testTakeContractor(AcceptanceTester $I)
    {
        $I->seedUnitContractContractorsTable();
        $factoryId = 1;
        $this->_userGoToEdit($I, USERNAME_MANAGER, $factoryId);
        $I->selectOption('#registrationForm #contractor', 1);
        $I->click('#registrationForm button.btn-primary');
        $this->_notVisibleAndSeeInDatabase($I, Factories::$tableName,
            [
                'id' => $factoryId,
                'contractor' => 1
            ]
        );
    }

    /**
     * Выставляем данные блока Оформление Предприятию
     * @param AcceptanceTester $I
     * @param Example $example
     * @example ["#registrationForm input[name='salary']", "salary"]
     * @example ["#registrationForm input[name='rate']", "rate"]
     * @group other
     */
    public function testTakeDataRegistration(AcceptanceTester $I, Example $example)
    {
        $factoryId = 1;
        $this->_userGoToEdit($I, USERNAME_MANAGER, $factoryId);
        $I->fillfield($example[0],1);
	    $I->click('#registrationForm button.btn-primary');
        $this->_notVisibleAndSeeInDatabase($I, Factories::$tableName,
            [
                'id' => $factoryId,
                $example[1] => 1,
            ]
        );
    }

    /**
     * Видим вывод информации Предприятия
     * @param AcceptanceTester $I
     * @group other
     */
    public function testSeeDataOnPage(AcceptanceTester $I)
    {
        $factoryId = 1;
        $wait = 5;
        $hours = 5;
        $I->updateInDatabase(Factories::$tableName,
            [
                'salary'=>'1.00',
                'rate'=>'1.00',
                'contractor'=>1,
            ]
        );
        $I->seedFactoryMeta($factoryId, 'address', 'Заполнение');
        $I->seedFactoryMeta($factoryId, 'number', 'Заполнение');
        $I->seedFactoryMeta($factoryId, 'info', 'Заполнение');
        $I->seedFactoryMeta($factoryId, 'outage_multiplier', 1);
        $I->seedFactoryMeta($factoryId, 'night_shift_multiplier', 1);
        $I->seedUserFactoryRelation(Acl::ROLE_OPERATING_OFFICER, $factoryId);
        $I->seedUserFactoryRelation(Acl::ROLE_CURATOR, $factoryId);
        $I->seedUserFactoryRelation(Acl::ROLE_BRIGADIER, $factoryId);
        $I->seedUserFactoryRelation(Acl::ROLE_HR, $factoryId);
        $I->seedAccommodationPlace();
        $I->seedProfession();
        $I->haveInDatabase(FactoriesAccommodationPlacesRelations::$tableName,
            [
                'factory_id' => $factoryId,
                'place_id' => 1,
            ]
        );
        $I->haveInDatabase(ShiftTime::$tableName, ['type' => 1, 'factory_id' => $factoryId, 'hours' => $hours]);
        $I->haveInDatabase(ShiftTime::$tableName, ['type' => 2, 'factory_id' => $factoryId, 'hours' => $hours]);
        $I->haveInDatabase(FactoryRateRelation::$tableName,
            [
                'factory_id' => $factoryId,
                'profession_id' => 1,
                'class' => '1;9',
                'rate' => 1.00,
                'client_rate' => 2.00,
            ]
        );
        $I->haveInDatabase(UnitContractContractors::$tableName,
            [
                'id' => 1,
                'name' => 'contractor',
                'active' => 1,
            ]
        );
        $this->_userGoToEdit($I, USERNAME_MANAGER, $factoryId);
        $I->waitForElementVisible('#select2-group_id-container');
        $I->waitForElementVisible('#salary[value="1.00"]', $wait);
        $I->waitForElementVisible('#rate[value="1.00"]', $wait);
        $I->waitForElementVisible('#ndfl[value="0.13"]', $wait);
        $I->waitForElementVisible('#onHand[value="0.87"]', $wait);
        $I->waitForElementVisible('#select2-contractor-container[title="contractor"]', $wait);

        $I->waitForText(USERNAME_MASTER, $wait, '#usersMastersForm .select2-selection__rendered');
        $I->waitForText(USERNAME_CURATOR, $wait, '#usersCuratorsForm .select2-selection__choice');
        $I->waitForText(USERNAME_BRIGADIER, $wait, '#usersBrigadiersForm .select2-selection__choice');
        $I->waitForText(USERNAME_HR, $wait, '#usersHRsForm .select2-selection__choice');
        $I->waitForText(USERNAME_OPERATING_OFFICER, $wait, '#usersOperatingOfficersForm .select2-selection__choice');
        $I->waitForText('AccomodationPlace', $wait, '#accommodationPlacesForm .select2-selection__choice');
        $I->waitForElementVisible('#shiftTimeForm input[name="day_time"][value="'.$hours.'"]');
        $I->waitForElementVisible('#shiftTimeForm input[name="night_time"][value="'.$hours.'"]');
        $I->waitForElementVisible('#factoryMetaForm input[name="outage_multiplier"][value="1"]');
        $I->waitForElementVisible('#factoryMetaForm input[name="night_shift_multiplier"][value="1"]');
        $I->waitForText("Заполнение", $wait, '#factoryMetaForm label[for="number"]');
        $I->waitForText("Заполнение", $wait, '#factoryMetaForm label[for="info"]');
        $I->waitForText("Заполнение", $wait, '#factoryMetaForm label[for="address"]');
        $I->waitForText("Профессия1", $wait, '#factoryRatesTableBlock');
        $I->waitForElementVisible('#factoryRatesTableBlock [name="rateRow"][value="1.00"]');
        $I->waitForElementVisible('#factoryRatesTableBlock [name="clientRateRow"][value="2.00"]');
    }
}
