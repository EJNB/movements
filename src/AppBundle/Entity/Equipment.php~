<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * Equipment
 *
 * @ORM\Table(name="equipment")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\EquipmentRepository")
 */
class Equipment
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var string
     *
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $description;

    /**
     * @var string
     *
     * @ORM\Column(type="string", unique=true)
     */
    private $ns;

    /**
     * @var int
     *
     * @ORM\Column(type="string", unique=true)
     */
    private $ni;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="create_at", type="datetime")
     */
    private $createAt;

    /**
     * Many Equipment have One mark.
     * @ORM\ManyToOne(targetEntity="Model", inversedBy="equipments")
     * @ORM\JoinColumn(name="model_id", referencedColumnName="id")
     */
    private $model;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Invoice", inversedBy="equipments")
     * @ORM\JoinColumn(name="invoice_id", referencedColumnName="id")
     **/
    private $invoice;

    /**
     * @ORM\ManyToOne(targetEntity="Distribution", inversedBy="equipments")
     * @ORM\JoinColumn(name="distribution_id", referencedColumnName="id")
     **/
    private $distribution;

    /**
     * Many Equipments have One Movement.
     * @ORM\ManyToOne(targetEntity="Movement", inversedBy="equipments")
     * @ORM\JoinColumn(name="movement_id", referencedColumnName="id")
     */
    private $movement;

    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set description
     *
     * @param string $description
     *
     * @return Equipment
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set ns
     *
     * @param string $ns
     *
     * @return Equipment
     */
    public function setNs($ns)
    {
        $this->ns = $ns;

        return $this;
    }

    /**
     * Get ns
     *
     * @return string
     */
    public function getNs()
    {
        return $this->ns;
    }

    /**
     * Set ni
     *
     * @param string $ni
     *
     * @return Equipment
     */
    public function setNi($ni)
    {
        $this->ni = $ni;

        return $this;
    }

    /**
     * Get ni
     *
     * @return string
     */
    public function getNi()
    {
        return $this->ni;
    }

    /**
     * Set createAt
     *
     * @param \DateTime $createAt
     *
     * @return Equipment
     */
    public function setCreateAt($createAt)
    {
        $this->createAt = $createAt;

        return $this;
    }

    /**
     * Get createAt
     *
     * @return \DateTime
     */
    public function getCreateAt()
    {
        return $this->createAt;
    }

    /**
     * Set model
     *
     * @param \AppBundle\Entity\Model $model
     *
     * @return Equipment
     */
    public function setModel(\AppBundle\Entity\Model $model = null)
    {
        $this->model = $model;

        return $this;
    }

    /**
     * Get model
     *
     * @return \AppBundle\Entity\Model
     */
    public function getModel()
    {
        return $this->model;
    }

    /**
     * Set distribution
     *
     * @param \AppBundle\Entity\Distribution $distribution
     *
     * @return Equipment
     */
    public function setDistribution(\AppBundle\Entity\Distribution $distribution = null)
    {
        $this->distribution = $distribution;

        return $this;
    }

    /**
     * Get distribution
     *
     * @return \AppBundle\Entity\Distribution
     */
    public function getDistribution()
    {
        return $this->distribution;
    }

    /**
     * Set movement
     *
     * @param \AppBundle\Entity\Movement $movement
     *
     * @return Equipment
     */
    public function setMovement(\AppBundle\Entity\Movement $movement = null)
    {
        $this->movement = $movement;

        return $this;
    }

    /**
     * Get movement
     *
     * @return \AppBundle\Entity\Movement
     */
    public function getMovement()
    {
        return $this->movement;
    }

    public function __toString()
    {
        return
            $this->getModel()->getBrand()->getType().' '.
            $this->getModel()->getBrand().' '.
            $this->getModel()/*.' '.
            $this->getNi().' '.
            $this->getNs()*/;
    }

    /**
     * Set invoice
     *
     * @param \AppBundle\Entity\Invoice $invoice
     *
     * @return Equipment
     */
    public function setInvoice(\AppBundle\Entity\Invoice $invoice = null)
    {
        $this->invoice = $invoice;

        return $this;
    }

    /**
     * Get invoice
     *
     * @return \AppBundle\Entity\Invoice
     */
    public function getInvoice()
    {
        return $this->invoice;
    }
}
