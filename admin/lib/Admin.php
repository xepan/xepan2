<?php

class Admin extends App_Frontend {

    public $layout_class='Layout_Cube';

    function init() {
        parent::init();

        // $this->dbConnect();

        $this->today = date('Y-m-d',strtotime($this->recall('current_date',date('Y-m-d'))));
        $this->now = date('Y-m-d H:i:s',strtotime($this->recall('current_date',date('Y-m-d H:i:s'))));

        $this->add($this->layout_class,null,'Layout');

        $m1 = $this->layout->add('View',null,'Main_Menu',['html','Main_Menu']);
        
        $m = $m1->add('View',null,'Menu',['html','Main_Menu']);
        $x=$m->add('View',null,'Menu',['html','Menu'])->set('HAHAH 1');
        $x->add('View',null,'SubMenu',['html','Item'])->set('Ooops 1');

        $m = $m1->add('View',null,'Menu',['html','Main_Menu']);
        $x=$m->add('View',null,'Menu',['html','Menu'])->set('HAHAH 2');
        $x->add('View',null,'SubMenu',['html','Item'])->set('Ooops 2');

        // $this->top_menu = $this->layout->add('Menu',null,'Main_Menu');
        // $m = $this->top_menu->addMenu('HAHAHAH 1');
        // $m->addItem("Menu 1", 'Index.html');

        // $m = $this->top_menu->addMenu('HAHAHAH 2');
        // $m->addItem("Menu 2", 'Index.html');

        $this->api->pathfinder
            ->addLocation(array(
                'addons' => array('addons', 'vendor','shared/addons2'),
            ))
            ->setBasePath($this->pathfinder->base_location->getPath() . '/..')
        ;
    }
}