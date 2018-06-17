<?php

namespace AppBundle\Controller;

use AppBundle\Entity\DistributionE;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;

/**
 * Distributione controller.
 *
 * @Route("distributione")
 */
class DistributionEController extends Controller
{
    /**
     * Lists all distributionE entities.
     *
     * @Route("/", name="distributione_index")
     * @Method("GET")
     */
    public function indexAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();

        $filter = $request->query->get('filter');
        $distributionEs = $em->getRepository('AppBundle:DistributionE')->getAllDistributionsE($filter);
        $equipments = $em->getRepository('AppBundle:Equipment')->getAllEquipmentOrderByType();

        $paginator  = $this->get('knp_paginator');

        $pagination = $paginator->paginate(
            $distributionEs, /* query NOT result */
            $request->query->getInt('page', 1)/*page number*/,
            15/*limit per page*/
        );

        return $this->render('distributione/index.html.twig', array(
            'pagination' => $pagination,
            'equipments' => $equipments,
        ));
    }

    /**
     * Creates a new distributionE entity.
     *
     * @Route("/new", name="distributione_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        $distributionE = new Distributione();
        $form = $this->createForm('AppBundle\Form\DistributionEType', $distributionE);
        //seleccionamos los equipos q no han sido distribuidos y tampoco entregados
        $equipments = $em->getRepository('AppBundle:Equipment')->getAllEquipmentOrderByType();
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            foreach ($request->request->get('equipments') as $equipment){
                $equipment = $em->getRepository('AppBundle:Equipment')->find($equipment);
                $distributionE->addEquipment($equipment);
            }
            $distributionE->setRequestDate(new \DateTime('now'));
            $em->persist($distributionE);
            $em->flush();

            $this->addFlash(
                'notice',
                'Sus datos han sido guardados satisfactoriamente'
            );

            return $this->redirectToRoute('distributione_index');
        }

        return $this->render('distributione/new.html.twig', array(
            'distributionE' => $distributionE,
            'equipments' => $equipments->getResult(),
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a distributionE entity.
     *
     * @Route("/{id}", name="distributione_show")
     * @Method("GET")
     */
    public function showAction(DistributionE $distributionE)
    {
        $em = $this->getDoctrine()->getManager();
        $equipments = $em->getRepository('AppBundle:Equipment')->getAllEquipmentOrderByType('')->getResult();
        return $this->render('distributione/show.html.twig', array(
            'distributionE' => $distributionE,
            'equipments' => $equipments,
        ));
    }

    /**
     * Displays a form to edit an existing distributionE entity.
     *
     * @Route("/{id}/edit", name="distributione_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, DistributionE $distributionE)
    {
        $em = $this->getDoctrine()->getManager();
        $editForm = $this->createForm('AppBundle\Form\DistributionEType', $distributionE);
        $editForm->handleRequest($request);
        $equipments = $em->getRepository('AppBundle:Equipment')->getAllEquipmentWithoutDistribution($distributionE->getId());
        $equipments_by_distribution = $em->getRepository('AppBundle:Equipment')->getAllEquipmentsByDistribution($distributionE->getId());

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('distributione_index');
        }

        return $this->render('distributione/edit.html.twig', array(
            'distributionE' => $distributionE,
            'edit_form' => $editForm->createView(),
            'equipments_by_distribution' => $equipments_by_distribution,
            'equipments' => $equipments,
        ));
    }

    /**
     * Deletes a distributionE entity.
     *
     * @Route("/{id}/delete", name="distributione_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, DistributionE $distributionE)
    {
        $form = $this->createDeleteForm($distributionE);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($distributionE);
            $em->flush();
        }

        return $this->redirectToRoute('distributione_index');
    }
}
