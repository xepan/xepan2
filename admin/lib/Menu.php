<?php


class Menu extends View {

	function defaultTemplate(){
		return ['html','Main_Menu'];
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