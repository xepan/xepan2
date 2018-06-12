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
   

    public function install($admin_username='management@xavoc.com',$admin_password='admin',$install_as='erp',$database_host='localhost',$database_user='root',$database_password='',$database='xepan2'){
      $i=$this;
      
      $i->amOnPage('/install');
      $i->fillField('[data-shortname=database]',$database);
      $i->fillField('[data-shortname=database_host]',$database_host);
      $i->fillField('[data-shortname=database_user]',$database_user);
      $i->fillField('[data-shortname=database_password]',$database_password);
      $i->fillField('[data-shortname=admin_username]',$admin_username);
      $i->fillField('[data-shortname=admin_password]',$admin_password);
      $i->selectOption('[data-shortname=install_as]',$install_as);

      $i->click('form button[type=submit]');
      $i->waitAjaxLoad(5);
      $i->see('Installing, please wait ...');
      $i->wait(60);
      // $i->waitForPageLoad();
      $i->canSeeInCurrentUrl('/admin');
      // $i->waitForText('Importing database',60);
      // $i->waitForText('Writing config file done',60);
      // $i->waitForText('DONE',2);

    }

   
    public function login($username='management@xavoc.com',$password='admin'){
      $i=$this;
      
      if ($i->loadSessionSnapshot('login')) {
            $i->waitPageLoad();
            return;
      }

      $i->amOnPage('/admin');
      $i->waitPageLoad();
   		$i->fillField('[data-shortname=username]',$username);
   		$i->fillField('[data-shortname=password]',$password);
   		$i->click('Login');
   		$i->waitPageLoad();
   		$i->see('Dashboard');
      $i->saveSessionSnapshot('login');
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
        $i->clickMenu('HR->ACL');
        $i->waitForPageLoad();
        $i->see('Access Control Management');
        $i->selectOptionForSelect2("[data-shortname=post]",$post);
        $i->wait(10);
        $i->selectOptionForSelect2("[data-shortname=document_type]",$document);
        $i->wait(10);
        $i->click('Go');
        $i->waitForText('Allow Add');
        $i->wait(20);
    }

    function clickMenu($menu){
      $i = $this;
      $menu = explode('->', $menu);
      for ($j=0; $j < count($menu); $j++) { 
        $i->click(['link'=>$menu[$j]]);
        if(isset($menu[$j+1])){
          $i->waitForText($menu[$j+1]);
        }
      }
      $i->waitPageLoad();
    }

    function waitForAjaxError($error){
      $i = $this;
      $i->waitForElement('.field-error-text');
      $i->see($error);
    }

    function select2Option($selector,$value,$time_out=1){
      $this->selectOptionForSelect2("[data-shortname=$selector]",$value,$time_out);
    }

    function clickActionForRow($row,$actionName){
      $i = $this;
      $i->click(['css'=>'table tbody tr:nth-child('.$row.') td button.dropdown-toggle']);
      $i->waitForText($actionName);
      $i->click(['link'=>$actionName]);
      $i->waitPageLoad();
    }

    function closeDialog(){
      $i = $this;
      $i->executeJs('$.univ().closeDialog()');
    }

    function checkCheckBox($checkbox_name){
      $i= $this;
      $i->checkOption('form input[data-shortname='.$checkbox_name.']');
    }

    function unCheckCheckBox($checkbox_name){
      $i= $this;
      $i->uncheckOption('form input[data-shortname='.$checkbox_name.']');
    }

    function checkNiceCheckbox($selector){
      $i = $this;
      $i->executeJs("$('.checkbox-nice input[data-shortname=".$selector."]').attr('checked',true)");
    }
    function unCheckNiceCheckBox($selector){
      $i = $this;
      $i->executeJs("$('.checkbox-nice input[data-shortname=".$selector."]').attr('checked',false)");
    }

    function selectorClick($selector){
      $i = $this;
      $i->executeJs("$('".$selector."').click()");
    }
}
