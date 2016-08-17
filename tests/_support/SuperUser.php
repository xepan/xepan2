<?php


/**
 * Inherited Methods
 * @method void wantToTest($text)
 * @method void wantTo($text)
 * @method void execute($callable)
 * @method void expectTo($prediction)
 * @method void expect($prediction)
 * @method void amGoingTo($argumentation)
 * @method void am($role)
 * @method void lookForwardTo($achieveValue)
 * @method void comment($description)
 * @method \Codeception\Lib\Friend haveFriend($name, $actorClass = NULL)
 *
 * @SuppressWarnings(PHPMD)
*/
class SuperUser extends \Codeception\Actor
{
    use _generated\SuperUserActions;

   /**
    * Define custom actions here
    */
   

   
    public function login(){
      $i=$this;
   		$i->amOnPage('/admin');
      $i->waitPageLoad();
   		$i->fillField('[data-shortname=username]','admin@epan.in');
   		$i->fillField('[data-shortname=password]','admin');
   		$i->click('Login');
   		$i->waitPageLoad();
   		$i->see('Super');
    }

    public function tryLogin($user,$pass){
      $i=$this;
      $i->amOnPage('/admin');
      $i->fillField('[data-shortname=username]',$user);
      $i->fillField('[data-shortname=password]',$pass);
      $i->click('Login');
      $i->waitPageLoad();
    }

    public function searchFor($string){
      $i = $this;
      $i->fillField('[data-shortname=q]',$string);
      $i->pressKey('[data-shortname=q]',\Facebook\WebDriver\WebDriverKeys::ENTER);
      $i->waitPageLoad();
      if($string)
        $i->seeElementInDOM('span.icon-cancel');
    }

    public function waitForPageLoad(){
      $i=$this;
      $i->WaitPageLoad();
    }

    public function fillAtkField($field,$value){
      $i = $this;
      $i->fillField('[data-shortname='.$field.']',$value);
    }

    public function changeACL($post, $document,$acl_array,$allow_add=true)
    {
        $i = $this;
        $i->click('HR');
        $i->click('ACL');
        $i->waitForPageLoad();
        $i->selectOptionForSelect2("[data-shortname=post]",$post);
        $i->wait(2);
        $i->selectOptionForSelect2("[data-shortname=document_type]",$document);
        $i->wait(2);
        $i->click('Go');
        $i->waitForText('Allow Add');
        $i->wait(10);
    }
}
