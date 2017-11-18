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

$win=false;

if (strtoupper(substr(PHP_OS, 0, 3)) === 'WIN') $win = true;

// create symlink in root
if(!file_exists('../atk4')){
	if($win)
		symlink(realpath(getcwd().'/../vendor/xepan/atk4/public/atk4'), '../atk4');
	else
		symlink('../vendor/xepan/atk4/public/atk4', '../atk4');
}

// create symlink in admin
if(!file_exists('../admin/atk4')){
	if($win)
		symlink(realpath(getcwd().'/../vendor/xepan/atk4/public/atk4'), '../admin/atk4');
	else
		symlink('../vendor/xepan/atk4/public/atk4', '../admin/atk4');
}

if(!file_exists('../admin/vendor')){
	if($win)
		symlink(realpath(getcwd().'/../vendor'), '../admin/vendor');
	else
		symlink('../vendor', '../admin/vendor');
}

if(!file_exists('../admin/websites')){
	if($win)
		symlink(realpath(getcwd().'/../websites'), '../admin/websites');
	else
		symlink('../websites', '../admin/websites');
}

if(!file_exists('../admin/xepantemplates')){
	if($win)
		symlink(realpath(getcwd().'/../xepantemplates'), '../admin/xepantemplates');
	else
		symlink('../xepantemplates', '../admin/xepantemplates');
}

// create symlink in install (this)
if(!file_exists('atk4')){
	if($win)
		symlink(realpath(getcwd().'/../vendor/xepan/atk4/public/atk4'), 'atk4');
	else
		symlink('../vendor/xepan/atk4/public/atk4', 'atk4');
}

if(!file_exists('vendor')){
	if($win)
		symlink(realpath(getcwd().'/../vendor'), 'vendor');
	else
		symlink('../vendor', 'vendor');
}

if(!file_exists('websites')){
	if($win)
		symlink(realpath(getcwd().'/../websites'), 'websites');
	else
		symlink('../websites', 'websites');
}

if(!file_exists('xepantemplates')){
	if($win)
		symlink(realpath(getcwd().'/../xepantemplates'), 'xepantemplates');
	else
		symlink('../xepantemplates', 'xepantemplates');
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