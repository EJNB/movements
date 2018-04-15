<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * PersonE
 *
 * @ORM\Table(name="person_e")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\PersonERepository")
 */
class PersonE extends Person
{
    /**
     * @var int
     *
     * @ORM\Column(name="CI", type="integer")
     */
    private $cI;

    /**
     * @var string
     *
     * @ORM\Column(type="bigint", length=11)
     */
    private $license;

    /**
     * @var string
     *
     * @ORM\Column(name="number_plate", type="string", length=7)
     */
    private $numberPlate;

    /**
     * Set cI
     *
     * @param integer $cI
     *
     * @return PersonE
     */
    public function setCI($cI)
    {
        $this->cI = $cI;

        return $this;
    }

    /**
     * Get cI
     *
     * @return int
     */
    public function getCI()
    {
        return $this->cI;
    }

    /**
     * Set ocupation
     *
     * @param string $ocupation
     *
     * @return PersonE
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
     * Set license
     *
     * @param integer $license
     *
     * @return PersonE
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
     * @return PersonE
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
