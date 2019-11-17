<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * Order
 *
 * @ORM\Table(name="order", uniqueConstraints={@ORM\UniqueConstraint(name="id_order_UNIQUE", columns={"id_order"})}, indexes={@ORM\Index(name="fk_order_order_vehicle_data1_idx", columns={"fk_order_vehicle_data"}), @ORM\Index(name="fk_order_user1_idx", columns={"fk_user"})})
 * @ORM\Entity
 */
class Order
{
    /**
     * @var int
     *
     * @ORM\Column(name="id_order", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idOrder;

    /**
     * @var int
     *
     * @ORM\Column(name="price_total", type="integer", nullable=false)
     */
    private $priceTotal;

    /**
     * @var string|null
     *
     * @ORM\Column(name="comment", type="text", length=65535, nullable=true)
     */
    private $comment;

    /**
     * @var \OrderVehicleData
     *
     * @ORM\ManyToOne(targetEntity="OrderVehicleData")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="fk_order_vehicle_data", referencedColumnName="id_order_vehicle_data")
     * })
     */
    private $fkOrderVehicleData;

    /**
     * @var \User
     *
     * @ORM\ManyToOne(targetEntity="User")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="fk_user", referencedColumnName="id_user")
     * })
     */
    private $fkUser;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="Service", mappedBy="fkOrder")
     */
    private $fkService;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="VehicleEcuFile", inversedBy="fkOrder")
     * @ORM\JoinTable(name="order_to_vehicle_ecu_file",
     *   joinColumns={
     *     @ORM\JoinColumn(name="fk_order", referencedColumnName="id_order")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="fk_vehicle_ecu_file", referencedColumnName="id_vehicle_ecu_file")
     *   }
     * )
     */
    private $fkVehicleEcuFile;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->fkService = new \Doctrine\Common\Collections\ArrayCollection();
        $this->fkVehicleEcuFile = new \Doctrine\Common\Collections\ArrayCollection();
    }

    public function getIdOrder(): ?int
    {
        return $this->idOrder;
    }

    public function getPriceTotal(): ?int
    {
        return $this->priceTotal;
    }

    public function setPriceTotal(int $priceTotal): self
    {
        $this->priceTotal = $priceTotal;

        return $this;
    }

    public function getComment(): ?string
    {
        return $this->comment;
    }

    public function setComment(?string $comment): self
    {
        $this->comment = $comment;

        return $this;
    }

    public function getFkOrderVehicleData(): ?OrderVehicleData
    {
        return $this->fkOrderVehicleData;
    }

    public function setFkOrderVehicleData(?OrderVehicleData $fkOrderVehicleData): self
    {
        $this->fkOrderVehicleData = $fkOrderVehicleData;

        return $this;
    }

    public function getFkUser(): ?User
    {
        return $this->fkUser;
    }

    public function setFkUser(?User $fkUser): self
    {
        $this->fkUser = $fkUser;

        return $this;
    }

    /**
     * @return Collection|Service[]
     */
    public function getFkService(): Collection
    {
        return $this->fkService;
    }

    public function addFkService(Service $fkService): self
    {
        if (!$this->fkService->contains($fkService)) {
            $this->fkService[] = $fkService;
            $fkService->addFkOrder($this);
        }

        return $this;
    }

    public function removeFkService(Service $fkService): self
    {
        if ($this->fkService->contains($fkService)) {
            $this->fkService->removeElement($fkService);
            $fkService->removeFkOrder($this);
        }

        return $this;
    }

    /**
     * @return Collection|VehicleEcuFile[]
     */
    public function getFkVehicleEcuFile(): Collection
    {
        return $this->fkVehicleEcuFile;
    }

    public function addFkVehicleEcuFile(VehicleEcuFile $fkVehicleEcuFile): self
    {
        if (!$this->fkVehicleEcuFile->contains($fkVehicleEcuFile)) {
            $this->fkVehicleEcuFile[] = $fkVehicleEcuFile;
        }

        return $this;
    }

    public function removeFkVehicleEcuFile(VehicleEcuFile $fkVehicleEcuFile): self
    {
        if ($this->fkVehicleEcuFile->contains($fkVehicleEcuFile)) {
            $this->fkVehicleEcuFile->removeElement($fkVehicleEcuFile);
        }

        return $this;
    }
}
