<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * VehicleMake
 *
 * @ORM\Table(name="vehicle_make", uniqueConstraints={@ORM\UniqueConstraint(name="id_vehicle_make_UNIQUE", columns={"id_vehicle_make"})})
 * @ORM\Entity
 */
class VehicleMake
{
    /**
     * @var int
     *
     * @ORM\Column(name="id_vehicle_make", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idVehicleMake;

    /**
     * @var string
     *
     * @ORM\Column(name="make", type="string", length=45, nullable=false)
     */
    private $make;

    public function getIdVehicleMake(): ?int
    {
        return $this->idVehicleMake;
    }

    public function getMake(): ?string
    {
        return $this->make;
    }

    public function setMake(string $make): self
    {
        $this->make = $make;

        return $this;
    }
}
