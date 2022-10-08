<?php

use \Codeception\Example;

class LeadsCest
{

    public function _before(AcceptanceTester $I)
    {
        $I->init();
    }

    /**
     *  Видим добавленную группу в Блоке Статистика по сроку обработки заявки
     *
     * @param AcceptanceTester $I
     * @param Example $example
     * @throws Exception
     *
     * @example ["Manager"]
     * @example ["SuperManager"]
     * @example ["ManagerChief"]
     * @example ["SuperRecruiter"]
     * @example ["Master"]
     * @example ["SuperMaster"]
     * @example ["Curator"]
     * @example ["SuperCurator"]
     * @example ["Admin"]
     * @example ["SuperAdmin"]
     *
     * @group other
     */
    public function _testSeeGroupInStatistic(AcceptanceTester $I, Example $example)
    {
        $I->haveInDatabase('recruits_groups',
            [
                'name' => 'Тестовая группа',
                'deleted' => '0',
                'active' => '1',
                'protected' => '1',
            ]
            );
        $I->login($example[0], 1);
        $I->amOnPage('leads');
        $I->see('Тестовая группа', '.d-flex.justify-content-between');
    }

}
