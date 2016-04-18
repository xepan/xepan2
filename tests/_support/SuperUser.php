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
}
