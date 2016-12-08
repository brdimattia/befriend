<?php
    $con = mysqli_connect("localhost", "root", "Slartibartfast!00", "bookserve_android_api");
    
    $username = $_POST["username"];
    $school = $_POST["school"];

    $statement = mysqli_prepare($con, "UPDATE users SET school= ? WHERE username = ?") or die(mysqli_error($con));
    mysqli_stmt_bind_param($statement, "ss", $school, $username);
    mysqli_stmt_execute($statement);
 

    $response = array();
    $response["success"] = true; 

   
    
    echo json_encode($response);
?>