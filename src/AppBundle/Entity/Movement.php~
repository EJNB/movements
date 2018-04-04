<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * Movement
 *
 * @ORM\Table(name="movement")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\MovementRepository")
 * @ORM\InheritanceType("JOINED")
 * @ORM\DiscriminatorColumn(name="type", type="string")
 * @ORM\DiscriminatorMap({"mi" = "MI", "me" = "ME"})
 */
abstract class Movement
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
     * @var \String
     * @ORM\Column(type="string")
     */
    private $movementId;

    /**
     * @var \Date
     *
     * @ORM\Column(type="datetime")
     */
    private $date;

    /**
     * Many Movements have One User.
     * @ORM\ManyToOne(targetEntity="User", inversedBy="movements")
     * @ORM\JoinColumn(name="user_id", referencedColumnName="id")
     */
    private $user;

    /**
     * @ORM\Column(type="string", nullable=true)
     * @Assert\File(mimeTypes={ "application/pdf" })
     */
    private $documentFile;

    /**
     * One Movement has Many Equipments.
     * @ORM\OneToMany(targetEntity="Equipment", mappedBy="movement")
     */
    private $equipments;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->equipments = new \Doctrine\Common\Collections\ArrayCollection();
    }

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
     * Set movementId
     *
     * @param string $movementId
     *
     * @return Movement
     */
    public function setMovementId($movementId)
    {
        $this->movementId = $movementId;

        return $this;
    }

    /**
     * Get movementId
     *
     * @return string
     */
    public function getMovementId()
    {
        return $this->movementId;
    }

    /**
     * Set date
     *
     * @param \DateTime $date
     *
     * @return Movement
     */
    public function setDate($date)
    {
        $this->date = $date;

        return $this;
    }

    /**
     * Get date
     *
     * @return \DateTime
     */
    public function getDate()
    {
        return $this->date;
    }

    /**
     * Set documentFile
     *
     * @param string $documentFile
     *
     * @return Movement
     */
    public function setDocumentFile($documentFile)
    {
        $this->documentFile = $documentFile;

        return $this;
    }

    /**
     * Get documentFile
     *
     * @return string
     */
    public function getDocumentFile()
    {
        return $this->documentFile;
    }

    /**
     * Set user
     *
     * @param \AppBundle\Entity\User $user
     *
     * @return Movement
     */
    public function setUser(\AppBundle\Entity\User $user = null)
    {
        $this->user = $user;

        return $this;
    }

    /**
     * Get user
     *
     * @return \AppBundle\Entity\User
     */
    public function getUser()
    {
        return $this->user;
    }

    /**
     * Add equipment
     *
     * @param \AppBundle\Entity\Equipment $equipment
     *
     * @return Movement
     */
    public function addEquipment(\AppBundle\Entity\Equipment $equipment)
    {
        $this->equipments[] = $equipment;

        return $this;
    }

    /**
     * Remove equipment
     *
     * @param \AppBundle\Entity\Equipment $equipment
     */
    public function removeEquipment(\AppBundle\Entity\Equipment $equipment)
    {
        $this->equipments->removeElement($equipment);
    }

    /**
     * Get equipments
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getEquipments()
    {
        return $this->equipments;
    }
}
