<?php

use _generated\AcceptanceTesterActions;
use Codeception\Actor;
use Core\Models\Acl;
use Core\Models\Auth;
use Core\Models\Settings;
use Core\Models\User;
use Models\AbstractMessageQueue;
use Models\AccommodationPlace;
use Models\Citizenship;
use Models\City;
use Models\Documents;
use Models\Factories;
use Models\FactoriesAccommodationPlacesRelations;
use Models\FactoryMeta;
use Models\Feedback;
use Models\InsuranceCompany;
use Models\Mailing;
use Models\MailingTemplate;
use Models\OverallsRequestFactoryRelation;
use Models\OverallsRequests;
use Models\Phone;
use Models\PhoneRelations;
use Models\PrepaymentRow;
use Models\Prepayments;
use Models\Professions;
use Models\Request;
use Models\Sms;
use Models\TimetableChecks;
use Models\Unit;
use Models\UnitContractContractors;
use Models\UnitExperience;
use Models\UnitsMeta;
use Models\Updates;
use Models\UserClientCuratorRelations;
use Models\UserFactoryRelation;
use Models\Vacancy;
use Models\WorkDate;

const USERNAME_MANAGER = 'Manager';
const USERNAME_SUPER_MANAGER = 'SuperManager';
const USERNAME_RECRUITER = 'Recruiter';
const USERNAME_SUPER_RECRUITER = 'SuperRecruiter';
const USERNAME_MASTER = 'Master';
const USERNAME_SUPER_MASTER = 'SuperMaster';
const USERNAME_CURATOR = 'Curator';
const USERNAME_ADMIN = 'Admin';
const USERNAME_HR = 'Hr';
const USERNAME_KEEPER = 'Keeper';
const USERNAME_SUPER_KEEPER = 'SuperKeeper';
const USERNAME_RECRUITMENT_AGENCY = 'RecruitmentAgency';
const USERNAME_CLIENT = 'Client';
const USERNAME_CURATOR_OF_CLIENT = 'CuratorOfClient';
const USERNAME_BRIGADIER = 'Brigadier';
const USERNAME_MARKETER = 'Marketer';
const USERNAME_OPERATING_OFFICER = 'OperatingOfficer';

/**
 * Inherited Methods
 * @method void wantToTest($text)
 * @method void wantTo($text)
 * @method void execute($callable)
 * @method void expectTo($prediction)
 * @method void expect($prediction)
 * @method void amGoingTo($argumentation)
 * @method void am($role)
 * @method void lookForwardTo($achieveValue)
 * @method void comment($description)
 * @method void pause()
 *
 * @SuppressWarnings(PHPMD)
 */
class AcceptanceTester extends Actor
{

    use AcceptanceTesterActions;

    public bool $forceSeed = false;

    public function init()
    {
        require_once(ROOT . '/core/autoloader.php');
    }

    public function login(string $name, string $password = '1'): void
    {
        $I = $this;
        if ($I->loadSessionSnapshot('login-' . $name . '_' . $password)) {
            return;
        }
        $I->amOnPage('/');
        $I->submitForm('.js-form-sign-in', ['login' => $name, 'password' => $password]);
        $I->saveSessionSnapshot('login-' . $name . '_' . $password);
    }

    /** @deprecated */
    public function haveInDatabaseMulti($data)
    {
        $I = $this;
        foreach ($data as $tableName => $models) {
            foreach ($models as $model) {
                $I->haveInDatabase($tableName, $model);
            }
        }
    }

    /** @deprecated */
    public function fillFieldMulti(array $array)
    {
        $I = $this;
        foreach ($array as $key => $value) {
            $I->fillField($key, $value);
        }
    }

    /** @deprecated */
    public function clickMulti(array $array)
    {
        $I = $this;
        foreach ($array as $value) {
            $I->click($value);
        }
    }

    /** @deprecated */
    public function waitAndSeeInDatabaseMulti($data)
    {
        $I = $this;
        $I->wait(1);
        foreach ($data as $tableName => $models) {
            foreach ($models as $model) {
                $I->seeInDatabase($tableName, $model);
            }
        }
    }

    public function seeMessageInDatabase(array $user_id, $author_id, $message)
    {
        $I = $this;
        $I->wait(1);
        foreach ($user_id as $value) {
            $I->seeInDatabase('notification', ['user_id' => $value, 'author_id' => $author_id, 'factory_id' => '1', 'message' => $message]);
        }
    }

    public function seeInFieldMulti(array $array)
    {
        $I = $this;
        foreach ($array as $key => $value) {
            $I->seeInField($key, $value);
        }
    }

    public function seeMulti(array $array)
    {
        $I = $this;
        foreach ($array as $key => $value) {
            $I->see($key, $value);
        }
    }

    public function checkOptionMulti($data)
    {
        $I = $this;
        foreach ($data as $value) {
            $I->checkOption($value);
        }
    }

    public function sendQuery($query)
    {
        try {
            $DBH = new PDO("pgsql:host=localhost;dbname=postgres", 'postgres', 'root');
            $DBH->query($query);
        } catch (PDOException $e) {
            echo $e->getMessage();
        }
    }


    public function mergeAndSave(string $table, array $row, array $newData = []): void
    {
        foreach ($newData as $column => $value) {
            $row[$column] = $value;
        }
        if ($this->forceSeed) {
            Unit::$db->insert($table, array_keys($row), [array_values($row)], false);
        } else {
            $this->haveInDatabase($table, $row);
        }
    }

    public function seedUser(array $data = []): void
    {
        $row = [
            'id' => Acl::ROLE_MANAGER,
            'password' => Auth::getPasswordHash(1),
            'register_time' => '2020-01-01 09:00:00',
            'login' => USERNAME_MANAGER,
            'username' => USERNAME_MANAGER,
            'role_id' => Acl::ROLE_MANAGER,
            'is_superuser' => 0,
        ];

        $this->mergeAndSave(User::$tableName, $row, $data);
    }

    public function seedUserTable(): void
    {
        $users = [
            ['login' => USERNAME_MANAGER, 'role_id' => Acl::ROLE_MANAGER],
            ['login' => USERNAME_SUPER_MANAGER, 'role_id' => Acl::ROLE_MANAGER, 'is_superuser' => 1],
            ['login' => USERNAME_RECRUITER, 'role_id' => Acl::ROLE_RECRUIT],
            ['login' => USERNAME_SUPER_RECRUITER, 'role_id' => Acl::ROLE_RECRUIT, 'is_superuser' => 1],
            ['login' => USERNAME_MASTER, 'role_id' => Acl::ROLE_MASTER],
            ['login' => USERNAME_SUPER_MASTER, 'role_id' => Acl::ROLE_MASTER, 'is_superuser' => 1],
            ['login' => USERNAME_CURATOR, 'role_id' => Acl::ROLE_CURATOR],
            ['login' => USERNAME_ADMIN, 'role_id' => Acl::ROLE_ADMIN],
            ['login' => USERNAME_HR, 'role_id' => Acl::ROLE_HR],
            ['login' => USERNAME_KEEPER, 'role_id' => Acl::ROLE_KEEPER],
            ['login' => USERNAME_SUPER_KEEPER, 'role_id' => Acl::ROLE_KEEPER, 'is_superuser' => 1],
            ['login' => USERNAME_RECRUITMENT_AGENCY, 'role_id' => Acl::ROLE_RECRUITMENT_AGENCY],
            ['login' => USERNAME_CLIENT, 'role_id' => Acl::ROLE_CLIENT],
            ['login' => USERNAME_CURATOR_OF_CLIENT, 'role_id' => Acl::ROLE_CLIENT_CURATOR],
            ['login' => USERNAME_BRIGADIER, 'role_id' => Acl::ROLE_BRIGADIER],
            ['login' => USERNAME_MARKETER, 'role_id' => Acl::ROLE_MARKETER],
            ['login' => USERNAME_OPERATING_OFFICER, 'role_id' => Acl::ROLE_OPERATING_OFFICER],
        ];
        foreach ($users as $row) {
            $row['id'] = $row['role_id'] + (($row['is_superuser'] ?? 0) ? 100 : 0);
            $row['username'] = $row['login'];

            $this->seedUser($row);
        }
    }

    /** @deprecated Это устаревшая таблица */
    public function seedCities(int $id = 1): void
    {
        $this->mergeAndSave(City::$tableName, ['id' => $id, 'name' => 'Город' . $id, 'deleted' => 0]);
    }

    public function seedCitizenshipTable(): void
    {
        $this->mergeAndSave(Citizenship::$tableName, ['id' => 1, 'name' => 'РФ', 'deleted' => 0]);
        $this->mergeAndSave(Citizenship::$tableName, ['id' => 2, 'name' => 'Армения', 'deleted' => 0]);
        $this->mergeAndSave(Citizenship::$tableName, ['id' => 3, 'name' => 'Белоруссия', 'deleted' => 0]);
    }

    public function seedDocumentsTable(): void
    {
        $this->mergeAndSave(Documents::$tableName, ['id' => 1, 'type' => Documents::TYPE_INVOICE, 'timetable_check_id' => 1, 'number' => 1, 'amount' => 8, 'payed' => 0, 'status' => Documents::STATUS_NEW]);
    }

    public function seedInsuranceCompany(int $id = 1, string $name = 'СПАО РЕСО-Гарантия', int $active = 1, int $protected = 0, int $deleted = 0): void
    {
        $this->mergeAndSave(InsuranceCompany::$tableName, ['id' => $id, 'name' => $name, 'deleted' => $deleted, 'active' => $active, 'protected' => $protected]);
    }

    public function seedUnit(array $data = []): void
    {
        $row = [
            'id' => 1,
            'fio' => 'Тестовый Тест Тестович',
            'feedback' => 1,
            'bdate' => '2019-12-20',
            'created_by' => Acl::ROLE_MASTER,
            'citizenship_id' => 1,
            'email' => 'test@test.test',
            'status' => Unit::STATUS_APPLICANT,
        ];
        $this->mergeAndSave(Unit::$tableName, $row, $data);
    }

    public function seedUnitsMeta(int $unitId, string $key, string $value): void
    {
        $this->mergeAndSave(UnitsMeta::$tableName, ['uid' => $unitId, 'key' => $key, 'value' => $value]);
    }

    public function seedFactory(int $id = 1, int $contractor = 1, int $pid = 0, int $deleted = 0): void
    {
        $this->mergeAndSave(Factories::$tableName, ['id' => $id, 'name' => 'Предприятие' . $id, 'deleted' => $deleted, 'active' => 1, 'pid' => $pid, 'contractor' => $contractor]);
    }

    public function seedFactoryMeta(int $factoryId, string $key, string $value): void
    {
        $this->mergeAndSave(FactoryMeta::$tableName, ['factory_id' => $factoryId, 'key' => $key, 'value' => $value]);
    }

    public function seedFeedback(int $id = 1): void
    {
        $this->mergeAndSave(Feedback::$tableName, ['id' => $id, 'name' => 'Тестовый_источник_звонка' . $id, 'deleted' => 0]);
    }

    public function seedPhone(int $id = 1, string $phone = '79990000001', int $objectId = 1, string $objectType = PhoneRelations::OBJECT_TYPE_UNIT): void
    {
        $this->mergeAndSave(Phone::$tableName, ['id' => $id, 'phone' => $phone, 'is_valid' => true]);
        $this->mergeAndSave(PhoneRelations::$tableName, ['phone_id' => $id, 'object_id' => $objectId, 'object_type' => $objectType]);
    }

    public function seedProfession(int $id = 1, int $deleted = 0): void
    {
        $this->mergeAndSave(Professions::$tableName, ['id' => $id, 'name' => 'Профессия' . $id, 'deleted' => $deleted]);
    }

    public function seedSettingsTable(): void
    {
        $this->mergeAndSave(Settings::$tableName, ['id' => 1, 'key' => 'use_sms', 'value' => 0]);
    }

    public function seedUnitContractContractorsTable(): void
    {
        $this->mergeAndSave(UnitContractContractors::$tableName, ['id' => 1, 'name' => 'Контрактор1', 'deleted' => 0]);
        $this->mergeAndSave(UnitContractContractors::$tableName, ['id' => 2, 'name' => 'Контрактор2', 'deleted' => 0]);
    }

    public function seedUnitProfession(int $id = 1, int $unitId = 1, int $professionId = 1, $class = '1;9'): void
    {
        $this->mergeAndSave(UnitExperience::$tableName, ['id' => $id, 'unit_id' => $unitId, 'profession_id' => $professionId, 'class' => $class]);
    }

    public function seedUserFactoryRelation(int $userId = Acl::ROLE_MASTER, int $factoryId = 1): void
    {
        $this->mergeAndSave(UserFactoryRelation::$tableName, ['user_id' => $userId, 'factory_id' => $factoryId]);
    }

    public function seedSms(array $data = []): void
    {
        $row = [
            'id' => 1,
            'send_id' => 1,
            'unit_id' => 1,
            'phone' => '79990000001',
            'message' => 'Текст сообщения',
            'status' => Sms::STATUS_NEW,
        ];
        $this->mergeAndSave(Sms::$tableName, $row, $data);
    }

    public function seedMailing(array $data = []): void
    {
        $row = [
            'id' => 1,
            'service' => Mailing::SERVICE_SMS,
            'title' => 'Сообщение соискателю',
            'send_type' => 1,
            'param' => json_encode(['unitId' => 1]),
            'status' => AbstractMessageQueue::STATUS_NEW,
            'created_at' => '2021-03-24 09:06:04',
            'send_at' => '2021-03-24 09:06:04',
            'content' => 'Текст сообщения',
            'limit' => 0,
            'total_limit' => 0,
            'days_limit' => 0,
            'is_generated' => 1,
        ];
        $this->mergeAndSave(Mailing::$tableName, $row, $data);
    }

    public function seedMailingTemplate(array $data = []): void
    {
        $row = [
            'id' => 1,
            'title' => 'Поле Наименование',
            'body' => 'Поле Сообщение',
            'deleted' => 0,
            'user_id' => Acl::ROLE_RECRUIT,
        ];
        $this->mergeAndSave(MailingTemplate::$tableName, $row, $data);
    }

    public function seedOverallsRequest(int $id = 1, int $userId = Acl::ROLE_MASTER, int $status = OverallsRequests::STATUS_NEW): void
    {
        $this->mergeAndSave(OverallsRequests::$tableName, ['id' => $id, 'user_id' => $userId, 'status' => $status]);
    }

    public function seedOverallsRequestFactoryRelation(int $overallsRequestId = 1, int $factoryId = 1): void
    {
        $this->mergeAndSave(OverallsRequestFactoryRelation::$tableName, ['overalls_request_id' => $overallsRequestId, 'factory_id' => $factoryId]);
    }

    public function seedRequest(array $data = []): void
    {
        $conditions = [
            'employment' => '',
            'workDays' => ['5'],
            'freeDays' => ['2'],
            'fromTime' => ['09:00'],
            'toTime' => ['17:00'],
            'multiplier' => ['1'],
            'accommodation' => '',
            'accommodationCompensation' => '3500',
            'accommodationDescription' => '',
            'transit' => 'pay_next',
            'transitCompensation' => '1500',
            'transitCompensationPeriod' => 'month',
            'watchType' => Request::$watchTypes['60/30'],
            'overalls' => '',
        ];
        $requirements = [
            'requirements' => '<p>Поля Требования</p>',
            'age_from' => '23',
            'age_to' => '34',
            'equipment' => '',
            'citizenship' => '',
            'medical_commission' => '',
            'conviction' => '',
        ];
        $row = [
            'id' => 1,
            'profession_id' => 1,
            'factory_id' => 1,
            'count' => 1,
            'comment' => 'Тело комментария',
            'status' => Request::STATUS_NEW,
            'class' => '1;9',
            'rate' => 200,
            'conditions' => json_encode($conditions),
            'requirements' => json_encode($requirements),
            'duties' => '<p>Поля Обязанности</p>',
            'author_id' => Acl::ROLE_MASTER,
            'priority' => Request::PRIORITY_NORMAL,
        ];
        $this->mergeAndSave(Request::$tableName, $row, $data);
    }

    public function seedWorkDate(array $data = []): void
    {
        $row = [
            'id' => 1,
            'unit_id' => 1,
            'applied_at' => '2020-07-30',
            'profession_id' => 1,
            'class' => 0,
            'factory_id' => 1,
            'is_current' => 1,
            'work_by' => Acl::ROLE_MASTER,
            'rate' => 200,
            'request_id' => 1,
            'deleted' => false,
        ];
        $this->mergeAndSave(WorkDate::$tableName, $row, $data);
    }

    public function seedPrepayment(array $data = []): void
    {
        $row = [
            'id' => 1,
            'factory_id' => 1,
            'created_at' => '2021-07-14',
            'user_id' => Acl::ROLE_MASTER,
            'status' => Prepayments::STATUS_ON_CURATOR_APPROVAL,
        ];
        $this->mergeAndSave(Prepayments::$tableName, $row, $data);
    }

    /** По идее может быть только вместе с seedPrepayment */
    public function seedPrepaymentRow(int $id = 1, int $prepaymentId = 1, int $unitId = 1, int $amountId = 2000, int $status = 1): void
    {
        $this->mergeAndSave(PrepaymentRow::$tableName, ['id' => $id, 'prepayment_id' => $prepaymentId, 'unit_id' => $unitId, 'amount' => $amountId, 'status' => $status]);
    }

    /** Тоже на вид не надо */
    public function seedVacancy(array $data = []): void
    {
        $row = [
            'id' => 1,
            'title' => 'Поле должность',
            'intro' => 0,
            'description' => 0,
            'flag' => 'n',
            'ordering' => 4,
            'shift' => 'Заполнение смены',
            'price' => 45000,
            'legal_employment' => 0,
            'salary_frequency' => 'Заполнение выплаты',
            'published' => 1,
            'additional_type' => 0,
            'experience' => 'Заполнение опыта работы',
        ];
        $this->mergeAndSave(Vacancy::$tableName, $row, $data);
    }

    public function seedTimetableCheck(array $data = []): void
    {
        $row = [
            'id' => 1,
            'date' => '2020-07-31',
            'created_at' => '2020-07-31',
            'factory_id' => 1,
            'status' => TimetableChecks::STATUS_HR_APPROVED,
            'deleted' => 0,
            'data' => '2020-07-31',
            'timesheet_totals_master_id' => null,
        ];
        $this->mergeAndSave(TimetableChecks::$tableName, $row, $data);
    }

    public function seedFactoriesAccommodationPlacesRelation(int $factoryId = 1, int $placeId = 1): void
    {
        $this->mergeAndSave(FactoriesAccommodationPlacesRelations::$tableName, ['factory_id' => $factoryId, 'place_id' => $placeId]);
    }

    public function seedAccommodationPlace(array $data = []): void
    {
        $row = ['id' => 1, 'name' => 'AccomodationPlace', 'active' => 1, 'seats' => 5];
        $this->mergeAndSave(AccommodationPlace::$tableName, $row, $data);
    }

    public function seedUserClientCuratorRelation(int $userId = Acl::ROLE_CLIENT, int $clientCuratorId = Acl::ROLE_CLIENT_CURATOR): void
    {
        $this->mergeAndSave(UserClientCuratorRelations::$tableName, ['user_id' => $userId, 'client_curator_id' => $clientCuratorId]);
    }

    public function seedUpdatesTable(): void
    {
        $this->mergeAndSave(Updates::$tableName, [
            'id' => 1,
            'title' => 'Обновление 1',
            'icon' => 'icon-bug2',
            'color' => 'success',
            'author_id' => Acl::ROLE_ADMIN,
            'content' => 'Test',
            'created_at' => '2021-01-01 00:00:01',
        ]);
    }

}
