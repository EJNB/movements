<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Equipment;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;
use Doctrine\DBAL\Exception\ForeignKeyConstraintViolationException;
use Doctrine\DBAL\Exception\UniqueConstraintViolationException;

/**
 * Equipment controller.
 *
 * @Route("equipment")
 */
class EquipmentController extends Controller
{
    /**
     * Lists all equipment entities.
     *
     * @Route("/", name="equipment_index")
     * @Method("GET")
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $equipments = $em->getRepository('AppBundle:Equipment')->findAll();

        return $this->render('equipment/index.html.twig', array(
            'equipments' => $equipments,
        ));
    }

    /**
     * Creates a new equipment entity.
     *
     * @Route("/new", name="equipment_new")
     * @Method({"GET", "POST"})
     *
     */
    public function newAction(Request $request)
    {
        $equipment = new Equipment();
        $em = $this->getDoctrine()->getManager();
        $form = $this->createForm('AppBundle\Form\EquipmentType', $equipment);
        $form->handleRequest($request);
        $types = $em->getRepository('AppBundle:Type')->findAll();
        $brands = $em->getRepository('AppBundle:Brand')->findAll();
        $models = $em->getRepository('AppBundle:Model')->findAll();

        if ($form->isSubmitted() && $form->isValid()) {
            for ($i=0;$i<$request->request->get('cantidad');$i++) {
                $equip = new Equipment();
                $equip->setModel($em->getRepository('AppBundle:Model')->find(intval($request->request->get('model'))));
                $equip->setDescription($equipment->getDescription());
                $equip->setCreateAt(new \DateTime());
                $equip->setNi($request->request->get('ni')[$i]);
                $equip->setNs($request->request->get('ns')[$i]);
                $em->persist($equip);

                try{
                    $em->flush();
                    $this->addFlash(
                        'notice',
                        'Sus datos han sido guardados satisfactoriamente'
                    );

                }catch (UniqueConstraintViolationException $exception){
                    $this->addFlash(
                        'error',
                        'El número de inventario o número de serie, ya existe.'
                    );
                }
            }

            return $this->redirectToRoute('equipment_index');
        }

        return $this->render('equipment/new.html.twig', array(
            'equipment' => $equipment,
            'form' => $form->createView(),
            'types' => $types,
            'brands' => $brands,
            'models' => $models,
        ));
    }

    /**
     * Displays a form to edit an existing equipment entity.
     *
     * @Route("/{id}/edit", name="equipment_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, Equipment $equipment)
    {
        $em = $this->getDoctrine()->getManager();
        $editForm = $this->createForm('AppBundle\Form\EquipmentType', $equipment);
        $editForm->handleRequest($request);
        $models = $em->getRepository('AppBundle:Model')->findAll();
        $types = $em->getRepository('AppBundle:Type')->findAll();
        $brands = $em->getRepository('AppBundle:Brand')->findAll();

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            try{
                $this->getDoctrine()->getManager()->flush();
                $this->addFlash(
                    'notice',
                    'Sus datos han sido guardados satisfactoriamente.'
                );

            }catch (UniqueConstraintViolationException $exception){
                $this->addFlash(
                    'error',
                    'El número de inventario o número de serie, ya existe.'
                );
            }

            return $this->redirectToRoute('equipment_index');
        }

        return $this->render('equipment/edit.html.twig', array(
            'equipment' => $equipment,
            'edit_form' => $editForm->createView(),
            'types' => $types,
            'brands' => $brands,
            'models' => $models,
        ));
    }

    /**
     * Deletes a equipment entity.
     *
     * @Route("/{id}/delete", name="equipment_delete")
     */
    public function deleteAction(Equipment $equipment)
    {
        $em = $this->getDoctrine()->getManager();
        $em->remove($equipment);
        $em->flush();
        $this->addFlash(
            'notice',
            'El equipo fue eliminado satisfactoriamente'
        );

        return $this->redirectToRoute('equipment_index');
    }
}
