<?php

namespace AppBundle\Controller;

use AppBundle\Entity\DistributionI;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;

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
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $distributionIs = $em->getRepository('AppBundle:DistributionI')->findAll();

        return $this->render('distributioni/index.html.twig', array(
            'distributions' => $distributionIs,
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
        $distributionI = new Distributioni();
        $form = $this->createForm('AppBundle\Form\DistributionIType', $distributionI);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($distributionI);
            $em->flush();

            return $this->redirectToRoute('distributioni_show', array('id' => $distributionI->getId()));
        }

        return $this->render('distributioni/new.html.twig', array(
            'distributionI' => $distributionI,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a distributionI entity.
     *
     * @Route("/{id}", name="distributioni_show")
     * @Method("GET")
     */
    public function showAction(DistributionI $distributionI)
    {
        $deleteForm = $this->createDeleteForm($distributionI);

        return $this->render('distributioni/show.html.twig', array(
            'distributionI' => $distributionI,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing distributionI entity.
     *
     * @Route("/{id}/edit", name="distributioni_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, DistributionI $distributionI)
    {
        $deleteForm = $this->createDeleteForm($distributionI);
        $editForm = $this->createForm('AppBundle\Form\DistributionIType', $distributionI);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('distributioni_edit', array('id' => $distributionI->getId()));
        }

        return $this->render('distributioni/edit.html.twig', array(
            'distributionI' => $distributionI,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a distributionI entity.
     *
     * @Route("/{id}", name="distributioni_delete")
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
     * Creates a form to delete a distributionI entity.
     *
     * @param DistributionI $distributionI The distributionI entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(DistributionI $distributionI)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('distributioni_delete', array('id' => $distributionI->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
