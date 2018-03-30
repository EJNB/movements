<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Brand;
use AppBundle\Form\BrandType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;

/**
 * Brand controller.
 *
 * @Route("brand")
 */
class BrandController extends Controller
{
    /**
     * Lists all brand entities.
     *
     * @Route("/", options={"expose"=true}, name="brand_index")
     * @Method({"GET", "POST"})
     */
    public function indexAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();
        if ($request->isXmlHttpRequest()){

            $brands = $em->getRepository('AppBundle:Brand')->findByType(array(
                'type' => $request->request->get('type')
            ));

            return $this->render('layouts/include/brands.html.twig', array(
                'brands' => $brands,
            ));

        }else{

            $brand = new Brand();
            $form = $this->createForm(BrandType::class,$brand);
            $form->handleRequest($request);

            $brands = $em->getRepository('AppBundle:Brand')->getAllBrandsOrderedByType();

            if ($form->isSubmitted() && $form->isValid()) {
                $em->persist($brand);
                $em->flush();

                $this->addFlash(
                    'notice',
                    'Sus datos han sido guardados satisfactoriamente'
                );

                return $this->redirectToRoute('brand_index');
            }

            return $this->render('brand/index.html.twig', array(
                'brands' => $brands,
                'form' => $form->createView(),
            ));
        }
    }

    /**
     * Displays a form to edit an existing brand entity.
     *
     * @Route("/{id}/edit", name="brand_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, Brand $brand)
    {
        $editForm = $this->createForm('AppBundle\Form\BrandType', $brand);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('brand_index');
        }

        return $this->render('brand/edit.html.twig', array(
            'brand' => $brand,
            'edit_form' => $editForm->createView(),
        ));
    }

    /**
     * Deletes a brand entity.
     *
     * @Route("/{id}/delete", name="brand_delete")
     */
    public function deleteAction(Brand $brand)
    {
        $em = $this->getDoctrine()->getManager();
        $em->remove($brand);
        $em->flush();

        return $this->redirectToRoute('brand_index');
    }
}
