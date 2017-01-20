<?php


class page_index extends Page {

	function init(){
		parent::init();

		$f = $this->add('Form');
		$f->addField('database')->setFieldHint('Pre created database');
		$f->addField('database_host');
		$f->addField('database_user');
		$f->addField('Password','database_password');

		$f->addField('admin_username')->setFieldHint('Must be an email id');
		$f->addField('admin_password');
		$f->addField('license_key')->setFieldHint('Leave blank for standard edition');

		if($f->isSubmitted()){
			// check if database connection is possible
			// or throw error, could not connect
			// check if folder websites/www exists 
			//  throw error if yes "already installed"

			// now create new Epan named 'www'
		}

	}

}