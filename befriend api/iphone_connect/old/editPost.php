<?php
    $con = mysqli_connect("localhost", "root", "Slartibartfast!00", "bookserve_android_api");

    $uID = $_POST["uID"];
    $username = $_POST["username"];
    $title = $_POST["title"];
    $author = $_POST["author"];
    $ISBN = $_POST["ISBN"];
    $price = $_POST["price"];
    $book_condition = $_POST["condition"];
    $professor = $_POST["professor"];
    $course = $_POST["course"];
    $courseID = $_POST["courseID"];
    $school = $_POST["school"];
    $sqlInsert = "(username, title, author, ISBN, price, book_condition, professor, course, courseID, school)";

   $result = mysqli_query($con, "DELETE FROM `books` WHERE `books`.`uID` = '$uID'");

   $statement = mysqli_prepare($con, "INSERT INTO books " . $sqlInsert . " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)") or die(mysqli_error($con));
    mysqli_stmt_bind_param($statement, "ssssssssss", $username, $title, $author, $ISBN, $price, $book_condition, $professor, $course, $courseID, $school);
    mysqli_stmt_execute($statement);
       

    
    $response = array();
    $response["success"] = true;  
    
    
    echo json_encode($response);
?>