<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class InvoiceType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('invoiceId',TextType::class,array(
                'attr' => array(
                    'class' => 'form-control',
                    'placeholder' => 'Introduca el No de factura'
                ),
                'required' => true,
                'label'=> false
            ))
            ->add('date',DateTimeType::class,array(
                'label' => false,
                'widget' => 'single_text',
                'required' => true,
                'input' => 'datetime',
//                'format'=> 'YYYY-MM-DD',
                'attr' => array(
                    'class' => 'form-control',
                    'data-container' => 'body',
                    'data-placement' => 'right',
                    'data-content' => 'Por favor introdusca la fecha'
                ),
//                'placeholder'=> 'Por favor introdusca la fecha'
            ))
            ->add('document',FileType::class,array(
                'label' => false,
                'required' => true,
                'data_class' => null,//ver esto mañana,
            ));
    }/**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Invoice'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_invoice';
    }


}
