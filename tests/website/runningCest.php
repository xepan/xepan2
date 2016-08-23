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
        return;
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
        $i->wait(4);
        $i->click('Got it!');
        $i->fillAtkField('epan_name','001testepan');
        $i->waitForText('Free 14 day Trial');
        $i->click(['css'=>'.xepan-service-trial button']);
        $i->wait(200);

        // remove wait in case of online testing
        // add test for links click (admin/website/myaccount)
    } 

    public function test_user_subscription(Visitor $i){
        return;
        $i->click('Blog');
        $i->waitForText('Blogs','10');
        $i->fillAtkField('first_name','test');
        $i->fillAtkField('last_name','user');
        $i->fillAtkField('email','02test@gmail.com');
        $i->click('Got it!');
        $i->click('Submit');
        $i->waitForText('Done','20');
        
        $i->fillAtkField('first_name','test');
        $i->fillAtkField('last_name','user');
        $i->fillAtkField('email','abcd@gmail.com');
        $i->click('Submit');
        $i->waitForText('Already Subscribed','20');
    }

    public function test_user_enquiry(Visitor $i){
        return;
        $i->click('Got it!');
        $i->click('Contact Us');
        $i->waitForText('Drop Your Messages','10');
        $i->fillAtkField('Name','test user');
        $i->fillAtkField('Email','a@gmail.com');
        $i->fillAtkField('Message','blah blah');
        $i->click('Queries ??');
        // $i->waitForText('');
        // CAPTCHA PROBLEM
    }

    public function test_epan_documentation(Visitor $i){
        $i->amOnPage('/');
        $i->waitPageLoad();
        $i->canSee('My Epans');
        $i->click('Documentation');
        $i->wait('10');
    }
}