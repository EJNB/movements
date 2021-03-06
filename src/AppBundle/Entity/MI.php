<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * MI
 *
 * @ORM\Table(name="m_i")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\MIRepository")
 */
class MI extends Movement
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
     * @ORM\Column(name="description", type="text")
     */
    private $description;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Person", inversedBy="movements")
     * @ORM\JoinColumn(name="person_id", referencedColumnName="id")
     **/
    private $person;

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
     * Set description
     *
     * @param string $description
     *
     * @return MI
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description
     *
     * @return string
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set mi
     *
     * @param \AppBundle\Entity\Person $mi
     *
     * @return MI
     */
    public function setMi(\AppBundle\Entity\Person $mi = null)
    {
        $this->mi = $mi;

        return $this;
    }

    /**
     * Get mi
     *
     * @return \AppBundle\Entity\Person
     */
    public function getMi()
    {
        return $this->mi;
    }

    /**
     * Set person
     *
     * @param \AppBundle\Entity\PersonI $person
     *
     * @return MI
     */
    public function setPerson(\AppBundle\Entity\Person $person = null)
    {
        $this->person = $person;

        return $this;
    }

    /**
     * Get person
     *
     * @return \AppBundle\Entity\PersonI
     */
    public function getPerson()
    {
        return $this->person;
    }
}
