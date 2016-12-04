<?php

class AD extends \atk4\data\Model {

	public function __construct($persistence = null, $defaults = [])
    {
        
        parent::__construct($persistence,$defaults);
        $this->app = $GLOBALS['api'];
        $this->persistence = $this->app->ad_db;
        $this->short_name = uniqid();
        $this->default_controller = null;
        $this->caption=null;
        $this->strict_field_check=false;
		$this->persistence->app->ad_db->add($this);
    }

    function init(){
        parent::init();
	}
}