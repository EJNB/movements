<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * DistributionE
 *
 * @ORM\Table(name="distribution_e")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\DistributionERepository")
 */
class DistributionE extends Distribution
{

    /**
     * Many Features have One Product.
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Hotel", inversedBy="distributionse")
     * @ORM\JoinColumn(name="hotel_id", referencedColumnName="id")
     */
    private $hotel;

    /**
     * @var string
     *
     * @ORM\Column(name="consecutive_number", type="string")
     */
    private $consecutive_number;

    /**
     * Set consecutiveNumber
     *
     * @param string $consecutiveNumber
     *
     * @return DistributionE
     */
    public function setConsecutiveNumber($consecutiveNumber)
    {
        $this->consecutive_number = $consecutiveNumber;

        return $this;
    }

    /**
     * Get consecutiveNumber
     *
     * @return string
     */
    public function getConsecutiveNumber()
    {
        return $this->consecutive_number;
    }

    /**
     * Set hotel
     *
     * @param \AppBundle\Entity\Hotel $hotel
     *
     * @return DistributionE
     */
    public function setHotel(\AppBundle\Entity\Hotel $hotel = null)
    {
        $this->hotel = $hotel;

        return $this;
    }

    /**
     * Get hotel
     *
     * @return \AppBundle\Entity\Hotel
     */
    public function getHotel()
    {
        return $this->hotel;
    }
}
