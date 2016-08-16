<?php
namespace website;

use \Codeception\Util\Locator;

class pagesCheckCest
{
    public function _before(\AcceptanceTester $I)
    {
    }

    public function _after(\AcceptanceTester $I)
    {
    }


    public function test_home_page_working(\AcceptanceTester $i)
    {
        $i->wantTo('Test if Home Page of epan.in is working fine');
        $i->amOnPage('/');
        $i->waitPageLoad();
        $i->seeInTitle('Epan services: ERP, CRM &amp; E-Comm with accountability features');

    }

}
