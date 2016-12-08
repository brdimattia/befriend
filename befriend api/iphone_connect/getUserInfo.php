<?php
    $con = mysqli_connect("localhost", "root", "Slartibartfast!00", "befrienddb");

    $username = $_POST["username"];
    
    $statement = mysqli_prepare($con, "SELECT * FROM userdata WHERE username = ?") or die(mysqli_error($con));
    mysqli_stmt_bind_param($statement, "s", $username);
    mysqli_stmt_execute($statement);
    mysqli_stmt_store_result($statement);
    mysqli_stmt_bind_result($statement, $colUserID, $colUsername, $colPassword, $colDisplayName, $colBirthday, $colPhoneNum, $colEmail, $colTwitterID, $colPinterestID, $colSpotifyID, $colFriends);
    
    $response = array();
    $response["success"] = false;  
    
    while(mysqli_stmt_fetch($statement)){
        $response["success"] = true;
	$response["username"] = $colUsername;
	$response["displayName"] = $colDisplayName;
	$response["birthday"] = $colBirthday;
	$response["phoneNum"] = $colPhoneNum;
	$response["email"] = $colEmail;
	$response["twitterID"] = $colTwitterID;
	$response["pinterestID"] = $colPinterestID;
	$response["spotifyID"] =  $colSpotifyID;
    }
    echo json_encode($response);
?>