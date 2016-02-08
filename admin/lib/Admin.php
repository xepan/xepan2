<?php

class Admin extends App_Frontend {

    public $layout_class='Layout_Cube';

    function init() {
        parent::init();

        $this->api->pathfinder
            ->addLocation(array(
                'addons' => array('addons', 'vendor','shared/addons2'),
            ))
            ->setBasePath($this->pathfinder->base_location->getPath() . '/..');
            
        // Must be checked by SANDBOX from some local db
        $addons = ['xepan\\base','xepan\\hr','xepan\\marketing','xepan\\commerce'];

        foreach ($addons as $addon) {
            $this->add("$addon\Initiator");
        }

        $this->dbConnect();
        $this->add('jUI');
        


        $this->today = date('Y-m-d',strtotime($this->recall('current_date',date('Y-m-d'))));
        $this->now = date('Y-m-d H:i:s',strtotime($this->recall('current_date',date('Y-m-d H:i:s'))));

        $this->add($this->layout_class,null,'Layout');

        /**
            What sandbox could do here I guess as a PlugAndPlay Supporter
            - Check for well installed
                - Run Installer if not
            - Check License for xEpan
                -  ...
            - Check permission for required Component's page
                - Prompt to purchase/upgrate etc
            - Initiate some global event holder
                (
                    This is important as if this is in sandbox, you cannot remove sandbox, otherwise
                    Your Components won't listen global events and xEpan collapse
                )
            - Load Hooks for all Installed Applications From Cache
                - Update Cache if not updated for future calls
         */
        
        $auth = $this->add('BasicAuth');
        $auth->setModel('xepan\base\User_Active','username','password');

        $auth->check();

    }
}