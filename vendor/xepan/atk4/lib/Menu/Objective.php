<?php
class Menu_Objective extends View {
    public $current_menu_class='atk-state-current';

    function init(){
        parent::init();
        $this->setElement('ul');
    }


    function isCurrent($href){
        // returns true if item being added is current
        if(!is_object($href))$href=str_replace('/','_',$href);
        return $href == $this->app->page
            || $href == ';' . $this->app->page
            || $href . $this->app->getConfig('url_postfix','') == $this->app->page
            || (string)$href == (string)$this->app->url();
    }

    function addMenuItem($page,$label=null){
        if(!$label){
            $label=ucwords(str_replace('_',' ',$page));
        }

        $li=$this->add('View')->setElement('li');
        $a=$li->add('View')->setElement('a')->set($label);

        if($page instanceof jQuery_Chain){
            $li->js('click',$page);
            return $li;
        }

        $a->setAttr('href',$this->app->url($page));

        if($this->isCurrent($page) && $this->current_menu_class){
            $li->addClass($this->current_menu_class);
        }

        return $li;
    }

    function addSubMenu($name){
        $li=$this->add('View')
            ->setElement('li');
        $li->add('Text')->set($name);
        return $li
            ->add(get_class($this));
    }
}
