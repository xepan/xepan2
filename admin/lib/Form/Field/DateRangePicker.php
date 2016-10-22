<?php

/**

How to use
    
    add Field 
    $fld = $f->addField('DateRangePicker','DateRangePicker')->set($_GET['range']?:'01-01-2016 - 31-12-2016');
    NOTE: dd-mm-yyyy format to set date with ' - ' as separator. SPACE DASH SPACE

    To read

    if(Form->isSubmitted()){
        $f['DateRangePicker'] returns as string as given
        or use
        $fld->getStartDate() in 'yyyy-mm-dd'
        $fld->getEndDate() in 'yyyy-mm-dd'
        in form submit
    }
    
*/

class Form_Field_DateRangePicker extends Form_Field_Line {
    public $options=array();
    
    public $start_date=null;
    public $end_date =null;

    function init(){
        parent::init();
        // if(!$this->start_date) $this->start_date = $this->app->today;
        // if(!$this->end_date) $this->end_date = $this->app->today;
        
        // $this->addCalendarIcon();

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
                            locale: {
                                  format: 'DD-MM-YYYY'
                            },
                            'startDate': '".$this->start_date."',
                            'endDate': '".$this->end_date."',
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
                        'value'=>$this->value,
                         ),$attr
                    ));
    }

    // function setStartDate($date){
    //     $this->js(true)->daterangepicker('setStartDate',$date);
    // }

    // function setEndDate($date){
    //     $this->js(true)->daterangepicker('setEndDate',$date);
    // }

    function set($value){
        // value can be valid date format, as in config['locale']['date']
        if(!$value)return parent::set(null);
        // if(is_int($value)){
        //     return parent::set(date('Y-m-d H-i-s',$value));
        // }
        // @list($d,$m,$y)=explode('/',$value);
        // if($y)$value=join('/',array($m,$d,$y));
        // elseif($m)$value=join('/',array($m,$d));
        // $value=date('Y-m-d H-i-s',strtotime($value));
        $dates = explode(" - ", $value);
        $this->start_date = date('d-m-Y',strtotime($dates[0]));
        $this->end_date = date('d-m-Y',strtotime($dates[1]));
        // var_dump($this->start_date, $this->end_date);
        // throw new \Exception('set Called' .$value, 1);
        return parent::set($value);
    }

    function getStartDate(){
        $dates = explode(" - ", $this->value);
        return date('Y-m-d',strtotime($dates[0]));
    }

    function getEndDate(){
        $dates = explode(" - ", $this->value);
        return date('Y-m-d',strtotime($dates[1]));   
    }

    function get(){        
        $value=parent::get();
        // date cannot be empty string
        if($value=='')return null;
        return $value;
    }
}
