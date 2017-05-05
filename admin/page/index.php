<?php

class page_index extends \xepan\base\Page {
    public $title ="Graphical Report";

    public $widget_list = [];
    public $entity_list = [];
    public $filter_form;
    public $breadcrumb=['Dashboard'=>'/','Wizard' => 'xepan_base_wizard' ];

    function init() {
        parent::init();
        
        try{
            $post = $this->add('xepan\hr\Model_Post');
            $post->load($this->app->employee['post_id']);
            
            $rpt = $this->add('xepan\base\Model_GraphicalReport');
            if($rpt_id = $this->app->employee['graphical_report_id']){                        
                $rpt->tryLoadBy('id',$rpt_id); 
            }else{
                $rpt->tryLoadBy('name',$post['permission_level']?:'Individual'); 
            }
            
            $runner_view = $this->add('xepan\hr\View_GraphicalReport_Runner',['report_id'=>$rpt->id]); 
        }
        catch(\Exception $e){
            
        }
    }
}
