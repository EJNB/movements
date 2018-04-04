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
     * @ORM\OneToMany(targetEntity="ME", mappedBy="hotel")
     **/
    private $movements;

    /**
     * One Product has Many Features.
     * @ORM\OneToMany(targetEntity="AppBundle\Entity\DistributionE", mappedBy="hotel")
     */
    private $distributionse;

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

    /**
     * Add distributionse
     *
     * @param \AppBundle\Entity\DistributionE $distributionse
     *
     * @return Hotel
     */
    public function addDistributionse(\AppBundle\Entity\DistributionE $distributionse)
    {
        $this->distributionse[] = $distributionse;

        return $this;
    }

    /**
     * Remove distributionse
     *
     * @param \AppBundle\Entity\DistributionE $distributionse
     */
    public function removeDistributionse(\AppBundle\Entity\DistributionE $distributionse)
    {
        $this->distributionse->removeElement($distributionse);
    }

    /**
     * Get distributionse
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getDistributionse()
    {
        return $this->distributionse;
    }
}
