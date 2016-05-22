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
                'addons' => array('vendor','shared/addons2','shared/addons'),
            ))
            ->setBasePath($this->pathfinder->base_location->getPath() . '/..');
        
        
        // Should come from any local DB store
        // $this->xepan_addons = $addons = ['xepan\\base','xepan\\hr','xepan\\communication','xepan\\projects','xepan\\marketing','xepan\\accounts','xepan\\commerce','xepan\\production','xepan\\crm','xepan\\cms'];
        $this->xepan_addons = $addons = ['xepan\\base'];

        $this->xepan_app_initiators = $app_initiators=[];

        foreach ($addons as $addon) {
            $this->xepan_app_initiators[$addon] = $app_initiators[$addon] = $this->add("$addon\Initiator")->setup_admin();    
        }

    }

    function defaultTemplate(){

        $url = "{$_SERVER['HTTP_HOST']}";
        $sub_domain = $this->extract_subdomains($url)?:'default';

        $current_website = $this->current_website_name = $sub_domain;
        $this->readConfig("websites/$this->current_website_name/config.php");

        $this->addLocation(array(
            'page'=>array("websites/$current_website/www"),
            'js'=>array("websites/$current_website/www/js"),
            'css'=>array("websites/$current_website/www","websites/$current_website/www/css"),
            'template'=>["websites/$current_website/www"],
            'addons'=> ['websites/'.$current_website.'/www']
        ))->setParent($this->pathfinder->base_location);
        
        return parent::defaultTemplate();
    }

    function extract_domain($domain)
    {
        if(preg_match("/(?P<domain>[a-z0-9][a-z0-9\-]{1,63}\.[a-z\.]{2,6})$/i", $domain, $matches))
        {
            return $matches['domain'];
        } else {
            return $domain;
        }
    }

    function extract_subdomains($domain)
    {
        $subdomains = $domain;
        $domain = $this->extract_domain($subdomains);
        $subdomains = rtrim(strstr($subdomains, $domain, true), '.');

        return $subdomains;
    }

}