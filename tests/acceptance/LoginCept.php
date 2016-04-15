<?php 
date_default_timezone_set('UTC');

$I = new AcceptanceTester($scenario);
$I->wantTo('Check Login system');
$I->amOnPage("/admin");
$I->see("Login");

$I->fillField('[data-shortname=username]','root');
$I->fillField('[data-shortname=password]','root');
$I->click('Login');
$I->waitForElement('.field-error-text',10);
$I->see('Incorrect');
