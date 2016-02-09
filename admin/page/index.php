<?php

class page_index extends Page {

    public $title='DashboardXX';

    function init() {
        parent::init();

        $this->add('View')->set($this->api->auth->model->ref('Emails')->tryLoadAny()->ref('contact_id')->get('first_name'));

    }

}
