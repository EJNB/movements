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
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * Many Features have One Product.
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Hotel", inversedBy="distributionse")
     * @ORM\JoinColumn(name="hotel_id", referencedColumnName="id")
     */
    private $hotel;


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
