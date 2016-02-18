<?php

class page_index extends Page {

    public $title='DashboardXX';

    function init() {
        parent::init();

        $this->add('View')->set($this->app->employee['first_name']);
    }

}
