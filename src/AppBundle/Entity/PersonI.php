<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * PersonI
 *
 * @ORM\Table(name="person_i")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\PersonIRepository")
 */
class PersonI extends Person
{
    /**
     * Many Persons have One Department.
     * @ORM\ManyToOne(targetEntity="Department", inversedBy="persons")
     * @ORM\JoinColumn(name="department_id", referencedColumnName="id")
     */
    private $department;

    /**
     * One Product has Many Features.
     * @ORM\OneToMany(targetEntity="AppBundle\Entity\DistributionI", mappedBy="person")
     */
    private $distributionsi;

    /**
     * One Person has Many MI.
     * @ORM\OneToMany(targetEntity="MI", mappedBy="person")
     */
    private $movements;
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
     * @param \AppBundle\Entity\MI $movement
     *
     * @return Person
     */
    public function addMovement(\AppBundle\Entity\MI $movement)
    {
        $this->movements[] = $movement;

        return $this;
    }

    /**
     * Remove movement
     *
     * @param \AppBundle\Entity\MI $movement
     */
    public function removeMovement(\AppBundle\Entity\MI $movement)
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
     * Set department
     *
     * @param \AppBundle\Entity\Department $department
     *
     * @return Person
     */
    public function setDepartment(\AppBundle\Entity\Department $department = null)
    {
        $this->department = $department;

        return $this;
    }

    /**
     * Get department
     *
     * @return \AppBundle\Entity\Department
     */
    public function getDepartment()
    {
        return $this->department;
    }

    /**
     * Add distributionsi
     *
     * @param \AppBundle\Entity\DistributionI $distributionsi
     *
     * @return Person
     */
    public function addDistributionsi(\AppBundle\Entity\DistributionI $distributionsi)
    {
        $this->distributionsi[] = $distributionsi;

        return $this;
    }

    /**
     * Remove distributionsi
     *
     * @param \AppBundle\Entity\DistributionI $distributionsi
     */
    public function removeDistributionsi(\AppBundle\Entity\DistributionI $distributionsi)
    {
        $this->distributionsi->removeElement($distributionsi);
    }

    /**
     * Get distributionsi
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getDistributionsi()
    {
        return $this->distributionsi;
    }

}

