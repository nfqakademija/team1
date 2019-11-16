<?php
    if(isset($_POST['submit'])) {
        if (strlen($_POST['make']) < 45 && strlen($_POST['model']) < 45) {

            $fileName = $_FILES['file']['name'];
            $fileTmpName = $_FILES['file']['tmp_name'];
            $fileError = $_FILES['file']['error'];
            $fileType = $_FILES['file']['type'];

            $fileExt = explode('.',$fileName);
            $theFileExt = strtolower(end($fileExt));

            $allow = array('txt', 'ecu');

            if(in_array($theFileExt, $allow)){
                if($fileError === 0) {
                    if (strlen($fileName) < 45){
                        $newFileName = hash('ripemd160', $fileName);
                        $location = 'uploadedFiles/' . $newFileName;
                        move_uploaded_file($fileTmpName, $location);
                        $db = mysqli_connect("127.0.0.1", "root", "", "AutoChip");
                        $sql = "INSERT INTO vehicle_ecu_file (filename, hash)
                                VALUES ('$fileName', '$newFileName' )";

                        if (mysqli_query($db, $sql)) {
                            header("Location: orderForm.html");
                        } else {
                            echo "ERROR: Could not able to execute $sql. " . mysqli_error($db);
                        }
                    }
                }
                else{
                    echo 'Something went wrong! (error occurred)';
                }
            }
            else{
                echo "Can't upload file with that type.";
            }

        } else {
            echo "Something went wrong!";
        }
    }
?>