<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Hotel
 *
 * @ORM\Table(name="hotel")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\HotelRepository")
 */
class Hotel extends Instalation
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
     * @ORM\OneToMany(targetEntity="ME", mappedBy="hotel")
     **/
    private $movements;

    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->movements = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add movement
     *
     * @param \AppBundle\Entity\ME $movement
     *
     * @return Hotel
     */
    public function addMovement(\AppBundle\Entity\ME $movement)
    {
        $this->movements[] = $movement;

        return $this;
    }

    /**
     * Remove movement
     *
     * @param \AppBundle\Entity\ME $movement
     */
    public function removeMovement(\AppBundle\Entity\ME $movement)
    {
        $this->movements->removeElement($movement);
    }

    /**
     * Get movements
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getMovements()
    {
        return $this->movements;
    }
}
