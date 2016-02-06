<?php

/**
* description: Active User Model
* 
* @author : Gowrav Vishwakarma
* @email : gowravvishwakarma@gmail.com, info@xavoc.com
* @website : http://xepan.org
* 
*/

class Model_User_Active extends Model_User{

	function init(){
		parent::init();
		
		$this->addCondition('is_active',true);		

	}
}