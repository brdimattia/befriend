<?php
    $con = mysqli_connect("localhost", "root", "Slartibartfast!00", "befrienddb");

    $username = $_POST["username"];
    $password = $_POST["password"];
    
    $statement = mysqli_prepare($con, "SELECT * FROM userdata WHERE username = ?") or die(mysqli_error($con));
    mysqli_stmt_bind_param($statement, "s", $username);
    mysqli_stmt_execute($statement);
    mysqli_stmt_store_result($statement);
    mysqli_stmt_bind_result($statement, $colUserID, $colUsername, $colPassword, $colDisplayName, $colBirthday, $colPhoneNum, $colEmail, $colTwitterID, $colPinterestID, $colSpotifyID, $colFriends);
    
    $response = array();
    $response["success"] = false;  
    
    while(mysqli_stmt_fetch($statement)){
        if (password_verify($password, $colPassword)) {
            $response["success"] = true;  
        }
    }
    echo json_encode($response);
?>