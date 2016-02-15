<?php

class page_production_jobcarddetail extends Page {

    public $title='jobcard detail';

    function init() {
        parent::init();
       // $this->add('View_Info')->set('hiiiiiiiiiiiiiiiiiiiiiiiiiiiiii');

    }
    function defaultTemplate(){
		return ['page/production/jobcarddetail'];

	}
}