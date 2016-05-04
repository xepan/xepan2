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
        
        $i->searchFor('comp');
        $i->see('Company',Locator::elementAt('//table/tbody/tr/td', 1));

        $i->searchFor('xxxxssssss');
        $i->see('No matching records found');

        $i->searchFor('');
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

        $i->fillAtkField('name','Company');
        $i->click('Add');
        $i->waitForElement('.field-error-text');
        $i->see('Name value "Company" already exists');

        $i->fillAtkField('name','Desining');
        $i->click('Add');
        $i->waitForText('Production Level must be filled',10);
       
        $i->fillAtkField('production_level','initial_stage');
        $i->click('Add');
        $i->waitForText('Production_level must be an integer: eg 1234',5);

        $i->fillAtkField('production_level','0');
        $i->click('Add');
        $i->waitForText('Production_level must be greater than 0',5);


        $i->fillAtkField('production_level','1');
        $i->click('Add');
        $i->waitForPageLoad();
        $i->see('Desining',['css'=>'table tbody tr:nth-child(2) td:first-child']);

        $i->click(['css'=>'table tbody tr:nth-child(2) td:nth-child(4) button']);
        $i->click('Deactivate');
        $i->waitForPageLoad();
        $i->see('InActive');

        $i->click(['css'=>'table tbody tr:nth-child(2) td:nth-child(4) button']);
        $i->click('Activate');
        $i->waitForPageLoad();
        $i->see('Active',['css'=>'table tbody tr:nth-child(2) td:nth-child(4)']);

        $i->click(['css'=>'table tbody tr:nth-child(2) td:nth-child(5) a.pb_edit']);
        $i->waitForPageLoad();
        $i->see('Editing Department');

        $i->seeInField('[data-shortname=name]','Desining');
        $i->fillAtkField('name','Designing');
        $i->click('Save');
        $i->waitForPageLoad();
        $i->see('Designing');
        $i->dontSee('Desining');

        // Delete Test
        $i->click('Add Department');
        $i->waitForPageLoad();
        $i->fillAtkField('name','test to delete');
        $i->fillAtkField('production_level',2);
        $i->click('Add');
        $i->waitForPageLoad();
        $i->see('test to delete');

        $i->click(['css'=>'table tbody tr:nth-child(3) td:nth-child(5) a.do-delete']);
        $i->acceptPopup();
        $i->waitForPageLoad();
        $i->dontSee('test to delete');
        $i->waitForText('Deleted Successfully',5);

        $i->wait(5);
    }

    function testACL(SuperUser $i){
        $i->login();
        $i->changeACL('Intern','xepan\hr/Department',['Active'=>['view'=>'Selft only','edit'=>'None']]);
    }


}