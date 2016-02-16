<?php

class page_hr_employee extends Page{
	function init(){
		parent::init();
			$this->add('View_Info')->set('employee_nj');

	}
	function defaultTemplate(){
		return ['page/hr/employee'];
	}
}