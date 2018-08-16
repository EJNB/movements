<?php

namespace AppBundle\Controller;

use AppBundle\Entity\ME;
use Doctrine\Common\Collections\ArrayCollection;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

/**
 * Me controller.
 *
 * @Route("me")
 */
class MEController extends Controller
{
    /**
     * Lists all mE entities.
     *
     * @Route("/", name="me_index")
     * @Method("GET")
     */
    public function indexAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        $filter = $request->query->get('filter');
        $external_movements = $em->getRepository('AppBundle:ME')->getAllMovementsOrderByDate($filter);
        $paginator  = $this->get('knp_paginator');

        $pagination = $paginator->paginate(
            $external_movements, /* query NOT result */
            $request->query->getInt('page', 1)/*page number*/,
            50/*limit per page*/
        );

        return $this->render('me/index.html.twig', array(
            'pagination' => $pagination,
            'filter' => $filter,
//            'mes' => $external_movements
        ));
    }

    /**
     * Creates a new mE entity.
     *
     * @Route("/new", options={"expose"=true}, name="me_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        $equipments = $em->getRepository('AppBundle:ME')->getAllEquipments();

        if ($request->isXmlHttpRequest()){
            /*//buscar las distribuciones q no han sido cerradas de este hotel
            $distributions_by_hotel = $em->getRepository('AppBundle:DistributionE')->findDisributionEByHotelWithStatusFalse(intval($request->request->get('hotel')));
            //si son mas de una, mandar un array con las mismas
            $cant = count($distributions_by_hotel);
            if ($cant>1){
                return new Response($cant);
            }else{//sino mandar los equipos pertenecientes a la unica distribucion
//                $equipments_by_distribution = $em->getRepository('AppBundle:ME')
//                    ->getEquipmentsByDistributionEByHotelWithStatusFalse(intval($request->request->get('hotel')));
//
//                return $this->render('equipment/equipments.html.twig',array(
//                    'equipments' => $equipments->getResult(),
//                    'equipments_by_distribution' => $equipments_by_distribution
//                ));
            }*/

            $equipments_by_distribution = $em->getRepository('AppBundle:ME')
                ->getEquipmentsByDistributionEByHotelWithStatusFalse(intval($request->request->get('hotel')));

            return $this->render('equipment/equipments.html.twig',array(
                'equipments' => $equipments->getResult(),
                'equipments_by_distribution' => $equipments_by_distribution
            ));
        }

        $mE = new Me();

        $form = $this->createForm('AppBundle\Form\METype', $mE);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $cant_movements_e = count($em->getRepository('AppBundle:ME')->findAll())+1;
            //esto es para garantizar q me quede 01,02,03....09
            $count = $cant_movements_e<10 ? '0'.$cant_movements_e : $cant_movements_e;
            $mE->setMovementId('ME'.$count.'-'.date('Y'));
            $user = $em->getRepository('AppBundle:User')
                ->findOneById($this->get('security.token_storage')->getToken()->getUser()->getId());
            $mE->setUser($user);
            //add all equipments to movement
            foreach ($request->request->get('equipments') as $equipment){
                $equipment = $em->getRepository('AppBundle:Equipment')->findOneById($equipment);
                $mE->addEquipment($equipment);
            }

            $em->persist($mE);
            $em->flush();

            $this->addFlash(
                'notice',
                'El movimiento ha sido guardado satisfactoriamente'
            );

            return $this->redirectToRoute('me_index');
        }

        return $this->render('me/new.html.twig', array(
            'mE' => $mE,
            'form' => $form->createView(),
            'equipments' => $equipments->getResult(),
        ));
    }

    /**
     * Finds and displays a mE entity.
     *
     * @Route("/{id}/show", name="me_show")
     * @Method("GET")
     */
    public function showAction(ME $mE)
    {
//        $deleteForm = $this->createDeleteForm($mE);
//        $em = $this->getDoctrine()->getManager();
//        $test = $em->getRepository('AppBundle:ME')->getMeDetails(3);
//        dump($test);

        return $this->render('me/show.html.twig', array(
            'mE' => $mE,
//            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing mE entity.
     *
     * @Route("/{id}/edit", name="me_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, ME $mE)
    {
        $em = $this->getDoctrine()->getManager();
        $editForm = $this->createForm('AppBundle\Form\METype', $mE);
        $editForm->handleRequest($request);
        $equipments = $em->getRepository('AppBundle:Equipment')->getAllEquipmentsByME($mE->getId());
        $equipments_by_movement = $em->getRepository('AppBundle:Equipment')->findEquipmentByMovement($mE->getId());

        if ($editForm->isSubmitted() && $editForm->isValid()) {

            //quitar todos los equipos q posee el mov
            foreach ($equipments_by_movement as $equipment){
                $equipment->setMovement();
                $em->persist($equipment);
                $em->flush();
            }

            //luego capturo todos los q trae el request
            foreach ($request->request->get('equipments') as $equipment){
                $equipment = $em->getRepository('AppBundle:Equipment')->findOneById($equipment);
                $mE->addEquipment($equipment);
            }

            $em->flush();

            $this->addFlash(
                'notice',
                'Sus cambios han sido guardados satisfactoriamente'
            );

            return $this->redirectToRoute('me_index');
        }

        return $this->render('me/edit.html.twig', array(
            'mE' => $mE,
            'edit_form' => $editForm->createView(),
            'equipments' => $equipments,
            'equipments_by_distribution' => $equipments_by_movement,
        ));
    }

    /**
     * Deletes a mE entity.
     *
     * @Route("/{id}/delete", name="me_delete")
     */
    public function deleteAction(Request $request, ME $mE)
    {
        $em = $this->getDoctrine()->getManager();

        foreach ($mE->getEquipments() as $equipment){
            $equipment->setMovement();//set null equipments
            $equipment->getDistribution()->setState(0);//volver el estado de la distribucion a false
            $em->flush();
        }
        $em->remove($mE);
        $em->flush();

        return $this->redirectToRoute('me_index');
    }

    /**
     * Upload scan scan document entity.
     *
     * @Route("/upload_scan_document_me/{id}", name="upload_scan_document_me")
     */
    public function uploadScanDocument(Request $request, ME $me){

        $em = $this->getDoctrine()->getManager();
        $file = $request->files->get('scan_document_attachment_me');//obtengo el archivo
        $url = $request->request->get('url');

        if($file){//si viene algun documento (pdf,doc o jpg o png)
            $fileName = md5(uniqid()).'-'.$file->getClientOriginalName().'.'.$file->guessExtension();/*.'.'.$file->guessExtension()*/;
            $file->move(
                $this->getParameter('file_directory_scan_me_document'),
                $fileName
            );
            $me->setDocumentFile($fileName);
            $em->flush();
        }


        $this->addFlash(
            'notice',
            'La documentación ha sido guardada satisfactoriamente'
        );

        return $this->redirect($url);
    }
}
