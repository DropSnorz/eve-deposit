<?php
class CoreCest 
{
    public function frontpageWorks(AcceptanceTester $I)
    {
        $I->amOnPage('/');
        $I->see('Business App');  

    }

    public function loginWorks(AcceptanceTester $I){

        $I->amOnPage('/login');
        $I->fillField('username', 'admin');
        $I->fillField('password', 'admin');
        $I->click('Login');
        $I->amOnPage('/admin/dashboard');

    }
}

