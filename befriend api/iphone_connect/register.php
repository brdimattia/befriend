<?php
    require("password.php");
    $connect = mysqli_connect("localhost", "root", "Slartibartfast!00", "befrienddb");
    
    $username = $_POST["username"];
    $pass = $_POST["password"];
    $displayName = $_POST["displayName"];
    $birthday = $_POST["birthday"];
    $phoneNum = $_POST["phoneNum"];
    $email = $_POST["email"];
    $twitterID = $_POST["twitterID"];
    $pinterestID = $_POST["pinterestID"];
    $spotifyID = $_POST["spotifyID"];
    $friends = $_POST["friends"];
    $passwordHash = password_hash($pass, PASSWORD_DEFAULT);
    function registerUser() {
        global $connect, $username, $pass, $displayName, $birthday, $phoneNum, $email, $twitterID, $pinterestID, $spotifyID, $friends, $passwordHash;
        $result = mysqli_query($connect, "INSERT INTO `userdata` (`username`, `passwordHash`, `displayName`, `birthday`, `phoneNum`, `email`, `twitterID`, `pinterestID`, `spotifyID`, `friends`) VALUES ('$username', '$passwordHash', '$displayName', '$birthday', '$phoneNum', '$email', '$twitterID', '$pinterestID', '$spotifyID', '$friends')") or die(mysqli_error($connect));
        
    }
    function usernameAvailable() {
        global $connect, $username;
        $statement = mysqli_prepare($connect, "SELECT * FROM userdata WHERE username = ?") or die(mysqli_error($connect)); 
        mysqli_stmt_bind_param($statement, "s", $username);
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
    if (usernameAvailable()){
        registerUser();
        $response["success"] = true;  
    }
    
    echo json_encode($response);
?>