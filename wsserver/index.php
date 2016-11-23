<?php

require_once'./vendor/autoload.php';

	$clients=[];

	$websocket = new Hoa\Websocket\Server(
	    new Hoa\Socket\Server('ws://127.0.0.1:8889')
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