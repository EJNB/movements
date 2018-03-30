<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * Distribution
 *
 * @ORM\Table(name="distribution")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\DistributionRepository")
 */
class Distribution
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
     * @var \DateTime
     *
     * @ORM\Column(name="requestDate", type="datetime")
     */
    private $requestDate;

//    /**
//     * esto me dira si la distribucion q se hizo se llego a ejecutar
//     * @var \Boolean
//     *
//     * @ORM\Column(type="boolean")
//     */
//    private $state;

    /**
     * @ORM\OneToMany(targetEntity="Equipment", mappedBy="distribution")
     **/
    private $equipments;
//
    /**
     * @ORM\ManyToOne(targetEntity="Instalation", inversedBy="distributions")
     * @ORM\JoinColumn(name="instalation_id", referencedColumnName="id")
     **/
    private $instalation;
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
     * Set requestDate
     *
     * @param \DateTime $requestDate
     *
     * @return Distribution
     */
    public function setRequestDate($requestDate)
    {
        $this->requestDate = $requestDate;

        return $this;
    }

    /**
     * Get requestDate
     *
     * @return \DateTime
     */
    public function getRequestDate()
    {
        return $this->requestDate;
    }

    /**
     * Add equipment
     *
     * @param \AppBundle\Entity\Equipment $equipment
     *
     * @return Distribution
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

    /**
     * Set instalation
     *
     * @param \AppBundle\Entity\Instalation $instalation
     *
     * @return Distribution
     */
    public function setInstalation(\AppBundle\Entity\Instalation $instalation = null)
    {
        $this->instalation = $instalation;

        return $this;
    }

    /**
     * Get instalation
     *
     * @return \AppBundle\Entity\Instalation
     */
    public function getInstalation()
    {
        return $this->instalation;
    }
}
