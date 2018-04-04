<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * Department
 *
 * @ORM\Table(name="department")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\DepartmentRepository")
 */
class Department
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
     * @ORM\Column(type="string", length=40, unique=true)
     */
    private $name;

    /**
     * @ORM\OneToMany(targetEntity="Person", mappedBy="department")
     **/
    private $persons;

    /**
     * Many Department have One CM.
     * @ORM\ManyToOne(targetEntity="CM", inversedBy="departments")
     * @ORM\JoinColumn(name="cm_id", referencedColumnName="id")
     */
    private $cm;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->persons = new \Doctrine\Common\Collections\ArrayCollection();
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
     * @return Department
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
     * Add person
     *
     * @param \AppBundle\Entity\Person $person
     *
     * @return Department
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

    /**
     * Set cm
     *
     * @param \AppBundle\Entity\CM $cm
     *
     * @return Department
     */
    public function setCm(\AppBundle\Entity\CM $cm = null)
    {
        $this->cm = $cm;

        return $this;
    }

    /**
     * Get cm
     *
     * @return \AppBundle\Entity\CM
     */
    public function getCm()
    {
        return $this->cm;
    }

    public function __toString()
    {
        return $this->getName();
    }
}
