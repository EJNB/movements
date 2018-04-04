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
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $distributionEs = $em->getRepository('AppBundle:DistributionE')->findAll();

        return $this->render('distributione/index.html.twig', array(
            'distributionEs' => $distributionEs,
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
        $distributionE = new Distributione();
        $form = $this->createForm('AppBundle\Form\DistributionEType', $distributionE);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($distributionE);
            $em->flush();

            return $this->redirectToRoute('distributione_show', array('id' => $distributionE->getId()));
        }

        return $this->render('distributione/new.html.twig', array(
            'distributionE' => $distributionE,
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
        $deleteForm = $this->createDeleteForm($distributionE);

        return $this->render('distributione/show.html.twig', array(
            'distributionE' => $distributionE,
            'delete_form' => $deleteForm->createView(),
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
        $deleteForm = $this->createDeleteForm($distributionE);
        $editForm = $this->createForm('AppBundle\Form\DistributionEType', $distributionE);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('distributione_edit', array('id' => $distributionE->getId()));
        }

        return $this->render('distributione/edit.html.twig', array(
            'distributionE' => $distributionE,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a distributionE entity.
     *
     * @Route("/{id}", name="distributione_delete")
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

    /**
     * Creates a form to delete a distributionE entity.
     *
     * @param DistributionE $distributionE The distributionE entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(DistributionE $distributionE)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('distributione_delete', array('id' => $distributionE->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
