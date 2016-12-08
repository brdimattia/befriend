<?php
    $connect = mysqli_connect("localhost", "root", "Slartibartfast!00", "befrienddb");
    
    $phoneNum = $_POST["phoneNum"];
    $username = $_POST["username"];

    global $connect, $username, $displayName;
    $statement = mysqli_prepare($connect, "UPDATE userdata SET phoneNum = ? WHERE username = ?") or die(mysqli_error($connect));
    mysqli_stmt_bind_param($statement, "ss", $phoneNum, $username);
    mysqli_stmt_execute($statement);
        
    $response = array();
    $response["success"] = true; 
    echo json_encode($response);  
   
    
?>