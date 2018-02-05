<?php
$config['url_prefix']='?page=';
$config['url_postfix']='';

$config['locale']['date_js'] = 'dd/mm/yyyy';
// $config['locale']['date'] = 'd/m/Y';

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

$config['websocket-notifications'] =  false;

$config['websocket-server']='ws://127.0.0.1:8889';




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


$config['epan_api_base_path'] = "http://www.epan.in/api/v1";
$config['keep_alive_time'] = 120000;
