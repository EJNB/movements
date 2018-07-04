<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * DistributionI
 *
 * @ORM\Table(name="distribution_i")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\DistributionIRepository")
 */
class DistributionI extends Distribution
{
    /**
     * Many distributions internals have Many persons.
     * @ORM\ManyToMany(targetEntity="AppBundle\Entity\Person", inversedBy="distributions")
     * @ORM\JoinTable(name="distributioni_persons")
     */
    private $persons;

    /**
     * Add person
     *
     * @param \AppBundle\Entity\Person $person
     *
     * @return DistributionI
     */
    public function addPerson(\AppBundle\Entity\Person $person)
    {
        $this->persons[] = $person;

        return $this;
    }

    /**
     * Remove person
     *
     * @param \AppBundle\Entity\Person $person
     */
    public function removePerson(\AppBundle\Entity\Person $person)
    {
        $this->persons->removeElement($person);
    }

    /**
     * Get persons
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getPersons()
    {
        return $this->persons;
    }
}
