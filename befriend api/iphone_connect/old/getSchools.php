<?php
    $con = mysqli_connect("localhost", "root", "Slartibartfast!00", "bookserve_android_api");
    
    $result = mysqli_query($con, "SELECT name FROM schools");
    

 
    $response = array();

    $index = 0;
    while($row = mysqli_fetch_assoc($result)){ 
     $response[$index] = $row;
     $index++;
}
    
    echo json_encode($response);
?>