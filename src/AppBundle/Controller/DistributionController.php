<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Distribution;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;

/**
 * Distribution controller.
 *
 * @Route("distribution")
 */
class DistributionController extends Controller
{
    /**
     * Lists all distribution entities.
     *
     * @Route("/", name="distribution_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $distributions = $em->getRepository('AppBundle:Distribution')->findAll();

        return $this->render('distribution/index.html.twig', array(
            'distributions' => $distributions,
        ));
    }

    /**
     * Creates a new distribution entity.
     *
     * @Route("/new", name="distribution_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $distribution = new Distribution();
        $form = $this->createForm('AppBundle\Form\DistributionType', $distribution);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($distribution);
            $em->flush();

            return $this->redirectToRoute('distribution_show', array('id' => $distribution->getId()));
        }

        return $this->render('distribution/new.html.twig', array(
            'distribution' => $distribution,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a distribution entity.
     *
     * @Route("/{id}", name="distribution_show")
     * @Method("GET")
     */
    public function showAction(Distribution $distribution)
    {
        $deleteForm = $this->createDeleteForm($distribution);

        return $this->render('distribution/show.html.twig', array(
            'distribution' => $distribution,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing distribution entity.
     *
     * @Route("/{id}/edit", name="distribution_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, Distribution $distribution)
    {
        $deleteForm = $this->createDeleteForm($distribution);
        $editForm = $this->createForm('AppBundle\Form\DistributionType', $distribution);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('distribution_edit', array('id' => $distribution->getId()));
        }

        return $this->render('distribution/edit.html.twig', array(
            'distribution' => $distribution,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a distribution entity.
     *
     * @Route("/{id}", name="distribution_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, Distribution $distribution)
    {
        $form = $this->createDeleteForm($distribution);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($distribution);
            $em->flush();
        }

        return $this->redirectToRoute('distribution_index');
    }

    /**
     * Creates a form to delete a distribution entity.
     *
     * @param Distribution $distribution The distribution entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(Distribution $distribution)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('distribution_delete', array('id' => $distribution->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
