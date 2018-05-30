<?php
$config['url_prefix']='?page=';
$config['url_postfix']='';

$config['xepan-mysql-host']='127.0.0.1';

$config['locale']['date_js'] = 'dd/mm/yyyy';
// $config['locale']['date'] = 'd/m/Y';
$config['locale']['datetime'] = 'd M Y [H:i:s]';
$config['locale']['date'] = 'd M Y';

$config['tmail']['transport'] = 'Echo';
// $config['js']['versions']['jqueryui']='1.11.master';
// $config['js']['versions']['jquery']='';

$config['developer_mode'] = true;
$config['all_rights_to_superuser'] = true;
$config['status_icon'] = [];

$config['form']['layout']['inputonly']=false; // true will hide all hints etc

$config['filestore']['chmod'] = 0755;

$config['accounts']['round'] = 2;

$config['profiler'] = false; // true for all falase for none or string of current_epan name for specific

// browers runs websocket if set true
$config['websocket-notifications'] =  false;
// Websocket server selects wss to run if set true
$config['ssl-websocket-notifications'] =  true;

// for Websocket server
$config['websocket-server']='ws://127.0.0.1:8889';
$config['ssl-websocket-server']='wss://127.0.0.1:8890';

if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] != 'off') { //HTTPS 
	// for web browser target variable
	$config['websocket-server']='wss://127.0.0.1:8890';
} 

$config['keep_alive_time'] = false;// 120000 for 2 minutes;



// to be overridden by config.php

$config['hidden_report_menu'] = false;
$config['hidden_user_menu'] = false;


$config['hidden_xepan_communication']= false;
$config['hidden_my_menu']= true;
$config['only_my_menu']= true;

$config['required_hr_only']= false;
$config['hidden_xepan_hr']= false;
$config['only_xepan_hr']= false;

$config['hidden_xepan_projects']= false;
$config['only_xepan_projects']= false;

$config['hidden_xepan_marketing']= false;
$config['only_xepan_marketing']= false;

$config['hidden_xepan_accounts']= false;
$config['only_xepan_accounts']= false;

$config['hidden_xepan_commerce']= false;
$config['only_xepan_commerce']= false;

$config['hidden_xepan_production']= false;
$config['only_xepan_production']= false;

$config['hidden_xepan_crm']= false;
$config['only_xepan_crm']= false;

$config['hidden_xepan_cms']= false;
$config['only_xepan_cms']= false;


$config['epan_base_path'] = "http://www.xavoc.com";
$config['epan_api_base_path'] = "http://www.epan.in/api/v1";
$config['paymentgateways'] = ['Instamojo','CCAvenue'];