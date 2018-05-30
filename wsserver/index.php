<?php

require_once'./vendor/autoload.php';

include '../admin/config-default.php';

if(file_exists('../admin/config.php'))
	include '../admin/config.php';

	$clients=[];

	if(isset($config['ssl-websocket-notifications']) && $config['ssl-websocket-notifications']){
		$Context = \Hoa\Stream\Context::getInstance('EpanTLS');
		$Context->setOptions([
		    'ssl' => [
		        'local_cert' => './cert/wss.pem',
		    ]
		]);
		$ssl_config='EpanTLS';
		$server_config ='ssl-websocket-server';
	}else{
		$server_config ='websocket-server';
		$ssl_config=null;
	}

	$websocket = new Hoa\Websocket\Server(
	    new Hoa\Socket\Server($config[$server_config],30,-1,$ssl_config)
	);
	$websocket->on('open', function (Hoa\Event\Bucket $bucket) {
	    echo 'new connection', "\n";
	    return;
	});


	$websocket->on('message', function (Hoa\Event\Bucket $bucket) use(&$clients) {
	    $data = $bucket->getData();
	    $message = json_decode($data['message'],true);
	    $response="";
	    if(isset($message['cmd'])){
	    	switch ($message['cmd']) {
	    		case 'register':
	    			$clients[$message['uu_id']] = $bucket->getSource()->getConnection()->getCurrentNode();
	    			$response  = "Client ".$message['uu_id']." registred \n";
	    			$response  = "";
	    			break;
	    		
	    		case "notification":
	    		default:
	    			$response=[];
	    			foreach ($message['clients'] as $client) {
	    				if(isset($clients[$client])){
		    				$bucket->getSource()->send($message['message'],$clients[$client]);
		    				$response[]=$client; 
	    				}
	    			}

	    			$response = json_encode($response);
	    			break;
	    	}
	    }

	    $bucket->getSource()->send($response);
	    return;
	});
	$websocket->on('close', function (Hoa\Event\Bucket $bucket) {
	    echo 'connection closed', "\n";

	    return;
	});

	$websocket->run();