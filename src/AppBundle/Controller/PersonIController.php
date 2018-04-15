<?php

namespace AppBundle\Controller;

use AppBundle\Entity\PersonI;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\DBAL\Exception\ForeignKeyConstraintViolationException;
use Doctrine\DBAL\Exception\UniqueConstraintViolationException;

/**
 * Personi controller.
 *
 * @Route("personi")
 */
class PersonIController extends Controller
{
    /**
     * Lists all personI entities.
     *
     * @Route("/", name="personi_index")
     * @Method({"GET","POST"})
     */
    public function indexAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        $person = new PersonI();
        $form = $this->createForm('AppBundle\Form\PersonIType', $person);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($person);
            try{
                $em->flush();
                $this->addFlash(
                    'notice',
                    'Sus datos han sido guardados satisfactoriamente'
                );

            }catch (UniqueConstraintViolationException $exception){
                $this->addFlash(
                    'error',
                    'La persona no pudo ser insertada, puesto que ya existe en el sistema.'
                );
            }

            return $this->redirectToRoute('personi_index');
        }

        $filter = $request->query->get('filter');
        $people = $em->getRepository('AppBundle:PersonI')->getAllPersonOrderedByDepartment($filter);
        $paginator = $this->get('knp_paginator');
        $pagination = $paginator->paginate(
            $people,
            $request->query->getInt('page', 1)/*page number*/,
            10/*limit per page*/
        );

        return $this->render('personi/index.html.twig', array(
            'pagination' => $pagination,
            'form' => $form->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing personI entity.
     *
     * @Route("/{id}/edit", name="personi_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, PersonI $personI)
    {
        $editForm = $this->createForm('AppBundle\Form\PersonIType', $personI);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            try{
                $this->getDoctrine()->getManager()->flush();
                $this->addFlash(
                    'notice',
                    'Sus cambios han sido guardados satisfactoriamente.'
                );

            }catch (UniqueConstraintViolationException $exception){
                $this->addFlash(
                    'error',
                    'Los datos de la persona no fueron actualizados, puesto que ya existe una persona en el sistema con los mismos datos.'
                );
            }

            return $this->redirectToRoute('personi_index');
        }

        return $this->render('personi/edit.html.twig', array(
            'person' => $personI,
            'edit_form' => $editForm->createView(),
        ));
    }

    /**
     * Deletes a person entity.
     *
     * @Route("/{id}/delete", name="personi_delete")
     */
    public function deleteAction(PersonI $personI)
    {
        $em = $this->getDoctrine()->getManager();
        try{
            $em->remove($personI);
            $em->flush();
            $this->addFlash(
                'notice',
                'La persona fue eliminada satisfactoriamente'
            );
        }catch (ForeignKeyConstraintViolationException $exception){
            $this->addFlash(
                'error',
                'La persona no puede ser eliminada, tiene distribuciones asociadas.'
            );
        }
        return $this->redirectToRoute('personi_index');
    }
}
