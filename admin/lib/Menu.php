<?php


class Menu extends View {

	public $caption="Menu Caption";
	public $icon=null;

	function defaultTemplate(){
		return ['menu/menu'];
	}
	
	function addMenu($title){
		$m = $this->add('Menu');
        $m=$m->add('Menu',null,'Menu',['html','Menu']);
        $m->set($title);
        return $m;
	}

	function addItem($title,$url="#"){
		$i = $this->add('View',null,'SubMenu',['html','Item']);
		$i->set($title);
		$i->template->set('url',$url);
		return $this;
	}
}