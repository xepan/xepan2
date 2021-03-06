<?php


class page_index extends Page {

	function init(){
		parent::init();
		$this->app->auth = $this->app->add('BasicAuth');    

		if(file_exists('websites/www')){
			header('Location: ../admin');
		}

		if(strtoupper(substr(PHP_OS, 0, 3)) === 'WIN' && !file_exists('../atk4')){
			$this->add('View')->addClass('alert alert-danger')
				->setHTML('Windows user must run windows.bat file in your xepan extracted copy ('.str_replace('\install','',getcwd()).') [Run this file As Administrator, (Right Click and click Run as Administrator)]');
		}
	
		date_default_timezone_set('UTC');
        $this->app->today = date('Y-m-d');
        $this->app->now   = date('Y-m-d H:i:s');
        $this->app->current_website_name='www';

        $this->create_trial_vp = $this->add('VirtualPage');
		$this->create_trial_vp->set([$this,'create_trial_vp']);

		$f = $this->add('Form');
		$f->setLayout('view/form/installer');
		$f->addField('database')->setFieldHint('Pre created database');
		$f->addField('database_host');
		$f->addField('database_user');
		$f->addField('Password','database_password');

		$f->addField('admin_username',null,'(must be Email)')->setFieldHint('Must be an email id');
		$f->addField('admin_password');
		$f->addField('xepan\base\DropDownNormal','install_as')->setEmptyText("Please Select")->setValueList(['web'=>'Website','ecomm'=>'E-Commerce','erp'=>'CRM/ERP'])->validate('required');
		$f->addField('license_key')->setFieldHint('Leave blank for standard edition');
		
		if($f->isSubmitted()){

			if(strtoupper(substr(PHP_OS, 0, 3)) === 'WIN' && !file_exists('../atk4')){
				$this->js()->univ()->alert('Please run windows.bat file first as given in top message')->execute();
			}

			$f->js()->univ()->frameURL('Installing, please wait ...',$this->app->url($this->create_trial_vp->getURL(),$f->get()))->execute();

			
		}
	}

	function create_trial_vp($page){

		$this->app->stickyGET('database');
		$this->app->stickyGET('database_host');
		$this->app->stickyGET('database_user');
		$this->app->stickyGET('database_password');
		$this->app->stickyGET('admin_username');
		$this->app->stickyGET('admin_password');
		$this->app->stickyGET('install_as');
		$this->app->stickyGET('license_key');

		$page->add('View_Console')->set(function($c){
			
			$f = $_GET;
			$c->out('Connecting database');

			$dsn = "mysql://".$f['database_user'].":".$f['database_password']."@".$f['database_host']."/".$f['database'];
			$this->app->setConfig('dsn',$dsn);
			try{
				// check if database connection is possible
				$this->app->dbConnect();
				$c->out(' - Connection done');
			}catch(\Exception $e){
				// or throw error, could not connect
				$c->err('Couldn\'t connect with database with provided settings');
				$c->err($e->getMessage());
				$c->err($dsn);
				return;
				// $f->displayError('database_host','Couldn\'t connect with database');
			}
			
			$c->out('Importing database');
			$this->app->db->dsql()->expr(file_get_contents(getcwd().'/../install.sql'))->execute();
			
			$this->app->db->dsql()->expr('SET FOREIGN_KEY_CHECKS = 0;')->execute();
			
			$c->out(' - Importing database done');
			
			$epan_category = $this->add('xepan\base\Model_Epan_Category')
	        ->set('name','default')
	        ->save();
	        $epan = $this->add('xepan\base\Model_Epan')
	                ->set('epan_category_id',$epan_category->id)
	                ->set('name','www')
	                ->save();
	        $this->app->epan = $epan;

	        $this->app->employee = $this->add('xepan\hr\Model_Employee');//->tryLoadBy('user_id',$this->app->auth->model->id);
	        
			$this->app->resetDB = true;
			
			$custom_field_array=[
				  'qsp_detail_id' =>'56689','item_id' =>'2482',
				  'specification' => [
								      'HR' => 'Yes','Communication' => 'Yes','Projects' =>  'Yes','Marketing' => 'Yes','Accounts' => 'Yes','Commerce' => 'Yes' ,'IndiaMart CRM Integration'=>'Yes',
								      'Production' => 'Yes','CRM' => 'Yes' ,'CMS' => 'Yes' ,'Blog' => 'Yes','employee' => 0,'email' => 0, 'threshold' => 0,'storage' => 0, 
								     ],
				  'valid_till' => date('Y-m-d',strtotime(date('Y-m-d').' +1 year'))];

			switch ($f['install_as']) {
				case 'web':
					$custom_field_array['specification']['Projects']='No';
					$custom_field_array['specification']['Marketing']='No';
					$custom_field_array['specification']['Accounts']='No';
					$custom_field_array['specification']['Commerce']='No';
					$custom_field_array['specification']['Production']='No';
					$custom_field_array['specification']['CRM']='No';
					break;
				case 'ecomm':
					$custom_field_array['specification']['Projects']='No';
					$custom_field_array['specification']['Marketing']='No';
					$custom_field_array['specification']['Production']='No';
					$custom_field_array['specification']['CRM']='No';
					break;
			}
			
			$json = json_encode($custom_field_array,true);

			$addons = $this->app->getConfig('xepan_available_addons',['xepan\\base','xepan\\communication','xepan\\hr','xepan\\projects','xepan\\marketing','xepan\\accounts','xepan\\commerce','xepan\\production','xepan\\crm','xepan\\cms','xepan\\blog','xepan\\listing']);
			$user = $this->add('xepan\base\Model_User')->tryLoadAny();
	   		$this->app->auth->usePasswordEncryption('md5');
			$this->app->auth->addEncryptionHook($user);
			$this->app->auth->setModel($user,'username','password');	
			
			$c->out('Resetting all applications');
			foreach ($addons as $addon) {
				$c->out($addon);
				$this->add($addon."\Initiator")->resetDB();
			}

			$c->out(' - Resetting all applications done');

			$c->out('Removing un-required applications');

			switch ($f['install_as']) {
				case 'web':
					$installed_app =$this->add('xepan\base\Model_Epan_InstalledApplication')
									->addCondition('application',['projects','marketing','accounts','commerce','production','crm'])
									->each(function($i){
										$i->delete();
									});
					file_put_contents('../admin/config.php', str_replace('$config[\'hidden_xepan_hr\']= false;','$config[\'hidden_xepan_hr\']= true;', file_get_contents('../admin/config.php')));
					$custom_field_array['specification']['Projects']='No';
					$custom_field_array['specification']['Marketing']='No';
					$custom_field_array['specification']['Accounts']='No';
					$custom_field_array['specification']['Commerce']='No';
					$custom_field_array['specification']['Production']='No';
					$custom_field_array['specification']['CRM']='No';
					break;
				case 'ecomm':

					$installed_app =$this->add('xepan\base\Model_Epan_InstalledApplication')
									->addCondition('application',['projects','marketing','production'])
									->each(function($i){
										$i->delete();
									});
					// file_put_contents('../admin/config.php', str_replace('$config[\'hidden_xepan_hr\']= false;','$config[\'hidden_xepan_hr\']= true;', file_get_contents('../admin/config.php')));

					$custom_field_array['specification']['Projects']='No';
					$custom_field_array['specification']['Marketing']='No';
					$custom_field_array['specification']['Production']='No';
					// $custom_field_array['specification']['CRM']='No';
					break;
			}
			$c->out(' - Removing un-required applications done');
			
			$c->out('Saving Epan entry');

			$this->app->db->dsql()->expr('SET FOREIGN_KEY_CHECKS = 1;')->execute();
			$new_epan = $this->add('xepan\base\Model_Epan');
			$new_epan->load($this->app->epan->id);
			$db_model=$this->add('xepan/base/Model_DbVersion',array('dir'=>'dbversion','namespace'=>'xepan\base'));	

			$new_epan['extra_info'] = $json;
			$new_epan['epan_dbversion'] = (int)$db_model->max_count;
			$new_epan->save();

			$c->out(' - Saving Epan entry done');

			$c->out('Creating default user');
			
			$user1 = $this->add('xepan\base\Model_User')->tryLoadAny();
			$this->app->auth->addEncryptionHook($user1);
	    	$user1->set('username',$f['admin_username'])
	            ->set('password',$f['admin_password'])
				->save();

			$c->out(' - Creating default user done');
					
			// check if folder websites/www exists
			$c->out('Creating folders');
			$new_epan->createFolder($new_epan);
			chmod('./websites/'.$this->app->epan['name'], $this->api->getConfig('filestore/chmod', 0755));
			$c->out('- Folders created');

			$c->out('Writing config file');
			$config_file = "<?php \n\n\t\$config['dsn'] = '".$dsn."';\n\n";
			file_put_contents(realpath($this->app->pathfinder->base_location->base_path.'/websites/'.$this->app->epan['name']).'/config.php',$config_file);
			$c->out(' - Writing config file done');

			// $f->js(null,$f->js()->univ()->successMessage("Installed Successfully"))->univ()->redirect($this->api->url(null,array('step'=>2)))->execute();	
			$c->jsEval($this->js()->univ()->redirect(
				$this->api->url(
					$this->app->pm->base_url.$this->app->pm->base_path."../admin")
					))
			;

		});

	}
}