<?php


class Menu extends View {
	function defaultTemplate(){
		return ['html','Menu'];
	}

	function addItem($title,$url="#"){
		$v = $this->add('View',null,'SubMenu',['html','Item']);
		if(is_array($title)){
			$v->set($title[0]);
			if(isset($title['icon'])) $v->template->set('icon',$title['icon']);
		}else{
			$v->set($title);
		}
	}
}