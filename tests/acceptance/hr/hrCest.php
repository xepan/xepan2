<?php
namespace hr;

use \SuperUser;
use \Codeception\Util\Locator;

class hrCest
{
    public function _before(SuperUser $I)
    {
    }

    public function _after(SuperUser $I)
    {
    }

    
    public function test_default_non_editable_department_named_company(SuperUser $i)
    {
        $i->wantTo('Test if default "Company" named department is there and it is non editable');
        $i->login();
        $i->click('HR');
        $i->click('Department');
        $i->waitPageLoad();
        $i->see('Company',Locator::elementAt('//table/tbody/tr/td', 1));
        $i->dontSeeElementInDOM('table tbody tr:first-child  td:last-child a');

        $i->wantTo('Test Quick Search');
        
        $i->fillField('[data-shortname=q]','comp');
        $i->pressKey('[data-shortname=q]',\Facebook\WebDriver\WebDriverKeys::ENTER);
        $i->waitPageLoad();
        $i->see('Company',Locator::elementAt('//table/tbody/tr/td', 1));

        $i->fillField('[data-shortname=q]','xxxxssssss');
        $i->pressKey('[data-shortname=q]',\Facebook\WebDriver\WebDriverKeys::ENTER);
        $i->waitPageLoad();
        $i->see('No matching records found');
        $i->seeElementInDOM('span.icon-cancel');

        $i->fillField('[data-shortname=q]','');
        $i->pressKey('[data-shortname=q]',\Facebook\WebDriver\WebDriverKeys::ENTER);
        $i->waitPageLoad();
        $i->dontSee('No matching records found');
        $i->see('Company',Locator::elementAt('//table/tbody/tr/td', 1));

        $i->selectOptionForSelect2("[data-shortname=status]",'Active');
        $i->waitPageLoad();
        $i->see('Company',Locator::elementAt('//table/tbody/tr/td', 1));
        
        $i->selectOptionForSelect2("[data-shortname=status]",'Inactive');
        $i->waitPageLoad();
        $i->dontSee('Company',Locator::elementAt('//table/tbody/tr/td', 1));

    }

    function test_sorting(SuperUser $i){
        $i->see('NOT IMPLEMENTED');
    }

    function test_add_department(SuperUser $i){
        $i->login();
        $i->waitPageLoad();
        $i->click('HR');
        $i->click('Department');
        $i->waitPageLoad();
        $i->click('Add Department');
        $i->waitPageLoad();
        $i->see('Adding new Department');

        $i->fillField('[data-shortname=name]','Company');
        $i->click('Add');
        $i->waitForElement('.field-error-text');
        $i->see('Name value "Company" already exists');

    }
}
