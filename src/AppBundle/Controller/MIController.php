<?php

namespace AppBundle\Controller;

use AppBundle\Entity\MI;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;

/**
 * Mi controller.
 *
 * @Route("mi")
 */
class MIController extends Controller
{
    /**
     * Lists all mI entities.
     *
     * @Route("/", name="mi_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $mIs = $em->getRepository('AppBundle:MI')->findAll();

        return $this->render('mi/index.html.twig', array(
            'mIs' => $mIs,
        ));
    }

    /**
     * Creates a new mI entity.
     *
     * @Route("/new", name="mi_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $mI = new Mi();
        $form = $this->createForm('AppBundle\Form\MIType', $mI);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($mI);
            $em->flush();

            return $this->redirectToRoute('mi_show', array('id' => $mI->getId()));
        }

        return $this->render('mi/new.html.twig', array(
            'mI' => $mI,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a mI entity.
     *
     * @Route("/{id}", name="mi_show")
     * @Method("GET")
     */
    public function showAction(MI $mI)
    {
        $deleteForm = $this->createDeleteForm($mI);

        return $this->render('mi/show.html.twig', array(
            'mI' => $mI,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing mI entity.
     *
     * @Route("/{id}/edit", name="mi_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, MI $mI)
    {
        $deleteForm = $this->createDeleteForm($mI);
        $editForm = $this->createForm('AppBundle\Form\MIType', $mI);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('mi_edit', array('id' => $mI->getId()));
        }

        return $this->render('mi/edit.html.twig', array(
            'mI' => $mI,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a mI entity.
     *
     * @Route("/{id}", name="mi_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, MI $mI)
    {
        $form = $this->createDeleteForm($mI);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($mI);
            $em->flush();
        }

        return $this->redirectToRoute('mi_index');
    }

    /**
     * Creates a form to delete a mI entity.
     *
     * @param MI $mI The mI entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(MI $mI)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('mi_delete', array('id' => $mI->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
