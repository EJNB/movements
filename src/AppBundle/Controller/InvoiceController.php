<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Invoice;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Method;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\DBAL\Exception\ForeignKeyConstraintViolationException;

/**
 * Invoice controller.
 *
 * @Route("invoice")
 */
class InvoiceController extends Controller
{
    /**
     * Lists all invoice entities.
     *
     * @Route("/", name="invoice_index")
     * @Method({"GET","POST"})
     */
    public function indexAction(Request $request)
    {
        $invoice = new Invoice();
        $form = $this->createForm('AppBundle\Form\InvoiceType', $invoice);
        $form->handleRequest($request);
        $em = $this->getDoctrine()->getManager();
        $paginator  = $this->get('knp_paginator');

//        $invoices = $em->getRepository('AppBundle:Invoice')->findAll();

        if ($form->isSubmitted() && $form->isValid()) {

            //save invoice scan
            $file = $invoice->getDocument();
            if($file){//si viene algun documento (pdf,doc o jpg o png)
                $fileName = $file->getClientOriginalName()/*.'.'.$file->guessExtension()*/;
                $file->move(
                    $this->getParameter('file_directory_scan_invoices'),
                    $fileName
                );
                $invoice->setDocument($fileName);
            }

            $em->persist($invoice);
            $em->flush();

            $this->addFlash(
                'notice',
                'La factura ha sido guardada satisfactoriamente'
            );

            return $this->redirectToRoute('invoice_index');
        }

        $invoices = $em->getRepository('AppBundle:Invoice')->getAllInvoicesOrderedByDate();
        $pagination = $paginator->paginate(
            $invoices, /* query NOT result */
            $request->query->getInt('page', 1)/*page number*/,
            15/*limit per page*/
        );

        return $this->render('invoice/index.html.twig', array(
            'pagination' => $pagination,
            'invoice' => $invoice,
            'form' => $form->createView(),
        ));
    }

    /**
     * Finds and displays a invoice entity.
     *
     * @Route("/{id}", name="invoice_show")
     * @Method("GET")
     */
    public function showAction(Invoice $invoice)
    {
        $deleteForm = $this->createDeleteForm($invoice);

        return $this->render('invoice/show.html.twig', array(
            'invoice' => $invoice,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing invoice entity.
     *
     * @Route("/edit/{id}", name="invoice_edit")
     * @Method({"GET", "POST"})
     */
    public function editAction(Request $request, Invoice $invoice)
    {
        $editForm = $this->createForm('AppBundle\Form\InvoiceType', $invoice);
        $editForm->handleRequest($request);

        if ($editForm->isSubmitted() && $editForm->isValid()) {
            $this->getDoctrine()->getManager()->flush();


            $this->addFlash(
                'notice',
                'La factura ha sido guardada satisfactoriamente'
            );

            return $this->redirectToRoute('invoice_index');
        }

        return $this->render('invoice/edit.html.twig', array(
            'invoice' => $invoice,
            'edit_form' => $editForm->createView(),
        ));
    }

    /**
     * Deletes a invoice entity.
     *
     * @Route("/delete/{id}", name="invoice_delete")
     */
    public function deleteAction(Request $request, Invoice $invoice)
    {
        $em = $this->getDoctrine()->getManager();
        try{
            $em->remove($invoice);
            $em->flush();
            $this->addFlash(
                'notice',
                'La factura fue eliminada satisfactoriamente'
            );
        }catch (ForeignKeyConstraintViolationException $exception){
            $this->addFlash(
                'error',
                'La factura no puede ser eliminada. Tiene equipos asociados'
            );
        }

        return $this->redirectToRoute('invoice_index');
    }

    /**
     * Upload scan invoice entity.
     *
     * @Route("/upload_scan_invoice/{id}", name="upload_scan_invoice")
     */
    public function uploadFileAction(Request $request, Invoice $invoice){

        $em = $this->getDoctrine()->getManager();
        $file = $request->files->get('invoice_attachment');//obtengo el archivo

        if($file){//si viene algun documento (pdf,doc o jpg o png)
            $fileName = $file->getClientOriginalName()/*.'.'.$file->guessExtension()*/;
            $file->move(
                $this->getParameter('file_directory_scan_invoices'),
                $fileName
            );
            $invoice->setDocument($fileName);
        }

        $em->persist($invoice);
        $em->flush();

        $this->addFlash(
            'notice',
            'La factura ha sido guardada satisfactoriamente'
        );

        return $this->redirectToRoute('invoice_index');
    }
}
