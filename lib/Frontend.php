<?php
class Frontend extends ApiFrontend {
    public $api_public_path;
    public $api_base_path;
    public $currentBridge=null;
    public $isLive = false;
    public $requestDoc= false;
    public $responseDoc = false;

    public $is_frontend= true;
    public $is_admin= false;

    public $current_website_name=null;

    public $page_class='xepan\cms\page_cms';

    function init() {
        parent::init();        

        //DB Connect not default added by rakesh
        $this->dbConnect();
        
        // Might come handy when multi-timezone base networks integrates
        $this->today = date('Y-m-d',strtotime($this->recall('current_date',date('Y-m-d'))));
        $this->now = date('Y-m-d H:i:s',strtotime($this->recall('current_date',date('Y-m-d H:i:s'))));

        $this->api_public_path = dirname(@$_SERVER['SCRIPT_FILENAME']);
        $this->api_base_path = dirname(dirname(@$_SERVER['SCRIPT_FILENAME']));

        $this->add('jUI');
        

        $this->api->pathfinder
            ->addLocation(array(
                'addons' => array('shared/addons', 'vendor','shared/addons2'),
            ))
            ->setBasePath($this->pathfinder->base_location->getPath() );
        
        
        // Should come from any local DB store
        $addons = ['xepan\\base','xepan\\communication','xepan\\hr','xepan\\marketing','xepan\\commerce','xepan\\production','xepan\\accounts','xepan\\cms','xepan\\crm'];

        $app_initiators=[];
        foreach ($addons as $addon) {
            $app_initiators[$addon] = $this->add("$addon\Initiator")->setup_frontend();
        }


    }

    function defaultTemplate(){

        $current_website = $this->current_website_name = 'default';
        $this->addLocation(array(
            'page'=>array("websites/$current_website"),
            'js'=>array("websites/$current_website/js"),
            'css'=>array("websites/$current_website","websites/$current_website/css"),
            'template'=>["websites/$current_website"],
            'addons'=> ['websites/'.$this->current_website_name]
        ))->setParent($this->pathfinder->base_location);

        if($this->pathfinder->locate('template',$t='layout/'.$this->page.'.html','path',false)){
            return ['layout/'.$this->page];
        }elseif($this->pathfinder->locate('template','layout/default.html','path',false)){            
            return ['layout/default'];
        }elseif(!$this->layout){
            throw new \Exception("No Website content found or No Template in Website default", 1);
            
        }else{
            throw new \Exception("Error Processing Request", 1);
            
        }  
    }

    protected function loadStaticPage($page){
        

        $layout = $this->layout ?: $this;
        try{
            $t='page/'.str_replace('_','/',strtolower($page));
            $this->template->findTemplate($t);
            $this->page_object=$layout->add($page,$page,'Content',array($t));
        }catch(PathFinder_Exception $e2){
            try{
                $t='page/'.strtolower($page);
                $this->template->findTemplate($t);
                $this->page_object=$layout->add($page,$page,'Content',array($t));
            }catch(PathFinder_Exception $e3){
                $t=strtolower($page);
                $this->page_object=$layout->add($this->page_class,$page,'Content',[str_replace("_", "/",$page)]);
            }
        }

        return $this->page_object;
    }


}
