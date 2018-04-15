<?php

namespace AppBundle\Controller;

use AppBundle\Entity\ME;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;

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

        $mov_externos = $em->getRepository('AppBundle:ME')->getAllMovementsOrderByDate();
        $paginator = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
            $mov_externos, /* query NOT result */
            $request->query->getInt('page', 1)/*page number*/,
            50/*limit per page*/
        );

        return $this->render('me/index.html.twig', array(
            'pagination' => $pagination,
        ));
    }

    /**
     * Creates a new mE entity.
     *
     * @Route("/new", name="me_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $mE = new Me();
        $form = $this->createForm('AppBundle\Form\METype', $mE);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($mE);
            $em->flush();

            return $this->redirectToRoute('me_show', array('id' => $mE->getId()));
        }

        return $this->render('me/new.html.twig', array(
            'mE' => $mE,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a mE entity.
     *
     * @Route("/{id}", name="me_show")
     * @Method("GET")
     */
    public function showAction(ME $mE)
    {
        $deleteForm = $this->createDeleteForm($mE);

        return $this->render('me/show.html.twig', array(
            'mE' => $mE,
            'delete_form' => $deleteForm->createView(),
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
        $deleteForm = $this->createDeleteForm($mE);
        $editForm = $this->createForm('AppBundle\Form\METype', $mE);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('me_edit', array('id' => $mE->getId()));
        }

        return $this->render('me/edit.html.twig', array(
            'mE' => $mE,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a mE entity.
     *
     * @Route("/{id}", name="me_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, ME $mE)
    {
        $form = $this->createDeleteForm($mE);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($mE);
            $em->flush();
        }

        return $this->redirectToRoute('me_index');
    }

    /**
     * Creates a form to delete a mE entity.
     *
     * @param ME $mE The mE entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(ME $mE)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('me_delete', array('id' => $mE->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
