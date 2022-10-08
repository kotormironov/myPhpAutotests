<?php

use Core\Models\Acl;
use Helpers\Data;
use Models\FactoryRateRelation;
use Models\Leads;
use Models\Request;
use Models\UnitExperience;
use Models\Unit;
use Models\OrientedStat;
use Models\UnitsMeta;
use Models\WorkDate;
use Models\UserFactoryRelation;

class StatusPanelCest
{

    public function _before(AcceptanceTester $I)
    {
        $I->seedUserTable();
        $I->seedFactory();
        $I->seedCitizenshipTable();
        $I->seedFeedback();
        $I->seedPhone();
        $I->seedProfession();
        $I->seedUserFactoryRelation();
    }

    protected function createUnitExperience(AcceptanceTester $I)
    {
        $I->seedUnitProfession();
    }

    protected function createFactoryRateRelation(AcceptanceTester $I)
    {
        $I->haveInDatabase(FactoryRateRelation::$tableName,
            [
                'factory_id' => 1,
                'profession_id' => 1,
                'class' => '1;9',
                'rate' => 100,
            ]
        );
    }

    protected function setGender(AcceptanceTester $I)
    {
        $I->haveInDatabase(UnitsMeta::$tableName, ['uid' => 1, 'key' => UnitsMeta::GENDER, 'value' => UnitsMeta::GENDER_MALE]);
    }

    protected function createLead(AcceptanceTester $I)
    {
        $I->haveInDatabase(Leads::$tableName, 
            [
                'unit_id' => 1,
                'phone' => 79990000001
            ]
        );
    }

    /**
     * Нельзя сориентировать без "Опыта работу"
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function testOrientWithoutExperience(AcceptanceTester $I)
    {
        $I->seedUnit();
        $I->login(USERNAME_RECRUITER);
        $I->amOnPage('units/edit/1');
        $I->selectOption('#statusForm #status', Unit::STATUS_ORIENTED);
        $I->click('#statusForm .submit-button');
        $I->waitForElementVisible('#statusForm .validation-error-label', 5);
        $I->waitForText('Нельзя сориентировать соискателя без специальности', 5, '#statusForm div.alert-danger.error');
    }

    /**
     * Ориентирование соискателя с "Опытом работы"
     * (без мастера в селекте. Сейчас можно ориентировать без мастера)
     *
     * @param AcceptanceTester $I
     * @before createFactoryRateRelation
     * @before setGender
     * @before createLead
     * @group other
     */
    public function testOrientWithExperience(AcceptanceTester $I)
    {
        $factoryId = 1;
        $I->seedUnit();
        $I->seedUnitProfession();
        $I->haveInDatabase(Request::$tableName,
            [
                'id' => 1,
                'profession_id' => 1,
                'factory_id' => $factoryId,
                'count' => 1,
                'status' => Request::STATUS_CONFIRMED,
                'created_at' => date('Y-m-d'),
                'class' => 0,
                'rate' => 200.00,
                'conditions' => '',
                'requirements' => '',
                'duties' => '',
                'author_id' => 2,
                'is_hourrate' => 0,
                'deleted' => 0,
                'oriented' => 0,
                'completion' => 0,
                'plan_id' => 0,
                'pid' => 0,
                'type_id' => 0,
                'category' => Request::CATEGORY_NONE,
                'priority' => Request::PRIORITY_NORMAL,
                'comment' => '',
            ]
        );

        $I->login(USERNAME_RECRUITER);
        $I->amOnPage('units/edit/1');
        $I->selectOption('#status', Unit::STATUS_ORIENTED);
        $I->waitForElementVisible('#select2-oriented_at-container');
        $I->selectOption('#oriented_at', $factoryId);
        $I->waitForElement('#statusForm [title^="Заявка"]');
        $I->click('#statusForm .submit-button');
        $I->waitForElementVisible('.response.validation-valid-label');
        $I->waitAndSeeInDatabase(Unit::$tableName,
            [
                'fio' => 'Тестовый Тест Тестович',
                'status' => Unit::STATUS_ORIENTED,
                'oriented_at' => $factoryId,
            ]
        );

        $I->clearTables([Request::$tableName, UnitExperience::$tableName]);
    }

    /**
     * Ориентирование без заявки соискателя с "Опытом работы"
     * (в селекте не выбирается мастер. Сейчас ориентировать можно и так)
     *
     * @param AcceptanceTester $I
     * @before createUnitExperience
     * @before createFactoryRateRelation
     * @before setGender
     * @before createLead
     * @group other
     */
    public function testCantOrient(AcceptanceTester $I)
    {
        $I->seedUnit();
        $I->haveInDatabase(Leads::$tableName, 
            [
                'unit_id' => 1,
                'phone' => 79995255120
            ]
        );
        $I->login(USERNAME_RECRUITER);
        $I->amOnPage('units/edit/1');
        $I->selectOption('#status', Unit::STATUS_ORIENTED);
        $I->waitForElementVisible('#select2-oriented_at-container');
        $I->selectOption('#oriented_at', 1);
        $I->click('#statusForm button.submit-button');
        $I->waitForText('Нельзя сориентировать не по заявке', 5, 'label.validation-error-label');

        $I->clearTables([UnitExperience::$tableName, FactoryRateRelation::$tableName, UnitsMeta::$tableName]);
    }

    /**
     * Ориентирование соискателя с "Опытом работы" (с выбором Мастера)
     *
     * @param AcceptanceTester $I
     *
     * @before createUnitExperience
     * @before createFactoryRateRelation
     * @before setGender
     * @before createLead
     * @group other
     */
    public function testOrientToMaster(AcceptanceTester $I)
    {
        $factoryId = 1;
        $masterId = 3;
        $I->seedUnit();
        $I->haveInDatabase(Request::$tableName,
            [
                'id' => 1,
                'profession_id' => 1,
                'factory_id' => $factoryId,
                'count' => 1,
                'status' => Request::STATUS_CONFIRMED,
                'created_at' => date('Y-m-d'),
                'class' => 0,
                'rate' => 200.00,
                'conditions' => '',
                'requirements' => '',
                'duties' => '',
                'author_id' => 2,
                'is_hourrate' => 0,
                'deleted' => 0,
                'oriented' => 0,
                'completion' => 0,
                'plan_id' => 0,
                'pid' => 0,
                'type_id' => 0,
                'category' => Request::CATEGORY_NONE,
                'priority' => Request::PRIORITY_NORMAL,
                'comment' => '',
            ]
        );

        $I->login(USERNAME_RECRUITER);
        $I->amOnPage('units/edit/1');
        $I->selectOption('#status', Unit::STATUS_ORIENTED);
        $I->waitForElementVisible('#select2-oriented_at-container');
        $I->selectOption('#oriented_at', $factoryId);
        $I->waitForElementVisible('#select2-master_id-container');
        $I->selectOption('#master_id', $masterId);
        $I->click('#statusForm button.submit-button');

        $I->waitForElementVisible('[class="response validation-valid-label"]');
        $I->waitForElementNotVisible('#statusBlock i.icon-spinner2.spinner');
        $I->seeInDatabase(Unit::$tableName,
            [
                'fio' => 'Тестовый Тест Тестович',
                'status' => Unit::STATUS_ORIENTED,
                'oriented_at' => $factoryId,
                'master_id' => $masterId,
            ]
        );

        $I->clearTables([UnitExperience::$tableName, FactoryRateRelation::$tableName, UnitsMeta::$tableName]);
    }

    /**
     * Видим статус ориентированного соискателя
     *
     * @param AcceptanceTester $I
     * @before createFactoryRateRelation
     * @before createUnitExperience
     * @group other
     */
    public function testSeeSetOriented(AcceptanceTester $I)
    {
        $factoryId = 1;
        $I->seedUserFactoryRelation();
        $I->seedUnit(['status' => Unit::STATUS_ORIENTED, 'oriented_at' => $factoryId, 'master_id' => Acl::ROLE_MASTER]);
        $I->seedRequest(['status' => Request::STATUS_CONFIRMED]);
        $I->haveInDatabase(
            OrientedStat::$tableName,
            [
                'user_id' => Acl::ROLE_MANAGER,
                'request_id' => 1,
                'unit_id' => 1,
                'profession_id' => 1,
                'class' => '1;9',
                'factory_id' => $factoryId,
                'master_id' => Acl::ROLE_MASTER,
            ],
        );

        $I->login(USERNAME_RECRUITER);
        $I->amOnPage('units/edit/1');
        $I->waitForText('сориентирован', 5, '#select2-status-container');
        $I->waitForText('Предприятие1', 5, '#select2-oriented_at-container');
        $I->waitForText(USERNAME_MASTER, 5, '#select2-master_id-container');

        $I->clearTables([UnitExperience::$tableName, FactoryRateRelation::$tableName, Request::$tableName, OrientedStat::$tableName]);
    }

    /**
     * Устройство на работу (без заявки, ориентированного соискателя)
     *
     * @param AcceptanceTester $I
     *
     * @before createUnitExperience
     * @before createFactoryRateRelation
     * @before setGender
     *
     * @group other
     */
    public function testHire(AcceptanceTester $I)
    {
        $unitId = 1;
        $factoryId = 1;
        $I->seedUserFactoryRelation();
        $I->seedUnit(['status' => Unit::STATUS_ORIENTED, 'oriented_at' => $factoryId, 'master_id' => Acl::ROLE_MASTER]);
        $I->haveInDatabase(
            OrientedStat::$tableName,
            [
                'user_id' => Acl::ROLE_MANAGER,
                'request_id' => 1,
                'unit_id' => $unitId,
                'profession_id' => 1,
                'class' => '1;9',
                'factory_id' => $factoryId,
                'master_id' => Acl::ROLE_MASTER,
            ],
        );

        $I->login(USERNAME_MASTER);
        $I->amOnPage('units/edit/' . $unitId);

        $I->waitForElementClickable('#select2-status-container');
        $I->selectOption('#status', Unit::STATUS_WORK);
        $I->waitForElementVisible('#start_work_date');
        $I->fillField('#start_work_date', date('d.m.Y'));
        $I->click('#statusForm button.submit-button');
        $I->waitForElementNotVisible('#statusBlock i.icon-spinner2.spinner');
        $I->waitAndseeInDatabase(Unit::$tableName, ['fio' => 'Тестовый Тест Тестович', 'status' => 1, 'master_id' => Acl::ROLE_MASTER]);
        $I->seeInDatabase(
            WorkDate::$tableName,
            [
                'unit_id' => $unitId,
                'applied_at' => date('Y.m.d'),
                'profession_id' => 1,
                'factory_id' => $factoryId,
                'is_current' => 1,
            ],
        );

        $I->clearTables([UnitExperience::$tableName, FactoryRateRelation::$tableName, UnitsMeta::$tableName, WorkDate::$tableName, OrientedStat::$tableName]);
    }

    /**
     * Блок Статус. Пересечение периодов при устройстве на работу
     *
     * @param AcceptanceTester $I
     *
     * @before createUnitExperience
     * @before setGender
     * @before createFactoryRateRelation
     *
     * @group other
     */
    public function testHireWithIntersection(AcceptanceTester $I)
    {
        $factoryId = 1;
        $unitId = 1;
        $I->seedUnit(['status' => Unit::STATUS_ORIENTED, 'oriented_at' => $factoryId, 'master_id' => Acl::ROLE_MASTER]);
        $I->haveInDatabase(OrientedStat::$tableName,
            [
                'user_id' => Acl::ROLE_MASTER,
                'unit_id' => $unitId,
                'profession_id' => 1,
                'class' => '1;9',
                'factory_id' => $factoryId,
                'master_id' => Acl::ROLE_MASTER,
                'deleted' => 0,
            ]
        );
        $I->haveInDatabase(WorkDate::$tableName,
            [
                'unit_id' => $unitId,
                'applied_at' => '2019-10-04',
                'fired_at' => date('Y-m-d'),
                'profession_id' => 1,
                'factory_id' => $factoryId,
                'is_fired' => 1,
                'class' => '1;9',
            ]
        );
        $I->login(USERNAME_MASTER);
        $I->amOnPage('units/edit/' . $unitId);
        $I->selectOption('#status', Unit::STATUS_WORK);
        $I->waitForElementVisible('#select2-workplace-container');
        $I->selectOption('#workplace', 1);
        $I->fillField('#start_work_date', date("d.m.Y"));
        $I->click('#statusForm button.submit-button');
        $I->waitForText('Пересечение с периодом 04.10.2019 - ' . date('d.m.Y'), 15, '.validation-error-label');

        $I->clearTables([UnitExperience::$tableName, FactoryRateRelation::$tableName, UnitsMeta::$tableName, WorkDate::$tableName, OrientedStat::$tableName]);
    }

    /**
     * Блок Статус. Устройство на работу впритык
     * Проверка граничного значения
     *
     * @param AcceptanceTester $I
     *
     * @before createUnitExperience
     * @before setGender
     * @group other
     */
    public function testHireWithCrossing(AcceptanceTester $I)
    {
        $unitId = 1;
        $factoryId = 1;
        $I->seedFactory(2);
        $I->seedUnit(['status' => Unit::STATUS_ORIENTED, 'oriented_at' => $factoryId, 'master_id' => Acl::ROLE_MASTER]);
        $I->haveInDatabase(UserFactoryRelation::$tableName, ['user_id' => Acl::ROLE_MASTER, 'factory_id' => 2]);
        $I->haveInDatabase(OrientedStat::$tableName,
            [
                'user_id' => Acl::ROLE_MASTER,
                'unit_id' => $unitId,
                'profession_id' => 1,
                'class' => '1;9',
                'factory_id' => $factoryId,
                'master_id' => Acl::ROLE_MASTER,
                'deleted' => 0,
            ]
        );
        $I->haveInDatabase(FactoryRateRelation::$tableName,
            [
                'factory_id' => 2,
                'profession_id' => 1,
                'class' => '1;9',
                'rate' => 100,
            ]
        );
        $I->haveInDatabase(WorkDate::$tableName,
            [
                'unit_id' => $unitId,
                'applied_at' => '2019-10-04',
                'fired_at' => date('Y-m-d'),
                'profession_id' => 1,
                'factory_id' => $factoryId,
                'is_current' => 1,
                'class' => '1;9',
            ]
        );
        $I->login(USERNAME_MASTER);
        $I->amOnPage('units/edit/' . $unitId);
        $I->selectOption('#status', Unit::STATUS_WORK);
        $I->waitForElementVisible('#select2-workplace-container');
        $I->selectOption('#workplace', 2);
        $startWorkDay = date('Y-m-d', strtotime('+1 day'));
        while (Data::isHoliday($startWorkDay)) {
            $startWorkDay = date('Y-m-d', strtotime($startWorkDay . ' +1 day'));
        }

        $I->fillField('#start_work_date', date('d.m.Y', strtotime($startWorkDay)));
        $I->click('#statusForm button.submit-button');
        $I->waitForText('Сотрудник приступит к работе', 10, '#futureBlock');

        $I->clearTables([UnitExperience::$tableName, FactoryRateRelation::$tableName, UnitsMeta::$tableName, WorkDate::$tableName, OrientedStat::$tableName]);
    }

    /**
     * Блок Статус. Перевод на другое предприятие, с перебиванием будущего увольнения
     *
     * @param AcceptanceTester $I
     *
     * @before createUnitExperience
     * @before setGender
     *
     * @group other
     */
    public function testHireWithShift(AcceptanceTester $I)
    {
        $unitId = 1;
        $factoryId = 1;
        $I->seedFactory(2);
        $I->seedUnit(['status' => Unit::STATUS_WORK]);
        $I->haveInDatabase(OrientedStat::$tableName,
            [
                'user_id' => 3,
                'unit_id' => $unitId,
                'profession_id' => 1,
                'class' => '1;9',
                'factory_id' => $factoryId,
                'master_id' => 3,
                'deleted' => 0,
            ]
        );
        $I->haveInDatabase(WorkDate::$tableName,
            [
                'unit_id' => $unitId,
                'applied_at' => '2019-10-04',
                'fired_at' => date('Y-m-d', strtotime('- 2 day')),
                'profession_id' => 1,
                'factory_id' => $factoryId,
                'is_current' => 1,
                'class' => '1;9',
            ]
        );
        $I->haveInDatabase(FactoryRateRelation::$tableName,
            [
                'factory_id' => 2,
                'profession_id' => 1,
                'class' => '1;9',
                'rate' => 100,
            ]
        );

        $I->login(USERNAME_HR);
        $I->amOnPage('units/edit/' . $unitId);
        $I->waitForElementClickable('#select2-status-container');
        $I->selectOption('#status', Unit::STATUS_WORK);
        $I->waitForElementVisible('#select2-workplace-container');
        $I->selectOption('#workplace', 2);
        $I->fillField('#start_work_date', date('d.m.Y'));
        $I->click('#statusForm button.submit-button');
        $I->waitForElementNotVisible('#statusBlock i.icon-spinner2.spinner');
        $I->seeInDatabase(
            WorkDate::$tableName,
            [
                'unit_id' => $unitId,
                'applied_at' => date('Y-m-d'),
                'factory_id' => 2,
                'is_current' => 1,
            ],
        );
        $I->seeInDatabase(WorkDate::$tableName,
            [
                'unit_id' => $unitId,
                'applied_at' => '2019-10-04',
                'fired_at' => date('Y-m-d', strtotime('- 1 day')),
                'profession_id' => 1,
                'factory_id' => $factoryId,
                'is_current' => 0,
                'class' => '1;9',
            ]
        );

        $I->clearTables([UnitExperience::$tableName, FactoryRateRelation::$tableName, UnitsMeta::$tableName, WorkDate::$tableName, OrientedStat::$tableName]);
    }

    /**
     * Принятие в работу соискателя
     *
     * @param AcceptanceTester $I
     *
     * @before setGender
     * @group other
     */
    public function testSetInWork(AcceptanceTester $I)
    {
        $I->seedUnit();
        $I->login(USERNAME_RECRUITER);
        $I->amOnPage('units/edit/1');
        $I->selectOption('#status', Unit::STATUS_IN_WORK);
        $I->waitForElementClickable('#statusForm button.submit-button');
        $I->click('#statusForm button.submit-button');
        $I->waitForElementNotVisible('#statusBlock i.icon-spinner2.spinner');
        $I->waitAndSeeInDatabase(Unit::$tableName, ['fio' => 'Тестовый Тест Тестович', 'status' => Unit::STATUS_IN_WORK]);
        $I->deleteFromDatabase(Unit::$tableName, ['fio' => 'Тестовый Тест Тестович']);

        $I->clearTables([UnitsMeta::$tableName]);
    }

    /**
     * Вижу соискателя, статус В работе
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function testInWorkSee(AcceptanceTester $I)
    {
        $I->seedUnit(['status' => Unit::STATUS_IN_WORK]);
        $I->login(USERNAME_RECRUITER);
        $I->amOnPage('units/edit/1');
        $I->waitForText('в работе', 5, '#select2-status-container');
    }

    /**
     * В работу не может ставить не рекрутер
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function testInWorkNotCurator(AcceptanceTester $I)
    {
        $I->seedUnit();
        $I->login(USERNAME_MASTER);
        $I->amOnPage('units/edit/1');
        $I->click('.select2-selection__rendered');
        $I->seeElement('//li[contains(text(),"в работе")] [contains(@aria-disabled, "true")]');
    }

    /**
     * Из статуса соискатель нельзя ставить Отпуск
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function testApplicantSeekerToVacation(AcceptanceTester $I)
    {
        $I->seedUnit();
        $I->login(USERNAME_MANAGER);
        $I->amOnPage('units/edit/1');
        $I->click('.select2-selection__rendered');
        $I->seeElement('//li[contains(text(),"отпуск")] [contains(@aria-disabled, "true")]');
    }

    /**
     * Из соискателя нельзя ставить Сориентирован (не куратором)
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function testNotToOriented(AcceptanceTester $I)
    {
        $I->seedUnit();
        $I->login(USERNAME_KEEPER);
        $I->amOnPage('units/edit/1');
        $I->click('.select2-selection__rendered');
        $I->waitForElementVisible('//li[contains(text(),"сориентирован")] [contains(@aria-disabled, "true")]', 10);
        $I->seeElement('//li[contains(text(),"сориентирован")] [contains(@aria-disabled, "true")]');
    }

    /**
     * Из соискателя нельзя ставить в Архив
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function testNotToArchive(AcceptanceTester $I)
    {
        $I->seedUnit();
        $I->login(USERNAME_KEEPER);
        $I->amOnPage('units/edit/1');
        $I->click('.select2-selection__rendered');
        $I->seeElement('//li[contains(text(),"архив")] [contains(@aria-disabled, "true")]');
    }

    /**
     * Из соискателя нельзя ставить в Работает
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function testNotToWork(AcceptanceTester $I)
    {
        $I->seedUnit();
        $I->login(USERNAME_RECRUITER);
        $I->amOnPage('units/edit/1');
        $I->click('.select2-selection__rendered');
        $I->seeElement('//li[contains(text(),"работает")] [contains(@aria-disabled, "true")]');
    }
}
