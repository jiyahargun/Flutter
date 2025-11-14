<?php

    include('connection.php');

    $name = $_POST['fname'];
    $surname = $_POST['lname'];

    if($name=="" && $surname=="")
    {
        echo '0';
    }
    else
    {
        $sql = "insert into jiya_user (fname,lname)values('$name','$surname')";
        mysqli_query($con,$sql);
    }

?>