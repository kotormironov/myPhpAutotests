<?php

use Models\Unit;
use Models\UnitPaymentCards;

class PaymentCardPanelCest
{

    public function _before(AcceptanceTester $I)
    {
        $I->seedUserTable();
        $I->seedUnit(['status' => Unit::STATUS_WORK]);
        $I->seedWorkDate();
        $I->seedFactory();
        $I->seedUserFactoryRelation();
    }

    /**
     *  Создание соискателю блока Карта
     *
     * @param AcceptanceTester $I
     * @group other
     */
    public function testSaveBlockCard(AcceptanceTester $I)
    {
        $I->login(USERNAME_MASTER);
        $I->amOnPage('units/edit/1');
        $I->fillField('#paymentCardForm [name="payment_card_number"]', 4817760253470219);
        $I->fillField('#paymentCardForm [name="payment_card_valid_thru_month"]', 12);
        $I->fillField('#paymentCardForm [name="payment_card_valid_thru_year"]', 45);
        $I->fillField('#paymentCardForm [name="payment_card_full_name"]', 'Тестовый тест тестович2');
        $I->click('#paymentCardForm .submit-button');
        $I->waitForText('Успешно обновлено', 5, '.ui-pnotify-text');
        $I->waitAndSeeInDatabase(UnitPaymentCards::$tableName,
            [
                'unit_id' => 1,
                'full_name' => 'Тестовый тест тестович2',
                'number' => '4817760253470219',
                'valid_thru' => '2045-12-31',
            ], 5
        );
    }

    /**
     *  Видим созданный соискателю блок Карта
     *
     * @param AcceptanceTester $I
     * @group other
     */
    public function testSeeBlockCard(AcceptanceTester $I)
    {
        $I->haveInDatabase(UnitPaymentCards::$tableName,
            [
                'id' => 1,
                'unit_id' => 1,
                'full_name' => 'Тестовый тест тестович',
                'number' => '462635264235235',
                'valid_thru' => '2045-12-31',
                'is_current' => 'true'
            ]
        );
        $I->login(USERNAME_HR);
        $I->amOnPage('units/edit/1');
        $I->seeInField('#paymentCardForm [name="payment_card_number"]','462635264235235');
        $I->seeInField('#paymentCardForm [name="payment_card_full_name"]','Тестовый тест тестович');
        $I->seeInField('#paymentCardForm [name="payment_card_valid_thru_month"]', '12');
        $I->seeInField('#paymentCardForm [name="payment_card_valid_thru_year"]', '45');
    }
}
