<?php
    require("password.php");
    $connect = mysqli_connect("localhost", "root", "Slartibartfast!00", "bookserve_android_api");
    
    $username = $_POST["username"];
    $pass = $_POST["password"];
    $passwordHash = password_hash($pass, PASSWORD_DEFAULT);
        
        $statement = mysqli_prepare($connect, "UPDATE users SET password= ? WHERE username = ?") or die(mysqli_error($con));
        mysqli_stmt_bind_param($statement, "ss", $passwordHash, $username);
        mysqli_stmt_execute($statement);
        mysqli_stmt_close($statement);     
   
       $response = array();
       $response["success"] = true;  
       echo json_encode($response);
?>