<?php

namespace Applicants;

use \Codeception\Example;

use AcceptanceTester;
use Acl;
use Navigation;
use Phone;
use PhoneRelations;
use UnitExperience;
use Units;
use WorkDate;

class StatusCest
{

    public function _before(AcceptanceTester $I)
    {
        $I->init();
    }

    /**
     * @param AcceptanceTester $I
     * @param Example $example
     *
     * @example ["null"]
     * @example ["yesterday"]
     */
    public function _testBackFromVacation(AcceptanceTester $I, Example $example)
    {
        $today = date('Y-m-d');
        $yesterday = date('Y-m-d', strtotime('-1 day', strtotime($today)));

        $I->haveInDatabase(Unit::$table_name, ['id' => 2, 'fio' => 'Иванов Иван Иванович', 'status' => Unit::STATUS_VACATION]);
        $I->haveInDatabase(Phone::$table_name, ['id' => 1, 'phone' => '71234567890']);
        $I->haveInDatabase(PhoneRelations::$table_name, ['phone_id' => 1, 'object_id' => '1', 'object_type' => PhoneRelations::OBJECT_TYPE_UNIT, 'is_main' => 1]);
        $I->haveInDatabase(UnitExperience::$table_name, ['unit_id' => 1, 'profession_id' => 1, 'factory' => 'Любое', 'description' => '', 'class' => '']);
        $I->haveInDatabase(
            WorkDate::$table_name, [
                'id' => 1,
                'unit_id' => 1,
                'applied_at' => '2000-01-01',
                'fired_at' => 'null' == $example[0] ? null : $yesterday,
                'factory_id' => 1,
                'profession_id' => 1,
                'is_current' => 1,
                'is_vacation' => 1,
                'is_fired' => 0,
                'class' => '0',
                'rate' => 100,
                'request_id' => 1,
            ]
        );

        $I->login('manager', 1);
        $I->amOnPage(Navigation::buildRoute(Acl::PRESENTER_UNITS, 'edit', 1));

        $I->selectOption('#status', 'работает');
        $I->click('#statusForm button');

        // Ждём пока перезагрузится страница
        $I->waitForJS("return $.active > 0;", 10);
        $I->waitForJS("return $.active == 0;", 10);
        $I->waitForJS("return $.active > 0;", 10);
        $I->waitForJS("return $.active == 0;", 10);

        $I->seeInDatabase(Unit::$table_name, ['id' => 1, 'status' => Unit::STATUS_WORK]);
        $I->seeInDatabase(WorkDate::$table_name, ['id' => 1, 'fired_at' => $yesterday, 'is_current' => 0, 'is_fired' => 0]);
        $I->seeInDatabase(WorkDate::$table_name, ['id' => 2, 'applied_at' => $today, 'factory_id' => 1, 'profession_id' => 1, 'from_vacation' => 1, 'is_current' => 1, 'request_id' => 1, 'rate' => 100]);
    }

}
