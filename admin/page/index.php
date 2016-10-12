<?php

class page_index extends \xepan\base\Page {

    public $title='Dashboard';

    public $breadcrumb=[
						'Dashboard'=>'/',
						'Wizard' => 'xepan_base_wizard'
					];

    function init() {
        parent::init();

        $this->app->hook('epan_dashboard_page',[$this]);
    }

    // function defaultTemplate(){
    // 	return ['page\dashboard'];
    // }
}
