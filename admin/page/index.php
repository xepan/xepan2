<?php

class page_index extends \xepan\base\Page {
    public $title ="Graphical Report";

    public $widget_list = [];
    public $entity_list = [];

    public $filter_form;
    
    // public $title='Dashboard';

    public $breadcrumb=[
                        'Dashboard'=>'/',
                        'Wizard' => 'xepan_base_wizard'
                    ];

    function init() {
        parent::init();
        
        $this->js(true)->_load('masonry.pkgd.min')->masonry(['itemSelector'=>'.widget'])->_selector('.widget-grid');
        $this->app->hook('widget_collection',[&$this->widget_list]);
        $this->app->hook('entity_collection',[&$this->entity_list]);

        $post = $this->add('xepan\hr\Model_Post');
        $post->load($this->app->employee['post_id']);
           
        
        
        $report_id = $this->api->stickyGET('report_id');

        foreach ($_GET as $get=>$value) {
            if($value)
                $this->$get = $value;
        }
        
        $this->filter_form = $this->add('Form',null,'filter_form');

        $rpt = $this->add('xepan\base\Model_GraphicalReport')->tryLoadBy('name',$post['permission_level']?:'Individual'); 
        if(!$rpt->loaded()){
            $this->add('View')->set('Sorry! No Dashboard Found');            
            return;
        }

        $this->title = $rpt['name'];

        foreach ($rpt->ref('xepan\base\GraphicalReport_Widget') as $widget) {
            $w = $this->add('xepan\base\Widget_Wrapper');
            $w->addClass('widget');
            $w->addClass('col-md-'.$widget['col_width']);
            $widget = $w->add($widget['class_path'],['report'=>$this]);
            $widget->setFilterForm($this->filter_form);
        }

        $this->filter_form->addSubmit('Filter');

        if($this->filter_form->isSubmitted()){
            $form_result = $this->filter_form->get();
            if($this->filter_form->hasElement('date_range')){
                $form_result['start_date'] = $this->filter_form->getElement('date_range')->getStartDate();
                $form_result['end_date'] = $this->filter_form->getElement('date_range')->getEndDate();
            }
            $this->js()->reload($form_result)->execute();
        }
    }

    function enableFilterEntity($filter_entity){
        if(!in_array($filter_entity ,array_keys($this->entity_list)))
            throw $this->exception('Required entity is not exported by any application')
                        ->addMoreInfo('required_entity',$filter_entity)
                        ;

        if($this->filter_form->hasElement($filter_entity)) return;

        $fld = $this->filter_form->addField($this->entity_list[$filter_entity]['type'],$filter_entity,$this->entity_list[$filter_entity]['caption']?:null);
        
        if($this->entity_list[$filter_entity]['model']){
            $fld->setModel($this->entity_list[$filter_entity]['model']);
            if($fld->hasMethod('setEmptyText'))
                $fld->setEmptyText('Please select');
        }
        
        if(isset($this->$filter_entity))
            $fld->set($this->$filter_entity);

        if($fld instanceof \Form_Field_DateRangePicker){
            $fld->getFutureDatesSet();
            if(!isset($this->start_date)) $this->start_date = $this->app->today;
            if(!isset($this->end_date)) $this->end_date = $this->app->today;
        }

        return $fld;

    }

    function defaultTemplate(){
        return ['widget/runner'];
    }

    function render(){      
        $this->app->js('chart_rendered','console.log(123)');//->masonry(['itemSelector'=>'.widget'])->_selector('.widget-grid');
        return parent::render();
    }
}
