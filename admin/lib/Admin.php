<?php

class Admin extends App_Frontend {

    public $layout_class='Layout_Cube';

    function init() {
        parent::init();

        // $this->dbConnect();

        $this->today = date('Y-m-d',strtotime($this->recall('current_date',date('Y-m-d'))));
        $this->now = date('Y-m-d H:i:s',strtotime($this->recall('current_date',date('Y-m-d H:i:s'))));

        $this->add($this->layout_class,null,'Layout');

        $m = $this->layout->add('View',null,'Main_Menu',['html','Main_Menu']);
        $x=$m->add('View',null,'Menu',['html','Menu'])->set('HAHAH 1');
        $x->add('View',null,'SubMenu',['html','Item'])->set('Ooops 1');

        $m = $this->layout->add('View',null,'Main_Menu',['html','Main_Menu']);
        $x=$m->add('View',null,'Menu',['html','Menu'])->set('HAHAH 2');
        $x->add('View',null,'SubMenu',['html','Item'])->set('Ooops 2');

        $this->api->pathfinder
            ->addLocation(array(
                'addons' => array('addons', 'vendor','shared/addons2'),
            ))
            ->setBasePath($this->pathfinder->base_location->getPath() . '/..')
        ;
    }
}