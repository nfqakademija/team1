<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * OrderVehicleData
 *
 * @ORM\Table(name="order_vehicle_data", uniqueConstraints={@ORM\UniqueConstraint(name="id_order_vehicle_data_UNIQUE", columns={"id_order_vehicle_data"})}, indexes={@ORM\Index(name="fk_order_vehicle_data_vehicle_model1_idx", columns={"fk_vehicle_model"})})
 * @ORM\Entity
 */
class OrderVehicleData
{
    /**
     * @var int
     *
     * @ORM\Column(name="id_order_vehicle_data", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idOrderVehicleData;

    /**
     * @var int|null
     *
     * @ORM\Column(name="year", type="integer", nullable=true, options={"default"="NULL"})
     */
    private $year = 'NULL';

    /**
     * @var int|null
     *
     * @ORM\Column(name="power", type="integer", nullable=true, options={"default"="NULL"})
     */
    private $power = 'NULL';

    /**
     * @var int|null
     *
     * @ORM\Column(name="displacement", type="integer", nullable=true, options={"default"="NULL"})
     */
    private $displacement = 'NULL';

    /**
     * @var string|null
     *
     * @ORM\Column(name="ecu_model", type="string", length=75, nullable=true, options={"default"="NULL"})
     */
    private $ecuModel = 'NULL';

    /**
     * @var \VehicleModel
     *
     * @ORM\ManyToOne(targetEntity="VehicleModel")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="fk_vehicle_model", referencedColumnName="id_vehicle_model")
     * })
     */
    private $fkVehicleModel;

    public function getIdOrderVehicleData(): ?int
    {
        return $this->idOrderVehicleData;
    }

    public function getYear(): ?int
    {
        return $this->year;
    }

    public function setYear(?int $year): self
    {
        $this->year = $year;

        return $this;
    }

    public function getPower(): ?int
    {
        return $this->power;
    }

    public function setPower(?int $power): self
    {
        $this->power = $power;

        return $this;
    }

    public function getDisplacement(): ?int
    {
        return $this->displacement;
    }

    public function setDisplacement(?int $displacement): self
    {
        $this->displacement = $displacement;

        return $this;
    }

    public function getEcuModel(): ?string
    {
        return $this->ecuModel;
    }

    public function setEcuModel(?string $ecuModel): self
    {
        $this->ecuModel = $ecuModel;

        return $this;
    }

    public function getFkVehicleModel(): ?VehicleModel
    {
        return $this->fkVehicleModel;
    }

    public function setFkVehicleModel(?VehicleModel $fkVehicleModel): self
    {
        $this->fkVehicleModel = $fkVehicleModel;

        return $this;
    }


}
