<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * CM
 *
 * @ORM\Table(name="c_m")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\CMRepository")
 */
class CM extends Instalation
{
    /**
     * @ORM\OneToMany(targetEntity="Department", mappedBy="cm")
     **/
    private $departments;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->departments = new \Doctrine\Common\Collections\ArrayCollection();
    }

    /**
     * Add department
     *
     * @param \AppBundle\Entity\Department $department
     *
     * @return CM
     */
    public function addDepartment(\AppBundle\Entity\Department $department)
    {
        $this->departments[] = $department;

        return $this;
    }

    /**
     * Remove department
     *
     * @param \AppBundle\Entity\Department $department
     */
    public function removeDepartment(\AppBundle\Entity\Department $department)
    {
        $this->departments->removeElement($department);
    }

    /**
     * Get departments
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getDepartments()
    {
        return $this->departments;
    }
}
