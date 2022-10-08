<?php

use Core\Models\Acl;
use Models\Comment;

class CommentCest
{

    public function _before(AcceptanceTester $I)
    {
        $I->seedUserTable();
        $I->seedUnit();
    }

    /**
     * Заполняю блок Комментарий соискателя
     * @param AcceptanceTester $I
     * @group other
     */
    public function testSaveСomment(AcceptanceTester $I)
    {
        $I->login(USERNAME_RECRUITER);
        $I->amOnPage('units/edit/1');
        $I->fillField('textarea[id="comment"]', 'Проверка_комментария');
        $I->click('#commentForm button');
        $I->waitForElementVisible('table.table-xxs.table-with-icons');
        $I->see('Проверка_комментария', 'table.table-xxs.table-with-icons');
        $I->waitAndSeeInDatabase(Comment::$tableName,
            [
                'unit_id' => 1,
                'comment' => 'Проверка_комментария',
            ]
        );
    }

    /**
     * Вижу блок Комментарий соискателя
     * @param AcceptanceTester $I
     * @group other
     */
    public function testSeeСomment(AcceptanceTester $I)
    {
        $I->haveInDatabase(Comment::$tableName,
            [
                'user_id' => Acl::ROLE_MANAGER,
                'unit_id' => 1,
                'comment' => 'Проверка_комментария',
            ]
        );
        $I->login(USERNAME_RECRUITER);
        $I->amOnPage('units/edit/1');
        $I->waitForElementVisible('table.table-xxs.table-with-icons');
        $I->see('Проверка_комментария', 'table.table-xxs.table-with-icons');
    }
}
