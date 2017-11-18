<?php


class page_index extends Page {

	function init(){
		parent::init();
		$this->app->auth = $this->app->add('BasicAuth');    

		if(file_exists('websites/www')){
			header('Location: ../admin');
		}
	
		date_default_timezone_set('UTC');
        $this->app->today = date('Y-m-d');
        $this->app->now   = date('Y-m-d H:i:s');
        $this->app->current_website_name='www';

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
			$dsn = "mysql://".$f['database_user'].":".$f['database_password']."@".$f['database_host']."/".$f['database'];
			$this->app->setConfig('dsn',$dsn);
			try{
				// check if database connection is possible
				$this->app->dbConnect();
			}catch(\Exception $e){
				// or throw error, could not connect
				$f->displayError('database_host','Couldn\'t connect with database');
			}
			
			$this->app->db->dsql()->expr(file_get_contents(getcwd().'/../install.sql'))->execute();
			$this->app->db->dsql()->expr('SET FOREIGN_KEY_CHECKS = 0;')->execute();
			
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
								      'HR' => 'Yes','Communication' => 'Yes','Projects' =>  'Yes','Marketing' => 'Yes','Accounts' => 'Yes','Commerce' => 'Yes' ,
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
			
			$addons = ['xepan\\base','xepan\\communication','xepan\\hr','xepan\\projects','xepan\\marketing','xepan\\accounts','xepan\\commerce','xepan\\production','xepan\\crm','xepan\\cms','xepan\\blog','xepan\\epanservices'];
			$user = $this->add('xepan\base\Model_User')->tryLoadAny();
       		$this->app->auth->usePasswordEncryption('md5');
			$this->app->auth->addEncryptionHook($user);
			$this->app->auth->setModel($user,'username','password');	
			
			foreach ($addons as $addon) {
				$this->add($addon."\Initiator")->resetDB();
			}

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

			$this->app->db->dsql()->expr('SET FOREIGN_KEY_CHECKS = 1;')->execute();
			$new_epan = $this->add('xepan\epanservices\Model_Epan');
			$new_epan->load($this->app->epan->id);
			$db_model=$this->add('xepan/epanservices/Model_DbVersion',array('dir'=>'dbversion','namespace'=>'xepan\epanservices'));	

			$new_epan['extra_info'] = $json;
			$new_epan['epan_dbversion'] = (int)$db_model->max_count;
			$new_epan->save();
			
			$user1 = $this->add('xepan\base\Model_User')->tryLoadAny();
			$this->app->auth->addEncryptionHook($user1);
        	$user1->set('username',$f['admin_username'])
	            ->set('password',$f['admin_password'])
				->save();
					
			// check if folder websites/www exists
			$new_epan->createFolder($new_epan);
			chmod('./websites/'.$this->app->epan['name'], $this->api->getConfig('filestore/chmod', 0755));

			$config_file = "<?php \n\n\t\$config['dsn'] = '".$dsn."';\n\n";
			file_put_contents(realpath($this->app->pathfinder->base_location->base_path.'/websites/'.$this->app->epan['name']).'/config.php',$config_file);
			

			// $f->js(null,$f->js()->univ()->successMessage("Installed Successfully"))->univ()->redirect($this->api->url(null,array('step'=>2)))->execute();	
			$f->js()->univ()->redirect(
				$this->api->url(
					$this->app->pm->base_url.$this->app->pm->base_path."../admin")
					)->execute();
		}
	}
}