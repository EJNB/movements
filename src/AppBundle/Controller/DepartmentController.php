<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Department;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\DBAL\Exception\ForeignKeyConstraintViolationException;
use Doctrine\DBAL\Exception\UniqueConstraintViolationException;

/**
 * Department controller.
 *
 * @Route("department")
 */
class DepartmentController extends Controller
{
    /**
     * Lists all department entities.
     *
     * @Route("/", name="department_index")
     * @Method({"GET", "POST"})
     */
    public function indexAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();

        $departments = $em->getRepository('AppBundle:Department')->findAll();

        $department = new Department();
        $form = $this->createForm('AppBundle\Form\DepartmentType', $department);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $cm = $em->getRepository('AppBundle:CM')->findOneByName('Cubanacan Nivel Central');
            $department->setCm($cm);
            $em->persist($department);
            try{
                $em->flush();
                $this->addFlash(
                    'notice',
                    'Sus datos han sido guardados satisfactoriamente'
                );

            }catch (UniqueConstraintViolationException $exception){
                $this->addFlash(
                    'error',
                    'El departamento no pudo ser insertado, puesto que ya existe en el sistema.'
                );
            }


            return $this->redirectToRoute('department_index');
        }
        return $this->render('department/index.html.twig', array(
            'departments' => $departments,
            'form' => $form->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing department entity.
     *
     * @Route("/{id}/edit", name="department_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, Department $department)
    {
        $editForm = $this->createForm('AppBundle\Form\DepartmentType', $department);
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
                    'Los datos del departamento no fueron actualizados, puesto que ya existe un departamento en el sistema con los mismos datos.'
                );
            }

            return $this->redirectToRoute('department_index');
        }

        return $this->render('department/edit.html.twig', array(
            'department' => $department,
            'edit_form' => $editForm->createView(),
        ));
    }

    /**
     * Deletes a department entity.
     *
     * @Route("/{id}", name="department_delete")
     */
    public function deleteAction(Department $department)
    {
        $em = $this->getDoctrine()->getManager();
        try{
            $em->remove($department);
            $em->flush();
            $this->addFlash(
                'notice',
                'El departamento fue eliminado satisfactoriamente'
            );
        }catch (ForeignKeyConstraintViolationException $exception){
            $this->addFlash(
                'error',
                'El departamnento, no puede ser eliminado. \nTiene personas asociadas.'
            );
        }

        return $this->redirectToRoute('department_index');
    }
}
