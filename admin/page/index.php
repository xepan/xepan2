<?php

class page_index extends Page {

    public $title='DashboardXX';

    function init() {
        parent::init();

        $this->add('View')->set($this->app->employee['first_name']);

        $this->app->layout->template->trySet('department',$this->app->employee['department']);
        $this->app->layout->template->trySet('post',$this->app->employee['post']);
        $this->app->layout->template->trySet('first_name',$this->app->employee['first_name']);
        $this->app->layout->template->trySet('status',$this->app->employee['status']);
        
        $this->app->layout->add('xepan\base\View_Notification',null,'notification_view');
        $this->app->layout->add('xepan\base\View_Message',null,'message_view');
    }

}
