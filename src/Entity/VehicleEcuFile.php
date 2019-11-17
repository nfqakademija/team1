<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use http\Exception\InvalidArgumentException;

/**
 * VehicleEcuFile
 *
 * @ORM\Table(name="vehicle_ecu_file", uniqueConstraints={@ORM\UniqueConstraint(name="id_file_UNIQUE", columns={"id_vehicle_ecu_file"})})
 * @ORM\Entity
 */
class VehicleEcuFile
{

    const TYPE_NEW = 'NEW';
    const TYPE_MODIFIED = 'MODIFIED';
    /**
     * @var int
     *
     * @ORM\Column(name="id_vehicle_ecu_file", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idVehicleEcuFile;

    /**
     * @var string
     *
     * @ORM\Column(name="filename", type="string", length=75, nullable=false)
     */
    private $filename;

    /**
     * @var string|null
     *
     * @ORM\Column(name="hash", type="string", length=255, nullable=true, options={"default"="NULL"})
     */
    private $hash = 'NULL';

    /**
     * @var string
     *
     * @ORM\Column(name="type", type="string", length=20, nullable=false)
     */
    private $type;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="Order", mappedBy="fkVehicleEcuFile")
     */
    private $fkOrder;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->fkOrder = new \Doctrine\Common\Collections\ArrayCollection();
        $this->type = self::TYPE_NEW;
    }

    public function getIdVehicleEcuFile(): ?int
    {
        return $this->idVehicleEcuFile;
    }

    public function getFilename(): ?string
    {
        return $this->filename;
    }

    public function setFilename(string $filename): self
    {
        $this->filename = $filename;

        return $this;
    }

    public function getHash(): ?string
    {
        return $this->hash;
    }

    public function setHash(?string $hash): self
    {
        $this->hash = $hash;

        return $this;
    }

    public function getType(): ?string
    {
        return $this->type;
    }

    public function setType(string $type): self
    {

        if(!in_array($type, array(self::TYPE_NEW, self::TYPE_MODIFIED))) {
            throw new InvalidArgumentException("Invalid type");
        }
        $this->type = $type;

        return $this;
    }

    /**
     * @return Collection|Order[]
     */
    public function getFkOrder(): Collection
    {
        return $this->fkOrder;
    }

    public function addFkOrder(Order $fkOrder): self
    {
        if (!$this->fkOrder->contains($fkOrder)) {
            $this->fkOrder[] = $fkOrder;
            $fkOrder->addFkVehicleEcuFile($this);
        }

        return $this;
    }

    public function removeFkOrder(Order $fkOrder): self
    {
        if ($this->fkOrder->contains($fkOrder)) {
            $this->fkOrder->removeElement($fkOrder);
            $fkOrder->removeFkVehicleEcuFile($this);
        }

        return $this;
    }
}
