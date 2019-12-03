<?php

namespace App\Repository;

use Doctrine\ORM\EntityRepository;

class VehicleRepository extends EntityRepository
{
    public function findModelByMakeId(int $make_id)
    {
        return $this->findBy(['fkVehicleMake' => $make_id]);
    }
}