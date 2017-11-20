<?php

set_time_limit(0);

// remove root symlink
if(file_exists('../atk4')){
	unlink('../atk4');
}


// remove admin symlink
if(file_exists('../admin/atk4')){
	unlink('../admin/atk4');
}

if(file_exists('../admin/vendor')){
	unlink('../admin/vendor');
}

if(file_exists('../admin/websites')){
	unlink('../admin/websites');
}

if(file_exists('../admin/xepantemplates')){
	unlink('../admin/xepantemplates');
}

// remove install symlinks
if(file_exists('atk4')){
	unlink('atk4');
}

if(file_exists('vendor')){
	unlink('vendor');
}

if(file_exists('websites')){
	unlink('websites');
}

if(file_exists('xepantemplates')){
	unlink('xepantemplates');
}

// remove api folder for now
if(file_exists('../api')){
	rrmdir('../api');
}

// remove some other unused folders
$to_remove=['../tests','../shared/apps/xavoc','../shared/apps/xepan','../snippet'];
foreach ($to_remove as $fld) {
	if(file_exists($fld)){
		rrmdir($fld);
	}
}


// remove websites folder and creating empty one
if(file_exists('../websites')){
	rrmdir('../websites');
	mkdir('../websites');
	file_put_contents('../websites/404.html','404');
}

chdir('..');
echo 'In Dir <b>'. getcwd() .'</b><br/>';

// echo 'resetting to origin/master <br/>';
// $output= shell_exec('git reset --hard origin/master');
// echo "output:<br/> <pre>$output</pre>";

echo 'Pulling origin master <br/>';
$output= shell_exec('git pull origin master');
echo "output:<br/> <pre>$output</pre>";

$apps = ['accounts','base','blog','cms','commerce','communication','crm','hr','marketing','production','projects','epanservices'];

$root=getcwd();
foreach ($apps as $app) {
	chdir($root);
	chdir('vendor/xepan/'.$app);

	echo 'In Dir <b>'. getcwd() .'</b><br/>';
	echo 'Checking out <br/>';
	$output= shell_exec('git checkout origin master');
	echo "output:<br/> <pre>$output</pre>";

	echo 'resetting to origin/master <br/>';
	$output= shell_exec('git reset --hard origin/master');
	echo "output:<br/> <pre>$output</pre>";

	echo 'Pulling origin master <br/>';
	$output=shell_exec('git pull origin master');
	echo "output:<br/> <pre>$output</pre>";
}

chdir($root);

// remove epanservices
rrmdir('vendor/xepan/epanservices/lib/Controller/DomainAPI');
rrmdir('vendor/xepan/epanservices/lib/Tool');
rrmdir('vendor/xepan/epanservices/lib/View');
rrmdir('vendor/xepan/epanservices/page');
rrmdir('vendor/xepan/epanservices/templates');
unlink('vendor/xepan/epanservices/lib/Model/Agency.php');
unlink('vendor/xepan/epanservices/lib/Model/ChannelPartner.php');
unlink('vendor/xepan/epanservices/lib/Model/DomainDetails.php');
unlink('vendor/xepan/epanservices/lib/Model/Epan.php');
unlink('vendor/xepan/epanservices/lib/Model/MyTemplates.php');
unlink('vendor/xepan/epanservices/lib/Controller/DomainAPI.php');
// unlink('vendor/xepan/epanservices/lib/Initiator.php');
unlink('vendor/xepan/epanservices/composer.json');


// remove hostedserver specific config
if(file_exists('config.php')) unlink('config.php');


$version="";
if($_GET['v']){
	$version='-'.$_GET['v'];
}

// update version in file
if($version){
	file_put_contents('version', $version);
}

if(file_exists('xepan2'.$version.'.zip')) unlink('xepan2'.$version.'.zip');

$zip_cmd= "zip -r xepan2".$version.".zip . --exclude *.svn* --exclude *.git* --exclude *.DS_Store* --exclude *.zip*";
echo '<b>'.$zip_cmd.'</b><br/>';
$output = shell_exec($zip_cmd);
echo "output:<br/> <pre>$output</pre>";


function rrmdir($dir) {
   if (is_dir($dir)) {
     $objects = scandir($dir);
     foreach ($objects as $object) {
       if ($object != "." && $object != "..") {
         if (filetype($dir."/".$object) == "dir") rrmdir($dir."/".$object); else unlink($dir."/".$object);
       }
     }
     reset($objects);
     rmdir($dir);
   }
} 