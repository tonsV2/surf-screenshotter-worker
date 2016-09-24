<?php

	$target_dir = "uploads/";
	$target_file = "";
	$MAX_SIZE = 500000 * 2;
	// This needs to match the value found in the client script
	$SECRET_KEY="1a7adef0-9d3c-4fae-b1ea-10c3957fa1fb";

	if($_POST["secret_key"] != $SECRET_KEY) {
		http_response_code(403);
		exit();
	}

// Confirm file isn't too big
	if(!$_POST["filename"]) {
		http_response_code(400);
		exit();
	} else {
		$target_file = $target_dir . $_POST["filename"];
	}

// Delete file if it already exists
	if(file_exists($target_file)) {
		unlink($target_file);
	}

// Move file from tmp/ to uploads/
	if(move_uploaded_file($_FILES["payload"]["tmp_name"], $target_file)) {
		http_response_code(200);
	} else {
		http_response_code(500);
	}

?>

