<?php
    $connect = mysqli_connect("localhost", "root", "Slartibartfast!00", "befrienddb");
    
    $pinterestHandle = $_POST["pinterestHandle"];
    $username = $_POST["username"];

    global $connect, $username, $displayName;
    $statement = mysqli_prepare($connect, "UPDATE userdata SET pinterestID = ? WHERE username = ?") or die(mysqli_error($connect));
    mysqli_stmt_bind_param($statement, "ss", $pinterestHandle, $username);
    mysqli_stmt_execute($statement);
        
    $response = array();
    $response["success"] = true; 
    echo json_encode($response);  
   
    
?>