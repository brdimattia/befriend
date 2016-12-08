<?php
    $connect = mysqli_connect("localhost", "root", "Slartibartfast!00", "befrienddb");
    
    $friendUserName = $_POST["friendUserName"];
    $username = $_POST["username"];

    function getFriends() {
    	global $connect, $username;
    	$statement = mysqli_query($connect, "SELECT friends FROM userdata WHERE username = '$username'") or die(mysqli_error($connect));
        $row = mysqli_fetch_row($statement);
        return $row[0];
    }

    function userExists() {
	global $connect, $friendUserName;
        $statement = mysqli_prepare($connect, "SELECT * FROM userdata WHERE username = ?") or die(mysqli_error($connect)); 
        mysqli_stmt_bind_param($statement, "s", $friendUserName);
        mysqli_stmt_execute($statement);
        mysqli_stmt_store_result($statement);
        $count = mysqli_stmt_num_rows($statement);
        mysqli_stmt_close($statement); 
        if ($count < 1){
            return 'user does not exist'; 
        }else {
            return true; 
        }
    }

    function alreadyFriends() {
	global $friendUserName;
    	$friendsString = getFriends();
	$friendsArray = explode(",", $friendsString);
	if(in_array($friendUserName, $friendsArray)) {
	    return 'already friends'; 
	}
	else {
	    return false;
	}
	
    }

    function addFriend() {
        global $connect, $username, $friendUserName;
	
	if(userExists() == 'true') {
	    if(!alreadyFriends()){
              	$oldFriends = getFriends();
	    	if($oldFriends != "") {
	    	    $newFriends = $oldFriends . ',' . $friendUserName;
	        } else {
		    $newFriends = $friendUserName;
	        }
            	$statement = mysqli_prepare($connect, "UPDATE userdata SET friends = ? WHERE username = ?") or die(mysqli_error($connect));
            	mysqli_stmt_bind_param($statement, "ss", $newFriends, $username);
           	mysqli_stmt_execute($statement);
            	return true;
            }
	    else {
            	return alreadyFriends();
	    }
	} 
	else {
	    return userExists();
    	}
    }

        
    $response = array();
    $response["success"] = addFriend(); 
    echo json_encode($response);  
   
    
?>