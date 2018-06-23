<?php

namespace AppBundle\Controller;

use AppBundle\Entity\DistributionE;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

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
//        $equipments = $em->getRepository('AppBundle:Equipment')->getAllEquipmentOrderByType();

        $paginator  = $this->get('knp_paginator');

        $pagination = $paginator->paginate(
            $distributionEs, /* query NOT result */
            $request->query->getInt('page', 1)/*page number*/,
            15/*limit per page*/
        );

        return $this->render('distributione/index.html.twig', array(
            'pagination' => $pagination,
//            'equipments' => $equipments,
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
            $equipments = count($em->getRepository('AppBundle:DistributionE')->findAll());
            $count = $equipments<10 ? '0'.$equipments : $equipments;
            $distributionE->setRequestDate(new \DateTime('now'));
            $distributionE->setState(0);
            $distributionE->setConsecutiveNumber('TR'.$count.date('Y'));
//            dump(count($em->getRepository('AppBundle:DistributionE')->findAll()));
//            dump(date('m'));
//            dump($count);
            $em->persist($distributionE);
            $em->flush();

            $mailer =
            //envio de correo
            $message = (new \Swift_Message('Traslado de equipamiento'))
                ->setFrom('asistencia@cubanacan.tur.cu')
                ->setTo('informatico4@cubanacan.tur.cu')
                ->setBody(
                    $this->renderView(
                    // app/Resources/views/Emails/registration.html.twig
                        'emails/distribution_notification.html.twig',
                        array('name' => 'javier')
                    ),
                    'text/html'
                );

//            $mailer->send($message);
            $this->get('mailer')->send($message);
//            $mailer->send($message);

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
     * Displays a form to edit an existing distributionE entity.
     *
     * @Route("/edit/{id}", name="distributione_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, DistributionE $distributionE)
    {
        $em = $this->getDoctrine()->getManager();
        $editForm = $this->createForm('AppBundle\Form\DistributionEType', $distributionE);
        $editForm->handleRequest($request);
        //busco todos los equipos sin distribuir
        $equipments = $em->getRepository('AppBundle:Equipment')->getAllEquipmentWithoutDistribution($distributionE->getId());
        //get all equipments by distribution
        $equipments_by_distribution = $em->getRepository('AppBundle:Equipment')->getAllEquipmentsByDistribution($distributionE->getId());

        if ($editForm->isSubmitted() && $editForm->isValid()) {

            foreach ($distributionE->getEquipments() as $equipment){
                $equipment->setDistribution(null);
                $em->persist($equipment);
                $em->flush();
            }

            if($request->request->get('equipments')!=null){
                foreach ($request->request->get('equipments') as $equipment){
                    $equipment = $em->getRepository('AppBundle:Equipment')->find($equipment);
                    $distributionE->addEquipment($equipment);
                }
            }

            $em->flush();

            $this->addFlash(
                'notice',
                'Sus cambios han sido guardados satisfactoriamente'
            );

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
     * @Route("/delete/{id}", name="distributione_delete")
     */
    public function deleteAction(DistributionE $distributionE)
    {
        $em = $this->getDoctrine()->getManager();
        foreach ($distributionE->getEquipments() as $equipment){
            $equipment->setDistribution(null);
            $em->persist($equipment);
            $em->flush();
        }

        $em->remove($distributionE);
        $em->flush();

        $this->addFlash(
            'notice',
            'La distribucion ha sido eliminada satisfactoriamente'
        );

        return $this->redirectToRoute('distributione_index');
    }

    /**
     * Displays a form to edit an existing distributionE entity.
     *
     * @Route("/{id}/print_documentation", name="print_documentation_by_distribution")
     * @Method("GET")
     */
    public function printDocumentationByDistributionAction(DistributionE $distributionE){
//        $em = $this->getDoctrine()->getManager();
//        $snappy = $this->get("knp_snappy.pdf");
//        $snappy->setOption('encoding','UTF-8');
//        $html = $this->renderView('documentation/request_letter.html.twig',array(
//            'title' => 'Awesome PDF Title',
//            'equipments' => $distributionE->getEquipments(),
//        ));
//        $filename = "custom_pdf_from_twig";
//        return new Response(
//            $snappy->getOutputFromHtml($html),
//            200,
//            array(
//                'Content-Type' => 'application/pdf',
//                'Content-Disposition' => 'inline;filename"'.$filename.'.pdf"'
//            )
//        );
        return $this->render('documentation/request_letter.html.twig',array(
            'title' => 'Awesome PDF Title',
            'equipments' => $distributionE->getEquipments(),
        ));
    }

    /**
     * Displays a form to edit an existing distributionE entity.
     *
     * @Route("/delete_distribution_selection", options={"expose"=true}, name="delete_distribution_selection")
     * @Method("POST")
     */
    public function deleteDistributionSelectionAction(Request $request){
        if ($request->isXmlHttpRequest()){

            $em = $this->getDoctrine()->getManager();
            $distribution_ids = $request->request->get('data');
            if ($distribution_ids){
                foreach ( $distribution_ids as $distribution ){
                    $distribution = $em->getRepository('AppBundle:DistributionE')->find(intval($distribution));
                    if ($distribution){
                        foreach ($distribution->getEquipments() as $equipment){
                            $equipment->setDistribution(null);
                            $em->persist($equipment);
                            $em->flush();
                        }
                        $em->remove($distribution);
                        $em->flush();
                    }
                }
            }

            $paginator  = $this->get('knp_paginator');

            $distributionEs = $em->getRepository('AppBundle:DistributionE')->getAllDistributionsE();
            $pagination = $paginator->paginate(
                $distributionEs, /* query NOT result */
                $request->query->getInt('page', 1)/*page number*/,
                15/*limit per page*/
            );

            return $this->render('distributione/list-distributions.html.twig', array(
                'pagination' => $pagination,
            ));
        }
    }

    /**
     * Displays a form to edit an existing distributionE entity.
     *
     * @Route("/set_distribution_status", options={"expose"=true}, name="set_distribution_status")
     * @Method("POST")
     */
    public function setStatusDistributionEAction(Request $request){
        if($request->isXmlHttpRequest()){
            $data_id = $request->request->get('data_id');
            $data_status = $request->request->get('data_status')=='false' ? 0 : 1;
            $em = $this->getDoctrine()->getManager();
            $distribution_e = $em->getRepository('AppBundle:DistributionE')->findOneById(intval($data_id));
            $distribution_e->setState($data_status);
            $em->flush();

            $paginator  = $this->get('knp_paginator');
            $distributionEs = $em->getRepository('AppBundle:DistributionE')->getAllDistributionsE();
            $pagination = $paginator->paginate(
                $distributionEs, /* query NOT result */
                $request->query->getInt('page', 1)/*page number*/,
                15/*limit per page*/
            );

            return $this->render('distributione/list-distributions.html.twig', array(
                'pagination' => $pagination,
            ));
        }
    }
}
