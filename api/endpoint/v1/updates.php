<?php


class endpoint_v1_updates extends Endpoint_REST {

	function get(){
		
		$updates = "This is a functional Beta, We are working on better UX, please submit your queries to <a href='http://epan.in/forum' target='_epanforum'>Forum</a>";
		echo $updates;
		exit;
	}
}