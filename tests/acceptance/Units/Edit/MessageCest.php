<?php

use Core\Models\Settings;
use Models\Mailing;
use Models\Sms;

class MessageCest
{

    public function _before(AcceptanceTester $I)
    {
        $I->seedUserTable();
        $I->seedUnit();
        $I->haveInDatabase(Settings::$tableName, ['key' => 'use_sms', 'value' => 1]);
        $I->seedPhone();
        $I->seedPhone(2, '799999999920');
    }

    /**
     * Отправка СМС через соискателя
     * @param AcceptanceTester $I
     * @group other
     */
    public function testSendSMS(AcceptanceTester $I)
    {
        $I->login(USERNAME_MASTER);
        $I->amOnPage('units/edit/1');
        $I->click('.sidebar-category [data-target="#sendMessageModal"]');
        $I->fillField('#message', 'Проверка_СМС_соискателя');
        $I->click('#sendMessage .btn-primary');
        $I->waitAndSeeInDatabase(Sms::$tableName,
            [
                'unit_id' => 1,
                'phone' => '79990000001',
                'message' => 'Проверка_СМС_соискателя'
            ]
        );
        $I->waitAndSeeInDatabase(Sms::$tableName,
            [
                'unit_id' => 1,
                'phone' => '799999999920',
                'message' => 'Проверка_СМС_соискателя'
            ]
        );
        $I->waitAndSeeInDatabase(Mailing::$tableName,
            [
                'service' => 'sms', 'send_type' => '1', 'param' => '{"unitId":"1"}'
            ]
        );
    }
}
