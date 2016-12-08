<?php
    $con = mysqli_connect("localhost", "root", "Slartibartfast!00", "bookserve_android_api");
    
    $name = $_POST["name"];

function addSchool(){
    global $con, $name;
    $statement = mysqli_prepare($con, "INSERT INTO schools (name) VALUES (?)") or die(mysqli_error($con));
    mysqli_stmt_bind_param($statement, "s", $name);
    mysqli_stmt_execute($statement);
    
}

    function nameAvailable() {
        global $con, $name;
        $statement = mysqli_prepare($con, "SELECT * FROM schools WHERE name = ?") or die(mysqli_error($con)); 
        mysqli_stmt_bind_param($statement, "s", $name);
        mysqli_stmt_execute($statement);
        mysqli_stmt_store_result($statement);
        $count = mysqli_stmt_num_rows($statement);
        mysqli_stmt_close($statement); 
        if ($count < 1){
            return true; 
        }else {
            return false; 
        }
    }


    $response = array();
    $response["success"] = false;
    if(nameAvailable()){
      $response["success"] = true; 
      addSchool(); 
    }  

   
    
    echo json_encode($response);
?>