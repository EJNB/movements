<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Type;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;
use AppBundle\Form\TypeType;

/**
 * Type controller.
 *
 * @Route("type")
 */
class TypeController extends Controller
{
    /**
     * Lists all type entities.
     *
     * @Route("/", name="type_index")
     * @Method({"GET", "POST"})
     */
    public function indexAction(Request $request)
    {
        $type = new Type();
        $em = $this->getDoctrine()->getManager();
        $form = $this->createForm(TypeType::class, $type);
        $form->handleRequest($request);

        $types = $em->getRepository('AppBundle:Type')->findAll();

        if ($form->isSubmitted() && $form->isValid()) {
            $em->persist($type);
            $em->flush();

            $this->addFlash(
                'notice',
                'Sus datos han sido guardados satisfactoriamente'
            );

            return $this->redirectToRoute('type_index');
        }

        return $this->render('type/index.html.twig', array(
            'types' => $types,
            'form'  => $form->createView()
        ));
    }

    /**
     * Displays a form to edit an existing type entity.
     *
     * @Route("/{id}/edit", name="type_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, Type $type)
    {
        $editForm = $this->createForm('AppBundle\Form\TypeType', $type);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            $this->addFlash(
                'notice',
                'Sus cambios han sido guardados satisfactoriamente'
            );

            return $this->redirectToRoute('type_index');
        }

        return $this->render('type/edit.html.twig', array(
            'type' => $type,
            'edit_form' => $editForm->createView(),
        ));
    }

    /**
     * Deletes a type entity.
     *
     * @Route("/{id}/delete", name="type_delete")
     */
    public function deleteAction(Type $type)
    {

        $em = $this->getDoctrine()->getManager();
        $em->remove($type);
        $em->flush();

        $this->addFlash(
            'notice',
            'El tipo ha sido eliminado satisfactoriamente'
        );


        return $this->redirectToRoute('type_index');
    }
}
