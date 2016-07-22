<?php

class Form_Field_DateRangePicker extends Form_Field_Line {
    public $options=array();
    function init(){
        parent::init();
        $this->addCalendarIcon();

    }
    function addCalendarIcon() {
        $this->addButton('',array('options'=>array('text'=>false)))
            ->setHtml('')
            ->setIcon(' fa fa-calendar')
            ;
    }
    function getInput($attr=array()){
        $this->js(true)
        ->_load('moment.min')
        ->_load('daterangepicker1')
        ->_css('daterangepicker')
        ;

        $this->js(true,"$('#".$this->name."').daterangepicker({
                            'startDate': 'start',
                            'endDate': 'end',
                            'ranges': {
                               'Today': [moment(), moment()],
                               'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                               'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                               'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                               'This Month': [moment().startOf('month'), moment().endOf('month')],
                               'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                            }
                    });");

        return parent::getInput(array_merge(
                    array(
                        'value'=>date('Y-m-d H-i-s',strtotime($this->value)),
                         ),$attr
                    ));
    }
    function set($value){
        // value can be valid date format, as in config['locale']['date']
        if(!$value)return parent::set(null);
        if(is_int($value)){
            return parent::set(date('Y-m-d H-i-s',$value));
        }
        @list($d,$m,$y)=explode('/',$value);
        if($y)$value=join('/',array($m,$d,$y));
        elseif($m)$value=join('/',array($m,$d));
        $value=date('Y-m-d H-i-s',strtotime($value));
        return parent::set($value);
    }
    function get(){
        $value=parent::get();
        // date cannot be empty string
        if($value=='')return null;
        return $value;
    }
}
