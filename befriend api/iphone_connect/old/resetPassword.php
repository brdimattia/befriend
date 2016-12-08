<?php
require_once 'swiftmailer/lib/swift_required.php';
    $connect = mysqli_connect("localhost", "root", "Slartibartfast!00", "bookserve_android_api");
    
    $email = $_POST["email"];
    
    function userExist() {
        global $connect, $email;
        $statement = mysqli_prepare($connect, "SELECT * FROM users WHERE username = ?") or die(mysqli_error($connect)); 
        mysqli_stmt_bind_param($statement, "s", $email);
        mysqli_stmt_execute($statement);
        mysqli_stmt_store_result($statement);
        $count = mysqli_stmt_num_rows($statement);
        mysqli_stmt_close($statement); 
        if ($count < 1){
            return false; 
        }else {
            return true; 
        }
    }

        $response = array();
    $response["success"] = false;  
    if (userExist()){
        $response["success"] = true;  
    }

    echo json_encode($response);
?>