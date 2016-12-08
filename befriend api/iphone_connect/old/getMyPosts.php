<?php
    $con = mysqli_connect("localhost", "root", "Slartibartfast!00", "bookserve_android_api");
    
    $username = $_POST["username"];

      $result = mysqli_query($con, "SELECT * FROM `books` WHERE `username` = '$username'");
    

 
    $response = array();

    $index = 0;
    while($row = mysqli_fetch_assoc($result)){ 
     $response[$index] = $row;
     $index++;
}    
    
    echo json_encode($response);
?>