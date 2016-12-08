<?php
    $con = mysqli_connect("localhost", "root", "Slartibartfast!00", "bookserve_android_api");
    
    $id = $_POST["id"];
    

    $result = mysqli_query($con, "DELETE FROM `books` WHERE `books`.`uID` = '$id'");

   
$response = array();

   $response["success"] = true;
	
    
    echo json_encode($response);
?>