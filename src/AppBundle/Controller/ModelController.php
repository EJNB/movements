<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Model;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;use Symfony\Component\HttpFoundation\Request;

/**
 * Model controller.
 *
 * @Route("model")
 */
class ModelController extends Controller
{
    /**
     * Lists all model entities.
     *
     * @Route("/", options={"expose"=true}, name="model_index")
     * @Method({"GET","POST"})
     */
    public function indexAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();

        if ($request->isXmlHttpRequest()){
            $models = $em->getRepository('AppBundle:Model')->findByBrand(array(
                'brand' => $request->request->get('brand')
            ));

            return $this->render('layouts/include/models.html.twig', array(
                'models' => $models,
            ));

        }else{
            $model = new Model();
            $form = $this->createForm('AppBundle\Form\ModelType', $model);
            $form->handleRequest($request);

            $models = $em->getRepository('AppBundle:Model')->findAll();

            if ($form->isSubmitted() && $form->isValid()) {
                $em->persist($model);
                $em->flush();

                $this->addFlash(
                    'notice',
                    'Sus datos han sido guardados satisfactoriamente'
                );

                return $this->redirectToRoute('model_index');
            }

            return $this->render('model/index.html.twig', array(
                'models' => $models,
                'form'  => $form->createView(),
            ));
        }

    }

    /**
     * Creates a new model entity.
     *
     * @Route("/new", name="model_new")
     * @Method({"GET", "POST"})
     */
    public function newAction(Request $request)
    {
        $model = new Model();
        $form = $this->createForm('AppBundle\Form\ModelType', $model);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($model);
            $em->flush();

            return $this->redirectToRoute('model_show', array('id' => $model->getId()));
        }

        return $this->render('model/new.html.twig', array(
            'model' => $model,
            'form' => $form->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing model entity.
     *
     * @Route("/{id}/edit", name="model_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, Model $model)
    {
        $editForm = $this->createForm('AppBundle\Form\ModelType', $model);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            return $this->redirectToRoute('model_index');
        }

        return $this->render('model/edit.html.twig', array(
            'model' => $model,
            'edit_form' => $editForm->createView(),
        ));
    }

    /**
     * Deletes a model entity.
     *
     * @Route("/{id}/delete", name="model_delete")
     */
    public function deleteAction(Request $request, Model $model)
    {
        $em = $this->getDoctrine()->getManager();
        $em->remove($model);
        $em->flush();

        return $this->redirectToRoute('model_index');
    }
}
