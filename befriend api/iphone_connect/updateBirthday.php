<?php
    $connect = mysqli_connect("localhost", "root", "Slartibartfast!00", "befrienddb");
    
    $displayName = $_POST["birthday"];
    $username = $_POST["username"];

    global $connect, $username, $birthday;
    $statement = mysqli_prepare($connect, "UPDATE userdata SET birthday = ? WHERE username = ?") or die(mysqli_error($connect));
    mysqli_stmt_bind_param($statement, "ss", $birthday, $username);
    mysqli_stmt_execute($statement);
        
    $response = array();
    $response["success"] = true; 
    echo json_encode($response);  
   
    
?>