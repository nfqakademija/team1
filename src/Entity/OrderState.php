<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * OrderState
 *
 * @ORM\Table(name="order_state", uniqueConstraints={@ORM\UniqueConstraint(name="id_order_status_UNIQUE", columns={"id_order_state"})}, indexes={@ORM\Index(name="fk_order_status_order1_idx", columns={"fk_order"})})
 * @ORM\Entity
 */
class OrderState
{
    /**
     * @var int
     *
     * @ORM\Column(name="id_order_state", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $idOrderState;

    /**
     * @var string
     *
     * @ORM\Column(name="state", type="string", length=45, nullable=false)
     */
    private $state;

    /**
     * @var \Order
     *
     * @ORM\ManyToOne(targetEntity="Order")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="fk_order", referencedColumnName="id_order")
     * })
     */
    private $fkOrder;

    public function getIdOrderState(): ?int
    {
        return $this->idOrderState;
    }

    public function getState(): ?string
    {
        return $this->state;
    }

    public function setState(string $state): self
    {
        $this->state = $state;

        return $this;
    }

    public function getFkOrder(): ?Order
    {
        return $this->fkOrder;
    }

    public function setFkOrder(?Order $fkOrder): self
    {
        $this->fkOrder = $fkOrder;

        return $this;
    }


}
