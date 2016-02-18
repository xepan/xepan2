<?php

class Admin extends App_Frontend {

    public $layout_class='Layout_Cube';

    function init() {
        parent::init();

        $this->dbConnect();
        $this->add('jUI');

        // Move to SandBOX Part Start
        $this->add($this->layout_class,null,'Layout');


        $this->api->pathfinder
            ->addLocation(array(
                'addons' => array('addons', 'vendor','shared/addons2'),
            ))
            ->setBasePath($this->pathfinder->base_location->getPath() . '/..');
        
        
        // Should come from any local DB store
        $addons = ['xepan\\base','xepan\\hr','xepan\\marketing','xepan\\commerce'];

        $app_initiators=[];
        foreach ($addons as $addon) {
            $app_initiators[$addon] = $this->add("$addon\Initiator");
            
            if($addon=='xepan\\base'){
                $this->top_menu = $this->layout->add('xepan\base\Menu_TopBar',null,'Main_Menu');
                $this->side_menu = $this->layout->add('xepan\base\Menu_SideBar',null,'Side_Menu');
            }
        }

        $app_initiators['xepan\\base']->installEvilVirus([/* while_page_list */]);

        // Move to SandBOX Part END

        $this->today = date('Y-m-d',strtotime($this->recall('current_date',date('Y-m-d'))));
        $this->now = date('Y-m-d H:i:s',strtotime($this->recall('current_date',date('Y-m-d H:i:s'))));

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

    }
}
