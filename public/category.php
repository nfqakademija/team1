<?php

    class Category{
    /**
     * @var PDO
     */
    private $conn;
    private $table = 'category';

    public $id_category;
    public $name;
    public $picture;
    public $summary;
    public $service_id;
    public $service_name;
    public $service_description;
    public $service_price;

    public function __construct($db)
    {
        $this->conn = $db;
    }

    public function read(){
        $sql='SELECT 
            c.id_category , 
            c.name, 
            c.picture, 
            c.summary,
            s.id_service,
            s.name AS service_name,
            s.price,
            s.description,
            s.fk_category
           FROM '. $this->table .' c
           INNER JOIN service s ON c.id_category = s.fk_category
           ORDER BY c.name DESC';

        $stmt= $this->conn->prepare($sql);

        $stmt->execute();

        return $stmt;
    }

    }
?>