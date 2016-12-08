<?php
    $con = mysqli_connect("localhost", "root", "Slartibartfast!00", "bookserve_android_api");
    
    $uID = $_POST["uID"];
 
    

    $result = mysqli_query($con, "SELECT * FROM `books` WHERE `uID` = '$uID'");

    
$response = array();

    $index = 0;
    while($row = mysqli_fetch_assoc($result)){ 
     $response[$index] = $row;
     $index++;
}    

	
    
    echo json_encode($response);
?>