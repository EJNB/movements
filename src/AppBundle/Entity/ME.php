<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * ME
 *
 * @ORM\Table(name="m_e")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\MERepository")
 */
class ME extends Movement
{
    /**
     * @ORM\ManyToOne(targetEntity="Hotel", inversedBy="movements")
     * @ORM\JoinColumn(name="hotel_id", referencedColumnName="id")
     **/
    private $hotel;

    /**
     * @var string
     *
     * @ORM\Column(type="string", length=50)
     */
    private $name;

    /**
     * @var string
     *
     * @ORM\Column(type="string", length=30)
     */
    private $ocupation;

    /**
     * @var int
     *
     * @ORM\Column(name="CI", type="bigint")
     */
    private $cI;

    /**
     * @var string
     *
     * @ORM\Column(type="bigint", length=11, nullable=true)
     */
    private $license;

    /**
     * @var string
     *
     * @ORM\Column(name="number_plate", type="string", length=7, nullable=true)
     */
    private $numberPlate;

    /**
     * Set hotel
     *
     * @param \AppBundle\Entity\Hotel $hotel
     *
     * @return ME
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

    /**
     * Set name
     *
     * @param string $name
     *
     * @return ME
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set ocupation
     *
     * @param string $ocupation
     *
     * @return ME
     */
    public function setOcupation($ocupation)
    {
        $this->ocupation = $ocupation;

        return $this;
    }

    /**
     * Get ocupation
     *
     * @return string
     */
    public function getOcupation()
    {
        return $this->ocupation;
    }

    /**
     * Set cI
     *
     * @param integer $cI
     *
     * @return ME
     */
    public function setCI($cI)
    {
        $this->cI = $cI;

        return $this;
    }

    /**
     * Get cI
     *
     * @return integer
     */
    public function getCI()
    {
        return $this->cI;
    }

    /**
     * Set license
     *
     * @param integer $license
     *
     * @return ME
     */
    public function setLicense($license)
    {
        $this->license = $license;

        return $this;
    }

    /**
     * Get license
     *
     * @return integer
     */
    public function getLicense()
    {
        return $this->license;
    }

    /**
     * Set numberPlate
     *
     * @param string $numberPlate
     *
     * @return ME
     */
    public function setNumberPlate($numberPlate)
    {
        $this->numberPlate = $numberPlate;

        return $this;
    }

    /**
     * Get numberPlate
     *
     * @return string
     */
    public function getNumberPlate()
    {
        return $this->numberPlate;
    }
}
