<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * Service
 *
 * @ORM\Table(name="service", uniqueConstraints={@ORM\UniqueConstraint(name="id_service_UNIQUE", columns={"id_service"})}, indexes={@ORM\Index(name="fk_category_idx", columns={"fk_category"})})
 * @ORM\Entity
 */
class Service
{
    /**
     * @var int
     *
     * @ORM\Column(name="id_service", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idService;

    /**
     * @var string
     *
     * @ORM\Column(name="name", type="string", length=75, nullable=false)
     */
    private $name;

    /**
     * @var int
     *
     * @ORM\Column(name="price", type="integer", nullable=false)
     */
    private $price;

    /**
     * @var string|null
     *
     * @ORM\Column(name="description", type="string", length=255, nullable=true)
     */
    private $description;

    /**
     * @var \Category
     *
     * @ORM\ManyToOne(targetEntity="Category")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="fk_category", referencedColumnName="id_category")
     * })
     */
    private $fkCategory;

    /**
     * @var \Doctrine\Common\Collections\Collection
     *
     * @ORM\ManyToMany(targetEntity="Order", inversedBy="fkService")
     * @ORM\JoinTable(name="order_to_service",
     *   joinColumns={
     *     @ORM\JoinColumn(name="fk_service", referencedColumnName="id_service")
     *   },
     *   inverseJoinColumns={
     *     @ORM\JoinColumn(name="fk_order", referencedColumnName="id_order")
     *   }
     * )
     */
    private $fkOrder;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->fkOrder = new \Doctrine\Common\Collections\ArrayCollection();
    }

    public function getIdService(): ?int
    {
        return $this->idService;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

    public function getPrice(): ?int
    {
        return $this->price;
    }

    public function setPrice(int $price): self
    {
        $this->price = $price;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getFkCategory(): ?Category
    {
        return $this->fkCategory;
    }

    public function setFkCategory(?Category $fkCategory): self
    {
        $this->fkCategory = $fkCategory;

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
        }

        return $this;
    }

    public function removeFkOrder(Order $fkOrder): self
    {
        if ($this->fkOrder->contains($fkOrder)) {
            $this->fkOrder->removeElement($fkOrder);
        }

        return $this;
    }
}
