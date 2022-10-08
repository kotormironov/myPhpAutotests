<?php

use Codeception\Example;
use Core\Models\Acl;

class AuthCest
{

    public function _before(AcceptanceTester $I)
    {
        $I->init();
        $I->seedUser(['id' => Acl::ROLE_MANAGER, 'login' => USERNAME_MANAGER, 'role_id' => Acl::ROLE_MANAGER]);
        $I->seedUser(['id' => Acl::ROLE_ADMIN, 'login' => USERNAME_ADMIN, 'role_id' => Acl::ROLE_ADMIN]);
    }

    protected function authProvider(): array
    {
        return [
            ['login' => USERNAME_ADMIN, 'password' => '1', 'inUrl' => Acl::PRESENTER_MONITORING],
            ['login' => USERNAME_ADMIN, 'password' => '2', 'inUrl' => '/'],
            ['login' => USERNAME_MANAGER, 'password' => '2', 'inUrl' => '/'],
        ];
    }

    /**
     * @param AcceptanceTester $I
     * @param Example $example
     *
     * @dataProvider authProvider
     */
    public function testUserAuth(AcceptanceTester $I, Example $example)
    {
        $I->login($example['login'], $example['password']);
        $I->seeInCurrentUrl($example['inUrl']);
    }

}
