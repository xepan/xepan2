<?php

class page_production_outsourceprofile extends Page {

    public $title='outsourceprofile';

    function init() {
        parent::init();
       // $this->add('View_Info')->set('hiiiiiiiiiiiiiiiiiiiiiiiiiiiiii');
    }
    function defaultTemplate(){
		return ['page/production/outsourceprofile'];

			}
}