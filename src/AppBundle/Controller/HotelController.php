<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Hotel;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\DBAL\Exception\ForeignKeyConstraintViolationException;
use Doctrine\DBAL\Exception\UniqueConstraintViolationException;
use Symfony\Component\HttpFoundation\Response;

/**
 * Hotel controller.
 *
 * @Route("hotel")
 */
class HotelController extends Controller
{
    /**
     * Lists all hotel entities.
     *
     * @Route("/", name="hotel_index")
     * @Method({"GET", "POST"})
     */
    public function indexAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();

        $hotels = $em->getRepository('AppBundle:Hotel')->getAllHotelsOrderedByName();
        $hotel = new Hotel();
        $form = $this->createForm('AppBundle\Form\HotelType', $hotel);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();

            try{
                $em->persist($hotel);
                $em->flush();
                $this->addFlash(
                    'notice',
                    'Sus datos han sido guardados satisfactoriamente'
                );

            }catch (UniqueConstraintViolationException $exception){
                $this->addFlash(
                    'error',
                    'El hotel que intenta insertar ya exite en el sistema.'
                );
            }

            return $this->redirectToRoute('hotel_index');
        }

        return $this->render('hotel/index.html.twig', array(
            'hotels' => $hotels,
            'form' => $form->createView()
        ));
    }

    /**
     * Displays a form to edit an existing hotel entity.
     *
     * @Route("/{id}/edit", name="hotel_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, Hotel $hotel)
    {
        $editForm = $this->createForm('AppBundle\Form\HotelType', $hotel);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            try{
                $this->getDoctrine()->getManager()->flush();
                $this->addFlash(
                    'notice',
                    'Sus datos han sido guardados satisfactoriamente.'
                );

            }catch (  UniqueConstraintViolationException $exception){
                $this->addFlash(
                    'error',
                    'El hotel que intenta actualizar, ya existe.'
                );
            }

            return $this->redirectToRoute('hotel_index');
        }

        return $this->render('hotel/edit.html.twig', array(
            'hotel' => $hotel,
            'edit_form' => $editForm->createView(),
        ));
    }

    /**
     * Deletes a hotel entity.
     *
     * @Route("/{id}", name="hotel_delete")
     */
    public function deleteAction( Hotel $hotel)
    {
        $em = $this->getDoctrine()->getManager();
        try{
            $em->remove($hotel);
            $em->flush();
            $this->addFlash(
                'notice',
                'El tipo ha sido eliminado satisfactoriamente.'
            );
        }catch (ForeignKeyConstraintViolationException $exception){
            $this->addFlash(
                'error',
                'El tipo no puede ser eliminado. Tiene marcas asociadas.'
            );
        }


        return $this->redirectToRoute('hotel_index');
    }
}
