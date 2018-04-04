<?php

namespace AppBundle\Repository;

/**
 * PersonRepository
 *
 * This class was generated by the Doctrine ORM. Add your own custom
 * repository methods below.
 */
class PersonRepository extends \Doctrine\ORM\EntityRepository
{
    public function getAllPersonOrderedByDepartment($filter){
        $em = $this->getEntityManager();
        $qb = $em->createQueryBuilder();
        $qb->select('p')
            ->from('AppBundle:Person','p')
            ->innerJoin('p.department','d');
            if($filter){
                $qb->where($qb->expr()->like('p.name', '?1'))
                    ->orWhere($qb->expr()->like('p.cargo','?1'))
                    ->orWhere($qb->expr()->like('d.name','?1'))
                    ->setParameter(1, '%' . $filter . '%')
                ;
            }
            $qb->orderBy('d.name','ASC');
        ;

        return $qb->getQuery();
    }
}
