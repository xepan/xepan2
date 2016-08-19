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

        $i->wantTo('Check if registration is working');
        $i->fillAtkField('first_name','Tester');
        $i->fillAtkField('last_name','User');
        $i->fillAtkField('username','abc@gmail.com');
        $i->click('Register');
        $i->waitForText('Password must not be empty');
        
        $i->fillAtkField('password','123');
        $i->click('Register');
        $i->waitForText('Password did not match');

        $i->fillAtkField('retype_password','abc@gmail.com');
        $i->click('Register');
        $i->waitForText('Password did not match');

        $i->fillAtkField('retype_password','123');
        $i->click('Register');
        $i->waitForText('Sign in to continue');
        
        $hash = $i->grabFromDatabase('user', 'hash', array('username' => 'abc@gmail.com'));
        $i->click('Activate');
        $i->waitForText('Activate your Account');

        $i->fillAtkField('email','abc@gmail.com');
        $i->fillAtkField('activation_code',$hash);
        $i->click('Verify');              
        $i->waitForText('Sign in to continue');
        
        $i->login('abc@gmail.com','123');
    } 
}