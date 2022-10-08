<?php

use \Codeception\Example;

class MailingCest
{
    public function _before(AcceptanceTester $I)
    {
        $I->truncateBase();
        $I->initBase();
        $I->init();
    }

    // Проверяем раздел Подбор - Рассылки

    /**
     * Создание Общего шаблона
     *
     * @param AcceptanceTester $I
     * @param Example $example
     * @throws Exception
     *
     * @example ["ManagerChief"]
     *
     * @skip
     */
    public function _createTemplate(AcceptanceTester $I, Example $example)
    {
        $I->login($example[0], 1);
        $I->amOnPage('/mailing/editTemplate/0');
        $I->fillField('#title', 'Заполнение Наименование');
        $I->fillField('#body', 'Заполнение Сообщение');
        $I->clickandcheck('#smsTemplateForm button');
        $I->seeindatabase('mailing_templates',
            [
                'title' => 'Заполнение Наименование',
                '#body' => 'Заполнение Сообщение'
            ]);
    }

    /**
     * Вижу Общий шаблон
     *
     * @param AcceptanceTester $I
     * @param Example $example
     * @throws Exception
     *
     * @example ["ManagerChief"]
     *
     * @skip
     */
    public function _seeTemplate(AcceptanceTester $I, Example $example)
    {
        $I->haveInDatabase('mailing_templates',
            [
                'title' => 'Заполнение Наименование',
                '#body' => 'Заполнение Сообщение'
            ]
        );
        $I->login($example[0], 1);
        $I->amOnPage('mailing/editTemplate/1');
        $I->seeMulti([
            'Заполнение Наименования' => '#title',
            'Заполнение Сообщение' => '#body',
        ]);
        $I->clickandcheck('#smsTemplateForm button');
        $I->see('mailing_templates',
            [
                'title' => 'Заполнение Наименование',
                '#body' => 'Заполнение Сообщение'
            ]);
    }


    /**
     * Создание Личного шаблона
     *
     * @param AcceptanceTester $I
     * @param Example $example
     * @throws Exception
     *
     * @example ["ManagerChief"]
     *
     * @skip
     */
    public function _createTemplatePersonal(AcceptanceTester $I, Example $example)
    {
        $I->login($example[0], 1);
        $I->amOnPage('/mailing/editTemplate/0');
        $I->click('#smsTemplateForm span.switchery-default');
        $I->fillField('#title', 'Заполнение Наименование');
        $I->fillField('#body', 'Заполнение Сообщение');
        $I->clickandcheck('#smsTemplateForm button');
        $I->seeindatabase('mailing_templates',
            [
                'title' => 'Заполнение Наименование',
                '#body' => 'Заполнение Сообщение'
            ]);
    }
}
