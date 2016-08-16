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
    public function tryToTest(Visitor $i)
    {
        $i->amOnPage('/');
        $i->waitPageLoad();
        $i->canSee('My Epans');
    }
}
