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
     * @ORM\Column(name="person_name", type="string", length=100)
     */
    private $personName;

    /**
     * @var int
     *
     * @ORM\Column(name="person_ci", type="bigint", unique=true, length=11)
     */
    private $personCi;

    /**
     * @var string
     *
     * @ORM\Column(name="numberPlate", type="string", length=8)
     */
    private $numberPlate;

    /**
     * @var int
     *
     * @ORM\Column(name="license", type="string")
     */
    private $license;

    /**
     * @ORM\ManyToOne(targetEntity="Hotel", inversedBy="movements")
     * @ORM\JoinColumn(name="hotel_id", referencedColumnName="id")
     **/
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
     * Set personName
     *
     * @param string $personName
     *
     * @return ME
     */
    public function setPersonName($personName)
    {
        $this->personName = $personName;

        return $this;
    }

    /**
     * Get personName
     *
     * @return string
     */
    public function getPersonName()
    {
        return $this->personName;
    }

    /**
     * Set personCi
     *
     * @param integer $personCi
     *
     * @return ME
     */
    public function setPersonCi($personCi)
    {
        $this->personCi = $personCi;

        return $this;
    }

    /**
     * Get personCi
     *
     * @return int
     */
    public function getPersonCi()
    {
        return $this->personCi;
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
     * @return int
     */
    public function getLicense()
    {
        return $this->license;
    }

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
}
