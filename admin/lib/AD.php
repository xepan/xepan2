<?php

class AD extends \atk4\data\Model {

    public $_default_class_addField = 'atk4\data\Field_SQL';

	public function __construct($persistence = null, $defaults = [])
    {
        
        parent::__construct($persistence,$defaults);
        $this->app = $GLOBALS['api'];
        $this->persistence = $this->app->ad_db;
    }

    function init(){
        parent::init();
        
	}
}