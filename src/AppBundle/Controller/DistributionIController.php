<?php

namespace AppBundle\Controller;

use AppBundle\Entity\DistributionI;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

/**
 * Distributioni controller.
 *
 * @Route("distributioni")
 */
class DistributionIController extends Controller
{
    /**
     * Lists all distributionI entities.
     *
     * @Route("/", name="distributioni_index")
     * @Method("GET")
     */
    public function indexAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();

        $filter = $request->query->get('filter');
        $distributionIs = $em->getRepository('AppBundle:DistributionI')->getAllDistributionsI($filter);

        $paginator  = $this->get('knp_paginator');

        $pagination = $paginator->paginate(
            $distributionIs, /* query NOT result */
            $request->query->getInt('page', 1)/*page number*/,
            30/*limit per page*/
        );

        return $this->render('distributioni/index.html.twig', array(
            'pagination' => $pagination,
        ));
    }

    /**
     * Creates a new distributionI entity.
     *
     * @Route("/new", name="distributioni_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        $distributionI = new Distributioni();
        $form = $this->createForm('AppBundle\Form\DistributionIType', $distributionI);
        $form->handleRequest($request);
        $equipments = $em->getRepository('AppBundle:DistributionI')->getEquipmentsModels();

        if ($form->isSubmitted() && $form->isValid()) {
            $limit = $form->get('persons')->getData()->count();
            $model = $request->request->get('equipments');
            $equipments_sent = $em->getRepository('AppBundle:Equipment')->getEquipments($limit,$model);//busco el modelo de los equipos

            foreach ($equipments_sent as $equipment){
                $distributionI->addEquipment($equipment);
            }

            $distributionI->setRequestDate(new \DateTime('now'));
            $distributionI->setState(0);
            $em->persist($distributionI);
            $em->flush();

            $this->addFlash(
                'notice',
                'Su distribución ha sido guardada satisafactoriamete.'
            );

            return $this->redirectToRoute('distributioni_index');
        }

        return $this->render('distributioni/new.html.twig', array(
            'distributionI' => $distributionI,
            'form' => $form->createView(),
            'equipments' => $equipments
        ));
    }

//    /**
//     * Finds and displays a distributionI entity.
//     *
//     * @Route("/{id}", name="distributioni_show")
//     * @Method("GET")
//     */
//    public function showAction(DistributionI $distributionI)
//    {
//        $deleteForm = $this->createDeleteForm($distributionI);
//
//        return $this->render('distributioni/show.html.twig', array(
//            'distributionI' => $distributionI,
//            'delete_form' => $deleteForm->createView(),
//        ));
//    }

    /**
     * Displays a form to edit an existing distributionI entity.
     *
     * @Route("/{id}/edit", name="distributioni_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, DistributionI $distributionI)
    {
        $em = $this->getDoctrine()->getManager();
        $equipments = $em->getRepository('AppBundle:DistributionI')->getEquipmentsModels();
        $editForm = $this->createForm('AppBundle\Form\DistributionIType', $distributionI);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {

            //set equipment to null
            foreach ($distributionI->getEquipments() as $equipment){
                $equipment->setDistribution(null);
                $em->persist($equipment);
                $em->flush();
            }

            //add the news equipments
            $limit = $editForm->get('persons')->getData()->count();
            $model = $request->request->get('equipments');
            $equipments_sent = $em->getRepository('AppBundle:Equipment')->getEquipments($limit,$model);//busco el modelo de los equipos

            foreach ($equipments_sent as $equipment){
                $equipment->setDistribution($distributionI);
                $em->persist($equipment);
                $em->flush();
            }

            $em->flush();

            $this->addFlash(
                'notice',
                'Su distribución ha sido actualizada satisafactoriamete.'
            );

            return $this->redirectToRoute('distributioni_index');
        }

        return $this->render('distributioni/edit.html.twig', array(
            'distributionI' => $distributionI,
            'edit_form' => $editForm->createView(),
            'equipments' => $equipments,
        ));
    }

    /**
     * Deletes a distributionI entity.
     *
     * @Route("/delete/{id}", name="distributioni_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, DistributionI $distributionI)
    {
        $form = $this->createDeleteForm($distributionI);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($distributionI);
            $em->flush();
        }

        return $this->redirectToRoute('distributioni_index');
    }

    /**
     * Delete many distributions interns
     *
     * @Route("/delete_many_distribution_i_selection", options={"expose"=true}, name="delete_many_distribution_i_selection")
     * @Method("POST")
     */
    public function deleteDistributionISelectionAction(Request $request)
    {
        if ($request->isXmlHttpRequest()) {

            $em = $this->getDoctrine()->getManager();
            $distribution_ids = $request->request->get('data');
            if ($distribution_ids) {
                foreach ($distribution_ids as $distribution) {
                    $distribution = $em->getRepository('AppBundle:DistributionI')->find(intval($distribution));
                    if ($distribution) {
                        foreach ($distribution->getEquipments() as $equipment) {
                            $equipment->setDistribution(null);
                            $em->persist($equipment);
                            $em->flush();
                        }
                        $em->remove($distribution);
                        $em->flush();
                    }
                }
            }

            $paginator = $this->get('knp_paginator');

            $distributionIs = $em->getRepository('AppBundle:DistributionI')->getAllDistributionsI();
            $pagination = $paginator->paginate(
                $distributionIs, /* query NOT result */
                $request->query->getInt('page', 1)/*page number*/,
                15/*limit per page*/
            );

            return $this->render('distributioni/list-distributions.html.twig', array(
                'pagination' => $pagination,
            ));
        }
    }

    /**
     * Displays a form to edit an existing distributionE entity.
     *
     * @Route("/set_distribution_i_status", options={"expose"=true}, name="set_distribution_i_status")
     * @Method("POST")
     */
    public function setStatusDistributionIAction(Request $request){
        if($request->isXmlHttpRequest()){
            $data_id = $request->request->get('data_id');
            $data_status = $request->request->get('data_status')=='false' ? 0 : 1;
            $em = $this->getDoctrine()->getManager();
            $distribution_i = $em->getRepository('AppBundle:DistributionI')->findOneById(intval($data_id));
            $distribution_i->setState($data_status);
            $em->flush();

            $paginator  = $this->get('knp_paginator');
            $distributionIs = $em->getRepository('AppBundle:DistributionI')->getAllDistributionsI();
            $pagination = $paginator->paginate(
                $distributionIs, /* query NOT result */
                $request->query->getInt('page', 1)/*page number*/,
                15/*limit per page*/
            );

            return $this->render('distributioni/list-distributions.html.twig', array(
                'pagination' => $pagination,
            ));
        }
    }
}
