<?php
    $con = mysqli_connect("localhost", "root", "Slartibartfast!00", "bookserve_android_api");
        
     $school = $_POST["school"];

    $result = mysqli_query($con, "SELECT * FROM `books` WHERE `school` = '$school'");
    

 
    $response = array();

    $index = 0;
    while($row = mysqli_fetch_assoc($result)){ 
     $response[$index] = $row;
     $index++;
}
    
    echo json_encode($response);
?>