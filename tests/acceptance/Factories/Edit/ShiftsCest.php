<?php

use Codeception\Example;
use Models\ShiftTime;

class ShiftsCest
{

    public function _before(AcceptanceTester $I)
    {
        $I->seedFactory();
        $I->seedUserTable();
    }

    /**
     * Проверка вывода продолжительности смен предприятия
     *
     * @param AcceptanceTester $I
     *
     * @group other
     */
    public function testSeeShifts(AcceptanceTester $I)
    {
        $factoryId = 1;

        $dayShiftTime = '10';
        $nightShiftTime = '11';

        $I->haveInDatabase(ShiftTime::$tableName, ['factory_id' => $factoryId, 'type' => ShiftTime::TYPE_DAY, 'hours' => $dayShiftTime]);
        $I->haveInDatabase(ShiftTime::$tableName, ['factory_id' => $factoryId, 'type' => ShiftTime::TYPE_NIGHT, 'hours' => $nightShiftTime]);

        $I->login(USERNAME_MASTER);
        $I->amOnPage('factories/edit/1');

        $I->seeInField('[name="day_time"]', $dayShiftTime);
        $I->seeInField('[name="night_time"]', $nightShiftTime);
    }

     /**
     * Выставляем размер смены Предприятия (дневная/ночная)
     * @param AcceptanceTester $I
     * @param Example $example
     * @example ["#shiftTimeForm input[name='day_time']", "1"]
     * @example ["#shiftTimeForm input[name='night_time']", "2"]
     * @group other
     */
    public function testSelectShiftTime(AcceptanceTester $I, Example $example)
    {
        $I->seedUserFactoryRelation();
        $factoryId = 1;
        $I->login(USERNAME_MANAGER);
        $I->amOnPage('factories/edit/'.$factoryId);
        $I->fillfield($example[0], 11);
        $I->click('#shiftTimeForm button.btn-primary');
        $I->waitForText('Данные обновлены успешно',5,'#shiftTimeForm .validation-valid-label');
        $I->seeInDatabase(ShiftTime::$tableName,['type'=>$example[1],'factory_id' => $factoryId,'hours'=>11]);
        $I->clearTables([ShiftTime::$tableName]);
    }

}
