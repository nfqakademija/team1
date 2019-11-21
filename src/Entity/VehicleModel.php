<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * VehicleModel
 *
 * @ORM\Table(name="vehicle_model", uniqueConstraints={@ORM\UniqueConstraint(name="id_vehicle_model_UNIQUE", columns={"id_vehicle_model"})}, indexes={@ORM\Index(name="fk_vehicle_model_vehicle_make1_idx", columns={"fk_vehicle_make"})})
 * @ORM\Entity
 */
class VehicleModel
{
    /**
     * @var int
     *
     * @ORM\Column(name="id_vehicle_model", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idVehicleModel;

    /**
     * @var string
     *
     * @ORM\Column(name="model", type="string", length=45, nullable=false)
     */
    private $model;

    /**
     * @var \VehicleMake
     *
     * @ORM\ManyToOne(targetEntity="VehicleMake")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="fk_vehicle_make", referencedColumnName="id_vehicle_make")
     * })
     */
    private $fkVehicleMake;

    public function getIdVehicleModel(): ?int
    {
        return $this->idVehicleModel;
    }

    public function getModel(): ?string
    {
        return $this->model;
    }

    public function setModel(string $model): self
    {
        $this->model = $model;

        return $this;
    }

    public function getFkVehicleMake(): ?VehicleMake
    {
        return $this->fkVehicleMake;
    }

    public function setFkVehicleMake(?VehicleMake $fkVehicleMake): self
    {
        $this->fkVehicleMake = $fkVehicleMake;

        return $this;
    }
}
