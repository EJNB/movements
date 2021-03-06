<?php

namespace AppBundle\Form;

use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class DistributionEType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('hotel',EntityType::class,array(
                'class' => 'AppBundle\Entity\Hotel',
                'label' => false,
                'attr' => array(
                    'class' => 'selectpicker form-control',
                    'data-live-search' => true,
                    'data-size' => 10
                ),
                'placeholder' => 'Seleccione la entidad'
            ))
            ->add('requestDate',DateTimeType::class,array(
                'widget' => 'single_text',
                'required' => true,
                'input' => 'datetime',
                'attr' => array('class' => 'form-control')
            ))
        ;
    }/**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\DistributionE'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_distributione';
    }


}
