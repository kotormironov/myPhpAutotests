<?php

use Models\UnitsRating;

class RatingBlockCest
{

    public function _before(AcceptanceTester $I)
    {
        $I->seedUserTable();
        $I->seedUnit();
    }

    /**
     * Выставление оценки соискателю Рекрутером.
     * До устройства на работу.
     * @param AcceptanceTester $I
     * @group other
     */
    public function testSaveStars(AcceptanceTester $I)
    {
        $I->login(USERNAME_RECRUITER);
        $I->amOnPage('units/edit/1');
        $I->waitForElementVisible('#ratingBlock button.bg-teal-400.js-rate-unit', 5);
        $I->click('#ratingBlock button.bg-teal-400.js-rate-unit');
        $I->waitForElementVisible('#ratingBlock [data-rating="7"]', 6);
        $I->click('#ratingBlock [data-rating="7"]');
        $I->fillField('#ratingBlock .col-md-12 input', 'ЗаполнениеКомментария');
        $I->click('#saveRating');
        $I->waitAndSeeInDatabase(UnitsRating::$tableName,
            [
                'unit_id' => 1,
                'rating' => 7,
                'type' => 1,
                'comment' => 'ЗаполнениеКомментария',
            ]
        );
    }
}
