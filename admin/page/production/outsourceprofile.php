<?php

class page_production_outsourceprofile extends Page {

    public $title='outsourceprofile';

    function init() {
        parent::init();
		$this->add('View_Production_activity',null,'activity');
		$this->add('View_Production_opportunity',null,'opportunity');
    }
    function defaultTemplate(){
		return ['page/production/outsourceprofile'];

			}
}