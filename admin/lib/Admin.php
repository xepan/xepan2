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
        
        $epan_domain_array = $this->recall('epan_domain_array',[]);

        $url = "{$_SERVER['HTTP_HOST']}";
        $domain = str_replace('www.','',$this->extract_domain($url))?:'www';
        $sub_domain = str_replace('www.','',$this->extract_subdomains($url))?:'www';

        $service_host = $this->getConfig('xepan-service-host',false);
        if($service_host && $service_host!==$domain){
            $epan = $domain;
        }else{
            $epan = $sub_domain;
        }

        if(!isset($epan_domain_array[$epan])){            
            $this->readConfig("websites/www/config.php");
            $this->dbConnect();
            $epan_hash = $this->db->dsql()->table('epan')->where($this->db->dsql()->orExpr()->where('name',$epan)->where('aliases','like','"%'.$epan.'%"'))->getHash();
            $epan_domain_array[$epan] = $epan_hash['name'];
            $this->memorize('epan_domain_array',$epan_domain_array);
        }
        // die(print_r($epan,true));
        // die($epan['name']);

        $current_website = $this->current_website_name = $epan;
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