<?php


/*
in root 
	atk4 -> vendor/xepan/atk4/public/atk4
in admin/install/api
	atk4 -> vendor/xepan/atk4/public/atk4
	vendor -> ../vendor
	websites -> ../websites
	xepantemplates -> ../xepantemplates/

*/


if (strtoupper(substr(PHP_OS, 0, 3)) === 'WIN') {



}else{

	// create symlink in root
	if(!file_exists('../atk4')){
		symlink(realpath(getcwd().'/../vendor/xepan/atk4/public/atk4'), '../atk4');
	}

	// create symlink in admin
	if(!file_exists('../admin/atk4')){
		symlink(realpath(getcwd().'/../vendor/xepan/atk4/public/atk4'), '../admin/atk4');
	}

	if(!file_exists('../admin/vendor')){
		symlink(realpath(getcwd().'/../vendor'), '../admin/vendor');
	}

	if(!file_exists('../admin/websites')){
		symlink(realpath(getcwd().'/../websites'), '../admin/websites');
	}

	if(!file_exists('../admin/xepantemplates')){
		symlink(realpath(getcwd().'/../xepantemplates'), '../admin/xepantemplates');
	}

	// create symlink in install (this)
	if(!file_exists('atk4')){
		symlink(realpath(getcwd().'/../vendor/xepan/atk4/public/atk4'), 'atk4');
	}

	if(!file_exists('vendor')){
		symlink(realpath(getcwd().'/../vendor'), 'vendor');
	}

	if(!file_exists('websites')){
		symlink(realpath(getcwd().'/../websites'), 'websites');
	}

	if(!file_exists('xepantemplates')){
		symlink(realpath(getcwd().'/../xepantemplates'), 'xepantemplates');
	}
}

// actual installer

$profiler_time = microtime(true); 
require_once '../vendor/autoload.php';

if (file_exists('../agiletoolkit-sandbox.phar')) {
    require_once "../agiletoolkit-sandbox.phar";
}

require_once 'lib/Install.php';

$api = new Install('install');
$api->main();

if($api->getConfig('profiler',false)!==false) {
	if(is_bool($api->getConfig('profiler',false)) || $api->getConfig('profiler',false) === $api->current_website_name){
		$api->profiler->mark('finish');
		$api->profiler->dump();
	}
}