<?php

use Codeception\Example;
use Core\Models\Acl;
use Core\Models\User;
use Models\AccommodationPlace;
use Models\Documents;
use Models\Factories;
use Models\FactoriesAccommodationPlacesRelations;
use Models\Feedback;
use Models\Mailing;
use Models\MailingTemplate;
use Models\OverallsRequestFactoryRelation;
use Models\OverallsRequests;
use Models\PrepaymentRow;
use Models\Prepayments;
use Models\Professions;
use Models\Request;
use Models\Sms;
use Models\TimetableChecks;
use Models\Unit;
use Models\Updates;
use Models\UserFactoryRelation;
use Models\Vacancy;

class UserGoToPageCest
{

    private bool $inited = false;

    public function _before(AcceptanceTester $I)
    {
        if ($this->inited) {
            return;
        }

        $this->inited = true;
        $I->forceSeed = true;
        $I->seedUserTable();
        $I->seedDocumentsTable();
        $I->seedUnit();
        $I->seedFactory();
        $I->seedFeedback();
        $I->seedProfession();
        $I->seedUserFactoryRelation();
        $I->seedUserFactoryRelation(Acl::ROLE_MASTER + 100);
        $I->seedUserFactoryRelation(Acl::ROLE_CURATOR);
        $I->seedUserFactoryRelation(Acl::ROLE_HR);
        $I->seedUserFactoryRelation(Acl::ROLE_BRIGADIER);
        $I->seedUserFactoryRelation(Acl::ROLE_CURATOR);
        $I->seedSms();
        $I->seedMailing();
        $I->seedMailingTemplate();
        $I->seedOverallsRequest();
        $I->seedOverallsRequest(2, Acl::ROLE_MASTER, OverallsRequests::STATUS_COMPLETED);
        $I->seedOverallsRequest(3, Acl::ROLE_MASTER + 100, OverallsRequests::STATUS_TO_GIVE_OUT);
        $I->seedOverallsRequestFactoryRelation();
        $I->seedOverallsRequestFactoryRelation(2);
        $I->seedOverallsRequestFactoryRelation(3);
        $I->seedRequest();
        $I->seedPrepayment();
        $I->seedPrepayment(['id' => 2, 'status' => 6]);
        $I->seedPrepaymentRow();
        $I->seedPrepaymentRow(2, 2);
        $I->seedVacancy();
        $I->seedTimetableCheck();
        $I->seedFactoriesAccommodationPlacesRelation();
        $I->seedAccommodationPlace();
        $I->seedUpdatesTable();
        $I->forceSeed = false;
    }

    protected function userLinksProvider(): array
    {
        $links = [
            USERNAME_MANAGER => [
                Acl::PRESENTER_ACCOMMODATION => ['', 'timesheet/1', 'view/1'],
                Acl::PRESENTER_CABINET => ['', 'myUnits', 'myCalls'],
                Acl::PRESENTER_CALENDAR => [],
                Acl::PRESENTER_CURATOR => [],
                Acl::PRESENTER_CONVERSIONS => [''],
                Acl::PRESENTER_DICTIONARIES => [
                    '',
                    'edit/professions',
                    'edit/factories',
                    'edit/feedback',
                    'edit/cities',
                    'edit/citizenship',
                    'edit/accommodation_places',
                    'edit/overalls_list',
                    'edit/unit_contract_contractors',
                    'edit/recruits_groups',
                    'edit/documents_types',
                    'edit/dic_languages',
                    'edit/dic_insurance_companies',
                    'edit/professions',
                ],
                Acl::PRESENTER_DOCUMENTS => ['', 'view/1'],
                Acl::PRESENTER_FACTORIES => ['', 'edit/1'],
                Acl::PRESENTER_FEEDBACK => [],
                Acl::PRESENTER_GLOBAL_MESSAGE => [],
                Acl::PRESENTER_LEADS => [],
                Acl::PRESENTER_KEEPER => ['', 'timetable'],
                Acl::PRESENTER_MASTER => ['timetable/1'],
                Acl::PRESENTER_MIGRANTS => ['', 'permitDocumentExpiration', 'registrationExpiration', 'policyExpiration', 'timetable/1'],
                Acl::PRESENTER_NOTIFICATIONS => [],
                Acl::PRESENTER_PLAN => [],
                Acl::PRESENTER_REQUESTS => ['', 'create', 'view/1', 'factoryview/1'],
                Acl::PRESENTER_OVERALLS => ['', 'reserve', 'view/1'],
                Acl::PRESENTER_PREPAYMENTS => ['', 'view/1'],
                Acl::PRESENTER_SECURITY => [],
                Acl::PRESENTER_SELF_EMPLOYED => [],
                Acl::PRESENTER_SETTINGS => [],
                Acl::PRESENTER_STATISTIC => ['overalls', 'flow', 'rotation', 'spp', 'accommodation', 'recruits', 'from', 'oriented', 'work', 'requests', 'recruitsstat', 'requestsDynamic', 'call'],
                Acl::PRESENTER_SUMMARY => [],
                Acl::PRESENTER_UNITS => ['', 'deleted', 'documents', 'edit/1'],
                Acl::PRESENTER_UPDATES => ['', 'view/1'],
                Acl::PRESENTER_USERS => ['', 'profile', 'edit/1'],
                Acl::PRESENTER_VACANCIES => ['', 'edit/1'],
                Acl::PRESENTER_WAREHOUSE => [],
                Acl::PRESENTER_WHATSAPP => ['setup', 'createMailing'],
            ],
            USERNAME_SUPER_MANAGER => [
                Acl::PRESENTER_MAILING => ['', 'templates', 'editTemplate/1'],
                Acl::PRESENTER_MAILING . '?action=sms' => [],
                Acl::PRESENTER_MAILING . '?action=whatsapp' => [],
                //Acl::PRESENTER_SMS => ['createMailing', 'view/1'], // TODO Почему то не работает
            ],
            USERNAME_RECRUITER => [
                Acl::PRESENTER_ACCOMMODATION => ['', 'timesheet/1', 'view/1'],
                Acl::PRESENTER_CABINET => ['', 'myUnits', 'myCalls'],
                Acl::PRESENTER_CURATOR => [],
                Acl::PRESENTER_FACTORIES => ['', 'edit/1'],
                Acl::PRESENTER_LEADS => [],
                Acl::PRESENTER_MASTER => ['timetable/1'],
                Acl::PRESENTER_NOTIFICATIONS => [],
                Acl::PRESENTER_PLAN => [],
                Acl::PRESENTER_REQUESTS => ['view/1', 'factoryview/1'],
                Acl::PRESENTER_STATISTIC => ['work', 'recruits'], //проверить recruits у остальных
                Acl::PRESENTER_UNITS => ['', 'deleted', 'documents', 'edit/1'],
                Acl::PRESENTER_UPDATES => ['', 'view/1'],
                Acl::PRESENTER_USERS => ['', 'profile', 'edit/1'],
            ],
            USERNAME_SUPER_RECRUITER => [
                Acl::PRESENTER_ACCOMMODATION => ['', 'timesheet/1', 'view/1'],
                Acl::PRESENTER_CABINET => ['', 'myUnits', 'myCalls'],
                Acl::PRESENTER_CURATOR => [],
                Acl::PRESENTER_FACTORIES => ['', 'edit/1'],
                Acl::PRESENTER_LEADS => [],
                Acl::PRESENTER_MASTER => ['timetable/1'],
                Acl::PRESENTER_NOTIFICATIONS => [],
                Acl::PRESENTER_PLAN => [],
                Acl::PRESENTER_REQUESTS => ['view/1', 'factoryview/1'],
                Acl::PRESENTER_STATISTIC => ['work', 'recruits'], //проверить recruits у остальных
                Acl::PRESENTER_UNITS => ['', 'deleted', 'documents', 'edit/1'],
                Acl::PRESENTER_UPDATES => ['', 'view/1'],
                Acl::PRESENTER_USERS => ['', 'profile', 'edit/1'],
            ],
            USERNAME_MASTER => [
                Acl::PRESENTER_ACCOMMODATION => ['', 'view/1'],
                Acl::PRESENTER_FACTORIES => ['', 'edit/1'],
                Acl::PRESENTER_MASTER => ['', 'timetable/1'],
                Acl::PRESENTER_OVERALLS => ['', 'create', 'giveOut/3', 'reserve', 'edit/1', 'view/2'],
                Acl::PRESENTER_PLAN => [],
                Acl::PRESENTER_PREPAYMENTS => ['', 'edit/2', 'view/1'],
                Acl::PRESENTER_REQUESTS => ['', 'edit/1', 'view/1', 'factoryview/1'],
                Acl::PRESENTER_UNITS => ['', 'deleted', 'documents', 'edit/1'],
                Acl::PRESENTER_USERS => ['', 'edit/1', 'profile'],
                Acl::PRESENTER_WAREHOUSE => [],
            ],
            USERNAME_CURATOR => [
                Acl::PRESENTER_ACCOMMODATION => ['', 'view/1'],
                Acl::PRESENTER_CURATOR => [],
                Acl::PRESENTER_DOCUMENTS => ['', 'view/1'],
                Acl::PRESENTER_FACTORIES => ['', 'edit/1'],
                Acl::PRESENTER_MASTER => ['timetable/1'],
                Acl::PRESENTER_OVERALLS => ['', 'reserve', 'view/1'],
                Acl::PRESENTER_PLAN => [],
                Acl::PRESENTER_PREPAYMENTS => ['', 'view/1'],
                Acl::PRESENTER_REQUESTS => ['', 'factoryview/1'],
                Acl::PRESENTER_STATISTIC => ['overalls', 'requests'],
                Acl::PRESENTER_UNITS => ['', 'deleted', 'documents', 'edit/1'],
                Acl::PRESENTER_USERS => ['', 'edit/1', 'profile'],
                Acl::PRESENTER_WAREHOUSE => [],
            ],
            USERNAME_ADMIN => [
                Acl::PRESENTER_ACCOMMODATION => ['', 'view/1', 'timesheet/1'],
                Acl::PRESENTER_CABINET => ['', 'myUnits', 'myCalls'],
                Acl::PRESENTER_CALENDAR => [],
                Acl::PRESENTER_CONVERSIONS => [''],
                Acl::PRESENTER_CURATOR => [],
                Acl::PRESENTER_DICTIONARIES => [
                    '',
                    'edit/professions',
                    'edit/factories',
                    'edit/feedback',
                    'edit/cities',
                    'edit/citizenship',
                    'edit/accommodation_places',
                    'edit/overalls_list',
                    'edit/unit_contract_contractors',
                    'edit/recruits_groups',
                    'edit/documents_types',
                    'edit/dic_languages',
                    'edit/dic_insurance_companies',
                    'edit/professions',
                ],
                Acl::PRESENTER_DOCUMENTS => ['', 'view/1'],
                Acl::PRESENTER_FACTORIES => ['', 'edit/1'],
                Acl::PRESENTER_FEEDBACK => [],
                Acl::PRESENTER_KEEPER => ['', 'timetable'],
                Acl::PRESENTER_MAILING => ['', 'templates', 'editTemplate/1'],
                Acl::PRESENTER_MAILING . '?action=sms' => [],
                Acl::PRESENTER_MAILING . '?action=whatsapp' => [],
                Acl::PRESENTER_LEADS => [],
                Acl::PRESENTER_MASTER => ['', 'timetable/1'],
                Acl::PRESENTER_MIGRANTS => ['', 'timetable?factory_id=1'],
                Acl::PRESENTER_OVERALLS => ['', 'reserve', 'view/2'],
                Acl::PRESENTER_PLAN => [],
                Acl::PRESENTER_PREPAYMENTS => ['', 'view/1'],
                Acl::PRESENTER_REQUESTS => ['', 'edit/1', 'view/1', 'factoryview/1'],
                Acl::PRESENTER_SECURITY => [],
                Acl::PRESENTER_SETTINGS => [],
                Acl::PRESENTER_STATISTIC => ['accommodation', 'call', 'flow', 'from', 'oriented', 'overalls', 'recruits', 'recruitsstat', 'requests', 'requestsDynamic', 'rotation', 'spp', 'work'],
                Acl::PRESENTER_SUMMARY => [],
                Acl::PRESENTER_UNITS => ['', 'deleted', 'documents', 'edit/1'],
                Acl::PRESENTER_USERS => ['', 'edit/1', 'profile'],
                Acl::PRESENTER_VACANCIES => ['', 'edit/1'],
                Acl::PRESENTER_WAREHOUSE => [],
                Acl::PRESENTER_WHATSAPP => ['setup', 'createMailing'],
                // Acl::PRESENTER_MONITORING => [], выдает варнинги
                Acl::PRESENTER_VIBER => ['', 'setup'],
            ],
            USERNAME_HR => [
                Acl::PRESENTER_ACCOMMODATION => ['', 'view/1', 'timesheet/1'],
                Acl::PRESENTER_CABINET => ['', 'myUnits', 'myCalls'],
                Acl::PRESENTER_CURATOR => [],
                Acl::PRESENTER_FACTORIES => ['', 'edit/1'],
                Acl::PRESENTER_LEADS => [],
                Acl::PRESENTER_MASTER => ['timetable/1'],
                Acl::PRESENTER_MIGRANTS => ['', 'timetable?factory_id=1'],
                Acl::PRESENTER_PLAN => [],
                Acl::PRESENTER_STATISTIC => ['call', 'flow', 'rotation', 'spp'],
                Acl::PRESENTER_UNITS => ['', 'deleted', 'documents', 'edit/1'],
                Acl::PRESENTER_USERS => ['', 'edit/1', 'profile'],
                Acl::PRESENTER_WHATSAPP => ['createMailing'],
            ],
            USERNAME_KEEPER => [
                Acl::PRESENTER_DOCUMENTS => ['', 'view/1'],
                Acl::PRESENTER_FACTORIES => ['', 'edit/1'],
                Acl::PRESENTER_KEEPER => ['', 'timetable'],
                Acl::PRESENTER_OVERALLS => ['', 'reserve', 'view/2'],
                Acl::PRESENTER_PREPAYMENTS => ['', 'view/1'],
                Acl::PRESENTER_STATISTIC => ['accommodation'],
                Acl::PRESENTER_USERS => ['profile'],
                Acl::PRESENTER_UNITS => ['', 'deleted', 'documents', 'edit/1'],
                Acl::PRESENTER_WAREHOUSE => [],
            ],
            USERNAME_SUPER_KEEPER => [
                Acl::PRESENTER_DOCUMENTS => ['', 'view/1'],
                Acl::PRESENTER_FACTORIES => ['', 'edit/1'],
                Acl::PRESENTER_KEEPER => ['', 'timetable'],
                Acl::PRESENTER_OVERALLS => ['', 'reserve', 'view/2'],
                Acl::PRESENTER_PREPAYMENTS => ['', 'view/1'],
                Acl::PRESENTER_STATISTIC => ['accommodation'],
                Acl::PRESENTER_UNITS => ['', 'deleted', 'documents', 'edit/1'],
                Acl::PRESENTER_USERS => ['', 'edit/1', 'profile'],
                Acl::PRESENTER_WAREHOUSE => [],
            ],
            USERNAME_RECRUITMENT_AGENCY => [
                Acl::PRESENTER_PLAN => [],
                // Acl::PRESENTER_MAILING => ['', 'templates', 'editTemplate/1'],
                // Acl::PRESENTER_MAILING . '?action=sms' => [],
                // Acl::PRESENTER_MAILING . '?action=whatsapp' => [],
                Acl::PRESENTER_STATISTIC => ['work'],
                //    Acl::PRESENTER_USERS => ['profile'], не реализовано
                Acl::PRESENTER_UNITS => [],
            ],
            USERNAME_CLIENT => [
                Acl::PRESENTER_DOCUMENTS => ['', 'view/1'],
                Acl::PRESENTER_REQUESTS => [],
                Acl::PRESENTER_STATISTIC => ['requests'],
                Acl::PRESENTER_SUMMARY => [],
                Acl::PRESENTER_USERS => ['edit/1', 'profile'],
                Acl::PRESENTER_TIMETABLES => [],
                Acl::PRESENTER_BUDGET => [],
            ],
            USERNAME_CURATOR_OF_CLIENT => [
                Acl::PRESENTER_DOCUMENTS => ['view/1'],
                Acl::PRESENTER_REQUESTS => [],
                Acl::PRESENTER_STATISTIC => ['requests'],
                Acl::PRESENTER_SUMMARY => [],
                Acl::PRESENTER_USERS => ['profile'],
                Acl::PRESENTER_TIMETABLES => [],
                Acl::PRESENTER_BUDGET => [],
            ],
            USERNAME_BRIGADIER => [
                Acl::PRESENTER_MASTER => ['', 'timetable/1'],
                Acl::PRESENTER_UNITS => ['', 'edit/1'],
                Acl::PRESENTER_USERS => ['profile'],
            ],

            // Обязательно должно стоять последним это костыль чтобы базу не мучать
            'LastTest' => ['test' => []],
        ];

        $data = [];
        foreach ($links as $login => $presenters) {
            foreach ($presenters as $presenter => $actions) {
                if (empty($actions)) {
                    $data[] = [
                        'login' => $login,
                        'link' => "/$presenter",
                    ];
                } else {
                    foreach ($actions as $action) {
                        if (empty($action)) {
                            $data[] = [
                                'login' => $login,
                                'link' => "/$presenter",
                            ];
                        } else {
                            $data[] = [
                                'login' => $login,
                                'link' => "/$presenter/$action",
                            ];
                        }
                    }
                }
            }
        }

        return $data;
    }

    /**
     * Проходим по страницам для поиска ошибок ("красноты" и прочие)
     *
     * @param AcceptanceTester $I
     * @param Example $example
     *
     * @dataProvider userLinksProvider
     *
     * @group smoke
     */
    public function testAllPagesOpen(AcceptanceTester $I, Example $example)
    {
        if ($example['login'] === 'LastTest') {
            $I->clearTables(
                [
                    Factories::$tableName,
                    User::$tableName,
                    Unit::$tableName,
                    UserFactoryRelation::$tableName,
                    Documents::$tableName,
                    Feedback::$tableName,
                    Professions::$tableName,
                    Sms::$tableName,
                    Mailing::$tableName,
                    MailingTemplate::$tableName,
                    OverallsRequests::$tableName,
                    OverallsRequestFactoryRelation::$tableName,
                    Request::$tableName,
                    Prepayments::$tableName,
                    PrepaymentRow::$tableName,
                    Vacancy::$tableName,
                    TimetableChecks::$tableName,
                    FactoriesAccommodationPlacesRelations::$tableName,
                    AccommodationPlace::$tableName,
                    Updates::$tableName,
                ]
            );

            return;
        }
        $I->login($example['login']);
        $I->wantToTest('open "' . $example['link'] . '" page by ' . $example['login']);
        $I->amOnPage($example['link']);

        //$I->wait(100);

        $I->dontSeeInPageSource('Exception');
        $I->dontSeeInPageSource('404: Not found');
        $I->dontSeeInPageSource('404: Ничего не найдено');
        $I->seeCurrentUrlEquals($example['link']);
    }

}
