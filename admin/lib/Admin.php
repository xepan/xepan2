<?php

class Admin extends App_Frontend {

    public $layout_class='Layout_Cube';

    public $is_frontend= false;
    public $is_admin= true;
    public $xepan_addons = [];
    public $xepan_app_initiators=[];

    public $current_website_name='default';

    function init() {
        parent::init();

        $this->dbConnect();
        $this->add('jUI');

        // Move to SandBOX Part Start
        $this->add($this->layout_class,null,'Layout');


        $this->api->pathfinder
            ->addLocation(array(
                'addons' => array('shared/addons', 'vendor','shared/addons2'),
            ))
            ->setBasePath($this->pathfinder->base_location->getPath() . '/..');
        
        
        // Should come from any local DB store
        $this->xepan_addons = $addons = ['xepan\\base','xepan\\hr','xepan\\communication','xepan\\projects','xepan\\marketing','xepan\\accounts','xepan\\commerce','xepan\\production','xepan\\crm'];

        $this->xepan_app_initiators = $app_initiators=[];
        foreach ($addons as $addon) {
            $this->xepan_app_initiators[$addon] = $app_initiators[$addon] = $this->add("$addon\Initiator");
            
        }

        // $app_initiators['xepan\\base']->installEvilVirus([/* while_page_list */]);

        // Move to SandBOX Part END

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