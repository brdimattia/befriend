<?php
    $connect = mysqli_connect("localhost", "root", "Slartibartfast!00", "befrienddb");
    
    $username = $_POST["username"];


    function getFriends() {
    	global $connect, $username, $friendUserName;
    	$result = mysqli_query($connect, "SELECT `friends` FROM `userdata` WHERE `username` = '$username'") or die(mysqli_error($connect));
    	$resp = array();
	$index = 0;
        while($row = mysqli_fetch_assoc($result)){ 
             $resp[$index] = $row;
             $index++;
        }
	return $resp;
    }
        
    $response = array();
    $response["success"] = true; 
    $response["friends"] = getFriends();
    echo json_encode($response);  
   
    
?>