<?php
    header('Access-Control-Allow-Origin: *');


    include_once '../../../config/database.php';
    include_once '../../category.php';

    $database = new Database();
    $db= $database->connect();

    $category = new Category($db);

    $result = $category->read();
    $num = $result->rowCount();

    if($num > 0){
        $category_arr = array();
        $category_arr['data'] = array();

        while ($row = $result -> fetch(PDO::FETCH_ASSOC)){

            $category_item = array(
                'id_category' => $row['id_category'],
                'name' => $row['name'],
                'picture' => $row['picture'],
                'summary' => $row['summary'],
                'id_service' => $row['id_service'],
                'service_name' => $row['service_name'],
                'price' => $row['price'],
                'description' => $row['description'],
            );
            array_push($category_arr['data'], $category_item);
        }
        echo json_encode($category_arr);
    }
        else{
            echo json_encode(
                array('message' => 'no categories')
            );
        }
?>