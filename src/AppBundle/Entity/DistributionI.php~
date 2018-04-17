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
     * Many Features have One Product.
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\PersonI", inversedBy="distributionsi")
     * @ORM\JoinColumn(name="personi_id", referencedColumnName="id")
     */
    private $person;

    /**
     * Set person
     *
     * @param \AppBundle\Entity\Person $person
     *
     * @return DistributionI
     */
    public function setPerson(\AppBundle\Entity\Person $person = null)
    {
        $this->person = $person;

        return $this;
    }

    /**
     * Get person
     *
     * @return \AppBundle\Entity\Person
     */
    public function getPerson()
    {
        return $this->person;
    }
}
