<?php

class page_index extends Page {

    public $title='DashboardXX';

    function init() {
        parent::init();

    }

    function defaultTemplate(){
    	return ['page/index'];
    }

}
