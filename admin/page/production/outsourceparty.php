<?php

class page_production_outsourceparty extends Page {

    public $title='Outsourceparty';

    function init() {
        parent::init();
       // $this->add('View_Info')->set('hiiiiiiiiiiiiiiiiiiiiiiiiiiiiii');
    }
    function defaultTemplate(){
		return ['page/production/outsourceparty'];

}
}