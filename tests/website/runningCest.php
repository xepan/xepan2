<?php


class runningCest
{
    public function _before(Visitor $I)
    {
    }

    public function _after(Visitor $I)
    {
    }

    // tests
    public function test_home_page(Visitor $i)
    {
        $i->wantto('See if home page is running');
        $i->amOnPage('/');
        $i->waitPageLoad();
        $i->canSee('My Epans');
    }

    public function test_free_trial(Visitor $i){
        $i->wantTo('Check if free trial is working');
        $i->click('Free 14 days trial');
        $i->waitForPageLoad();
        $i->canSee('Sign in to continue');

        $i->click('Register now');

        $i->waitForText('Back To Login');

        $i->fillAtkField('first_name','Tester');
        $i->fillAtkField('last_name','User');
        $i->fillAtkField('email_id','wrong_id');
        $i->click('Register');

        $i->waitForElement('.field-error-text');
        $i->see('Name value "Company" already exists');

    } 
}
