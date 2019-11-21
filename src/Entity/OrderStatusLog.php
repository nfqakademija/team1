<?php

namespace App\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * OrderStatusLog
 *
 * @ORM\Table(name="order_status_log", uniqueConstraints={@ORM\UniqueConstraint(name="id_order_status_log_UNIQUE", columns={"id_order_status_log"})}, indexes={@ORM\Index(name="fk_order_status_log_user1_idx", columns={"fk_user"}), @ORM\Index(name="fk_order_status_log_order1_idx", columns={"fk_order"})})
 * @ORM\Entity
 */
class OrderStatusLog
{
    /**
     * @var int
     *
     * @ORM\Column(name="id_order_status_log", type="integer", nullable=false)
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     */
    private $idOrderStatusLog;

    /**
     * @var string|null
     *
     * @ORM\Column(name="previous_state", type="string", length=45, nullable=true)
     */
    private $previousState;

    /**
     * @var string
     *
     * @ORM\Column(name="current_state", type="string", length=45, nullable=false)
     */
    private $currentState;

    /**
     * @var \DateTime|null
     *
     * @ORM\Column(name="date", type="datetime", nullable=true)
     */
    private $date;

    /**
     * @var \Order
     *
     * @ORM\ManyToOne(targetEntity="Order")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="fk_order", referencedColumnName="id_order")
     * })
     */
    private $fkOrder;

    /**
     * @var \User
     *
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="NONE")
     * @ORM\OneToOne(targetEntity="User")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="fk_user", referencedColumnName="id_user")
     * })
     */
    private $fkUser;

    public function getIdOrderStatusLog(): ?int
    {
        return $this->idOrderStatusLog;
    }

    public function getPreviousState(): ?string
    {
        return $this->previousState;
    }

    public function setPreviousState(?string $previousState): self
    {
        $this->previousState = $previousState;

        return $this;
    }

    public function getCurrentState(): ?string
    {
        return $this->currentState;
    }

    public function setCurrentState(string $currentState): self
    {
        $this->currentState = $currentState;

        return $this;
    }

    public function getDate(): ?\DateTimeInterface
    {
        return $this->date;
    }

    public function setDate(?\DateTimeInterface $date): self
    {
        $this->date = $date;

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

    public function getFkUser(): ?User
    {
        return $this->fkUser;
    }

    public function setFkUser(?User $fkUser): self
    {
        $this->fkUser = $fkUser;

        return $this;
    }
}
