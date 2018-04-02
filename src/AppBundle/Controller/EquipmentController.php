<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Equipment;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;

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
                $em->flush();
            }

            $this->addFlash(
                'notice',
                'Sus datos han sido guardados con exito'
            );

            return $this->redirectToRoute('equipment_index');
//            dump($request->request->get('ni')[2]);
//            dump($request->request->get('ns')[2]);
//            dump($request->request->get('cantidad'));
//            foreach ($request->request->get('ni') as $equipmentTest){

//            }
//

//            return $this->redirectToRoute('equipment_show', array('id' => $equipment->getId()));
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
     * Finds and displays a equipment entity.
     *
     * @Route("/{id}", name="equipment_show")
     * @Method("GET")
     */
    public function showAction(Equipment $equipment)
    {
        $deleteForm = $this->createDeleteForm($equipment);

        return $this->render('equipment/show.html.twig', array(
            'equipment' => $equipment,
            'delete_form' => $deleteForm->createView(),
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

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $em->flush();
            $this->addFlash(
                'notice',
                'Sus cambios han sido guardados satisfactoriamente'
            );

            return $this->redirectToRoute('equipment_index');
        }

        return $this->render('equipment/edit.html.twig', array(
            'equipment' => $equipment,
            'edit_form' => $editForm->createView(),
            'models' => $models,
        ));
    }

    /**
     * Deletes a equipment entity.
     *
     * @Route("/{id}", name="equipment_delete")
     * @Method("DELETE")
     */
    public function deleteAction(Request $request, Equipment $equipment)
    {
        $form = $this->createDeleteForm($equipment);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->remove($equipment);
            $em->flush();
        }

        return $this->redirectToRoute('equipment_index');
    }

    /**
     * Creates a form to delete a equipment entity.
     *
     * @param Equipment $equipment The equipment entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm(Equipment $equipment)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('equipment_delete', array('id' => $equipment->getId())))
            ->setMethod('DELETE')
            ->getForm()
        ;
    }
}
