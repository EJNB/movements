<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * Instalation
 *
 * @ORM\Table(name="instalation")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\InstalationRepository")
 * @ORM\InheritanceType("JOINED")
 * @ORM\DiscriminatorColumn(name="type", type="string")
 * @ORM\DiscriminatorMap({"cm" = "CM", "hotel" = "Hotel"})
 */
abstract class Instalation
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
     * @Assert\NotBlank()
     * @ORM\Column(type="string", length=50, unique=true)
     */
    private $name;

//    /**
//     * One Intalation has Many Movimientos.
//     * @ORM\OneToMany(targetEntity="Movement", mappedBy="instalation")
//     */
//    private $movements;
//
    /**
     * @ORM\OneToMany(targetEntity="Distribution", mappedBy="instalation")
     **/
    private $distributions;
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->distributions = new \Doctrine\Common\Collections\ArrayCollection();
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
     * Set name
     *
     * @param string $name
     *
     * @return Instalation
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
     * Add distribution
     *
     * @param \AppBundle\Entity\Distribution $distribution
     *
     * @return Instalation
     */
    public function addDistribution(\AppBundle\Entity\Distribution $distribution)
    {
        $this->distributions[] = $distribution;

        return $this;
    }

    /**
     * Remove distribution
     *
     * @param \AppBundle\Entity\Distribution $distribution
     */
    public function removeDistribution(\AppBundle\Entity\Distribution $distribution)
    {
        $this->distributions->removeElement($distribution);
    }

    /**
     * Get distributions
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getDistributions()
    {
        return $this->distributions;
    }
}
