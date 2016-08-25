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
        $i->login('management@xavoc.com');
        $i->clickMenu('HR->Department');
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

        $i->click('Active');
        $i->waitPageLoad();
        $i->click('InActive');
        $i->waitPageLoad();
    }

    // function test_sorting(SuperUser $i){
    //     $i->see('NOT IMPLEMENTED');
    // }

    function test_add_department(SuperUser $i){
        $i->login('management@xavoc.com');
        $i->waitPageLoad();
        $i->clickMenu('HR->Department');
        $i->waitPageLoad();
        $i->click('Add Department');

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

        // $i->click(['css'=>'table tbody tr:nth-child(2) td:nth-child(4) button']);
        // $i->click('Deactivate');
        // $i->waitForPageLoad();
        // $i->click(['css'=>'table tbody tr:nth-child(2) td:nth-child(4) button']);
        // $i->click('Activate');
        // $i->waitForPageLoad();
        // $i->see('Active',['css'=>'table tbody tr:nth-child(2) td:nth-child(4)']);

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

    // function testACL(SuperUser $i){
    //     $i->login('management@xavoc.com');
    //     $i->changeACL('CEO','xepan\hr/Department',['Active'=>['view'=>'Selft only','edit'=>'None']]);
    // }

    function testPost(SuperUser $i){
        $i->login('management@xavoc.com');
        $i->clickMenu('HR->Post');
        $i->see('CEO');
        $i->click(['css'=>'table tbody tr td:nth-child(4) a.emails-accesible']);
        // $i->acceptPopup();
        $i->see('Permitted Emails');
        $i->click(['css'=>' button.editable-cancel']);
        $i->wait(2);
        $i->click(['css'=>'table tbody tr td:nth-child(5) a.do-view-post-employees']);
        $i->see('Post Employees');
        $i->wait(2);
        $i->click(['css'=>' button.ui-dialog-titlebar-close']);
        // $i->click(['css'=>'table tbody tr td:nth-child(1) a.do-view-employee']);
        // $i->see('Employee Details');
        // $i->wait(2);
        // $i->click(['css'=>' button.ui-dialog-titlebar-close']);
        // $i->see('Post Employees');

    }
    function test_add_post(SuperUser $i){
        $i->login('management@xavoc.com');
        $i->clickMenu('HR->Post');
        // $i->waitPageLoad();
        $i->waitForText('Add Post');
        $i->click('Add Post');

        $i->fillAtkField('name','management');
        $i->click('Add');
        $i->waitForElement('.field-error-text');
        $i->see('Department_id must not be empty');
        $i->select2Option("department_id",['text'=>'Company']);
        $i->click('Add');
        $i->see('management');
        $i->clickActionForRow(2,'Deactivate');
        $i->dontSee('management');
        $i->click('InActive');
        $i->click(['css'=>'table tbody tr:nth-child(1) td:nth-child(6) button']);
        $i->cancelPopup();
        $i->waitForText('Active');
        $i->click(['css'=>'table tbody tr:nth-child(1) td:nth-child(6) a']);
        $i->click('Active');
        $i->waitForPageLoad();
        $i->see('No matching records found');
        $i->see('management');
        $i->wait(5);
    }
    function testEmployee(SuperUser $i){
        $i->login('management@xavoc.com');
        $i->clickMenu('HR->Employee');
        $i->see('Add Employee');
        $i->click(['css'=>'table tbody tr td:nth-child(1) a.do-view-employee']);
        $i->click('Official');
        $i->waitForText('Offer Date');
        $i->click('Activity');
        $i->wait(2);
        $i->click('Documents');
        $i->waitForText('No document found');
        $i->click(['css'=>' button.ui-dialog-titlebar-close']);
    }
    function test_add_employee(SuperUser $i){
        $i->login('management@xavoc.com');
        $i->clickMenu('HR->Employee');
        $i->see('Add Employee');
        $i->click('Add Employee');
        $i->waitPageLoad();
        $i->fillAtkField('first_name','vijay');
        $i->fillAtkField('last_name','mali');
        $i->fillAtkField('organization','Xavoc Technocrats Pvt. Ltd');
        $i->fillAtkField('address','18/436, Gaytri marg Kanji Ka Hata');
        $i->wait(10);
        // $i->selectOption('country', 'India');
        // $i->selectOption('state', ['Rajasthan']);
        $i->fillAtkField('city','Udaipur');
        $i->fillAtkField('pin_code','313001');
        $i->click('Save');
    }

    // function test_add_employee_details(SuperUser $i){
    //     $i->login('management@xavoc.com');
    //     $i->clickMenu('HR->Employee');
    //     $i->click(['css'=>'table tbody tr:nth-child(2) td:nth-child(5) a']);
    //     $i->waitPageLoad();
    //     $i->select2Option("department_id",['text'=>'Company']);
    //     // $i->select2Option("post_id",['text'=>'management']);
    //     $i->save();
    // }
    function test_add_employee_contact_email(SuperUser $i){
        $i->login('management@xavoc.com');
        $i->clickMenu('HR->Employee');
        $i->see('Add Employee');
        $i->click(['css'=>'table tbody tr:nth-child(2) td:nth-child(5) a.pb_edit']);
        $i->waitPageLoad();
        $i->waitForText('Employee Details');
        $i->click('Add Contact Email');
        $i->waitForText('Adding new Contact Email');
        $i->select2Option('head','');
        $i->click('Add');
        $i->waitForText('Head must not be empty');
        $i->select2Option('head',['text'=>'Official']);
        $i->fillAtkField('value','');
        $i->click('Add');
        $i->waitForText('Value must not be empty');
        $i->fillAtkField('value','vijay.mali552@gmail.com');
        // $i->click('is Active');
        // $i->click('is Valid');
        $i->click('Add');
        $i->waitForText('vijay.mali552@gmail.com');
    }

    function test_add_employee_contact_number(SuperUser $i){
        $i->login('management@xavoc.com');
        $i->clickMenu('HR->Employee');
        $i->see('Add Employee');
        $i->click(['css'=>'table tbody tr:nth-child(2) td:nth-child(5) a.pb_edit']);
        $i->waitPageLoad();
        $i->waitForText('Employee Details');
        $i->click('Add Contact Phone');
        $i->waitForText('Adding new Contact Phone');
        $i->select2Option('head','');
        $i->click('Add');
        $i->waitForText('Head must not be empty');
        $i->select2Option('head',['text'=>'Mobile']);
        $i->fillAtkField('value','9784954128');
        // $i->click('is Active');
        // $i->click('is Valid');
        $i->click('Add');
        $i->waitForText('9784954128');
    }

    function test_add_employee_contact_IM(SuperUser $i){
        $i->login('management@xavoc.com');
        $i->clickMenu('HR->Employee');
        $i->see('Add Employee');
        $i->click(['css'=>'table tbody tr:nth-child(2) td:nth-child(5) a.pb_edit']);
        $i->waitPageLoad();
        $i->waitForText('Employee Details');
        $i->click('Add Contact IM');
        $i->waitForText('Adding new Contact IM');
        $i->select2Option('head','');
        $i->click('Add');
        $i->waitForText('Head must not be empty');
        $i->select2Option('head',['text'=>'WhatsApp']);
        $i->fillAtkField('value','9784954128');
        // $i->click('is Active');
        // $i->click('is Valid');
        $i->click('Add');
        $i->waitForText('9784954128');
    }
    
    function testEmployeeMovement(SuperUser $i){
        $i->login('management@xavoc.com');
        $i->clickMenu('HR->Employee Movement');
        $i->waitForText('Employee Movement');
        
    }
    function testUser(SuperUser $i){
        $i->login('management@xavoc.com');
        $i->clickMenu('HR->User');
        // $i->waitPageLoad();
        $i->see('Add User');
        $i->click('Add User');
        $i->waitPageLoad();
        $i->fillAtkField('username','');
        $i->click('Add');
        $i->waitForText('Username must not be empty',2);
        $i->fillAtkField('username','1231');
        $i->click('Add');
        $i->waitForText('Username must be a valid email address',2);
        
        $i->fillAtkField('username','vijay.mali552@gmail.com');
        $i->fillAtkField('password','123');
        $i->select2Option('scope',['text'=>'SuperUser']);
        $i->wait(3);
        $i->click('Add');
    }

    function testAffiliate(SuperUser $i){
        $i->login('management@xavoc.com');
        $i->clickMenu('HR->Affiliate');
        // $i->waitPageLoad();
        $i->see('Add Affiliate');
    }

    function test_add_affiliate(SuperUser $i){
        $i->login('management@xavoc.com');
        $i->clickMenu('HR->Affiliate');
        $i->see('Add Affiliate');
        $i->click('Add Affiliate');
        $i->waitPageLoad();
        $i->fillAtkField('first_name','vijay');
        $i->fillAtkField('last_name','mali');
        $i->fillAtkField('organization','Xavoc Technocrats Pvt. Ltd');
        $i->fillAtkField('post','Developer');
        $i->fillAtkField('address','18/436, Gaytri marg Kanji Ka Hata');
        $i->fillAtkField('city','Udaipur');
        $i->fillAtkField('pin_code','313001');
        $i->click('Save');
    }

    function test_add_affiliate_detail(SuperUser $i){
        $i->login('management@xavoc.com');
        $i->clickMenu('HR->Affiliate');
        $i->see('Add Affiliate');
        $i->click(['css'=>'table tbody tr td:nth-child(4) a.pb_edit']);
        $i->waitPageLoad();
        $i->waitForText('Affiliate Details');
        $i->fillAtkField('narration','Test Case Affiliate');
        $i->click('Save');
    }
    
    function test_add_affiliate_contact_email(SuperUser $i){
        $i->login('management@xavoc.com');
        $i->clickMenu('HR->Affiliate');
        $i->see('Add Affiliate');
        $i->click(['css'=>'table tbody tr td:nth-child(4) a.pb_edit']);
        $i->waitPageLoad();
        $i->waitForText('Affiliate Details');
        $i->click('Add Contact Email');
        $i->waitForText('Adding new Contact Email');
        $i->select2Option('head','');
        $i->click('Add');
        $i->waitForText('Head must not be empty');
        $i->select2Option('head',['text'=>'Official']);
        $i->fillAtkField('value','');
        $i->click('Add');
        $i->waitForText('Value must not be empty');
        $i->fillAtkField('value','vijay.mali552@gmail.com');
        // $i->click('is Active');
        // $i->click('is Valid');
        $i->click('Add');
        $i->waitForText('vijay.mali552@gmail.com');
    }

    function test_add_affiliate_contact_number(SuperUser $i){
        $i->login('management@xavoc.com');
        $i->clickMenu('HR->Affiliate');
        $i->see('Add Affiliate');
        $i->click(['css'=>'table tbody tr td:nth-child(4) a.pb_edit']);
        $i->waitPageLoad();
        $i->waitForText('Affiliate Details');
        $i->click('Add Contact Phone');
        $i->waitForText('Adding new Contact Phone');
        $i->select2Option('head','');
        $i->click('Add');
        $i->waitForText('Head must not be empty');
        $i->select2Option('head',['text'=>'Mobile']);
        $i->fillAtkField('value','9784954128');
        // $i->click('is Active');
        // $i->click('is Valid');
        $i->click('Add');
        $i->waitForText('9784954128');
    }

    function test_add_affiliate_contact_IM(SuperUser $i){
        $i->login('management@xavoc.com');
        $i->clickMenu('HR->Affiliate');
        $i->see('Add Affiliate');
        $i->click(['css'=>'table tbody tr td:nth-child(4) a.pb_edit']);
        $i->waitPageLoad();
        $i->waitForText('Affiliate Details');
        $i->click('Add Contact IM');
        $i->waitForText('Adding new Contact IM');
        $i->select2Option('head','');
        $i->click('Add');
        $i->waitForText('Head must not be empty');
        $i->select2Option('head',['text'=>'WhatsApp']);
        $i->fillAtkField('value','9784954128');
        // $i->click('is Active');
        // $i->click('is Valid');
        $i->click('Add');
        $i->waitForText('9784954128');
    }


}
