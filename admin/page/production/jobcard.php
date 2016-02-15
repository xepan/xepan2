<?php

class page_production_jobcard extends Page {

    public $title='jobcard';

    function init() {
        parent::init();
        //$this->add('View_Info')->set('hiiiiiiiiiiiiiiiiiiiiiiiiiiiiii');

    }
    function defaultTemplate(){
		return ['page/production/jobcard'];

	}
}