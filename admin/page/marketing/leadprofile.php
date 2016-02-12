<?php

class page_marketing_leadprofile extends Page{

	function init(){
		parent::init();

		$this->add('View_Marketing_activity',null,'activity');

	}

	function defaultTemplate(){

		return ['page/marketing/leadprofile'];
	}
}