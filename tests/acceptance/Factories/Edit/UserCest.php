<?php

use Codeception\Example;
use Core\Models\Acl;
use Models\UserFactoryRelation;

/**
 * Class EditCest
 *
 * @property int $table
 */
class EditCest
{

    public function _before(AcceptanceTester $I)
    {
        $I->seedUserTable();
        $I->seedUserFactoryRelation();
        $I->seedFactory();
    }

    /**
     * Массив юзеров, ID, и части селекторов
     *
     * @return array
     */
    protected function _attachArray()
    {
        return $data =
            [
                ['user' => USERNAME_MASTER, 'userId' => Acl::ROLE_MASTER, 'selectorPart' => USERNAME_MASTER],
                ['user' => USERNAME_CURATOR, 'userId' => Acl::ROLE_CURATOR, 'selectorPart' => USERNAME_CURATOR],
                ['user' => USERNAME_BRIGADIER, 'userId' => Acl::ROLE_BRIGADIER, 'selectorPart' => USERNAME_BRIGADIER],
                ['user' => USERNAME_HR, 'userId' => Acl::ROLE_HR, 'selectorPart' => 'HR'],
                ['user' => USERNAME_OPERATING_OFFICER, 'userId' => Acl::ROLE_OPERATING_OFFICER, 'selectorPart' => USERNAME_OPERATING_OFFICER],
            ];
    }

    /**
     * Прикрепляем Мастера к Предприятию
     *
     * @param AcceptanceTester $I
     * @param Example $example
     *
     * @dataProvider _attachArray
     * @group other
     */
    public function testAttach(AcceptanceTester $I, Example $example)
    {
        $selectorPart = '#users' . $example['selectorPart'] . 'sForm';
        $I->wantToTest('Attach user:"' . $example['user']);
        $factoryId = 1;
        $I->login(USERNAME_MANAGER);
        $I->amOnPage('factories/edit/' . $factoryId);
        $I->selectOption($selectorPart . ' select[name="users[]"]', $example['user']);
        $I->click($selectorPart . ' button.btn-primary');
        $I->waitForText('Успешно обновлено', 5, $selectorPart . ' .validation-valid-label');
        $I->seeInDatabase(UserFactoryRelation::$tableName, ['user_id' => $example['userId'], 'factory_id' => $factoryId]);
        $I->clearTables([UserFactoryRelation::$tableName]);
    }
}
