<?php

class page_index extends \xepan\base\Page {

    public $title='Dashboard';

    public $breadcrumb=[
						'Dashboard'=>'/',
						'Wizard' => 'xepan_base_wizard'
					];

    function init() {
        parent::init();
		
		$task_assigned_to_me = $this->add('xepan\hr\CRUD',['allow_add'=>null,'grid_class'=>'xepan\projects\View_TaskList'],'pending_task_view');		
		$task_assigned_to_me->add('xepan\base\Controller_Avatar',['name_field'=>'created_by','extra_classes'=>'profile-img center-block','options'=>['size'=>50,'display'=>'block','margin'=>'auto'],'float'=>null,'model'=>$this->model]);
		$task_assigned_to_me->grid->template->trySet('task_view_title','My Pending Task');

		if(!$task_assigned_to_me->isEditing())
			$task_assigned_to_me->grid->addPaginator(25);

		$task_assigned_to_me_model = $this->add('xepan\projects\Model_Formatted_Task');
	    $task_assigned_to_me_model
	    			->addCondition('status','Pending')
	    			->addCondition(
	    				$task_assigned_to_me_model->dsql()->orExpr()
	    					->where('assign_to_id',$this->app->employee->id)
	    					->where(
    								$task_assigned_to_me_model->dsql()->andExpr()
    									->where('created_by_id',$this->app->employee->id)
    									->where('assign_to_id',null)
	    							)
	    				);

	    $task_assigned_to_me->setModel($task_assigned_to_me_model)->setOrder('updated_at','desc');			
    }

    function defaultTemplate(){
    	return ['page\dashboard'];
    }
}
