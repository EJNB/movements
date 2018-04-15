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
     * @ORM\ManyToOne(targetEntity="Hotel", inversedBy="movements")
     * @ORM\JoinColumn(name="hotel_id", referencedColumnName="id")
     **/
    private $hotel;
}
