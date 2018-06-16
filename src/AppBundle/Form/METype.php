<?php

namespace AppBundle\Form;

use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;

class METype extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('date', DateTimeType::class,array(
//                'label' => 'Introducido en',
                'widget' => 'single_text',
                'required' => true,
                'input' => 'datetime',
                'attr' => array('class' => 'form-control')
            ))
            ->add('hotel',EntityType::class,array(
                'class' => 'AppBundle\Entity\Hotel',
                'attr' => array(
                    'class' => 'form-control selectpicker',
                    'data-live-search' => true,
                    'data-size' => 10,
                    'onchange' => 'selectEquipmentByDistributionPerHotel(this.value)'
                ),
                'placeholder' => 'Seleccione el botel'
            ))
            ->add('name', TextType::class,array(
                'attr' => array(
                    'class' => 'form-control',
                ),
            ))
            ->add('ocupation',TextType::class,array('attr' => array('class' => 'form-control')))
            ->add('cI',TextType::class,array('attr' => array('class' => 'form-control')))
            ->add('license',TextType::class,array('attr' => array('class' => 'form-control'),))
            ->add('numberPlate',TextType::class,array('attr' => array('class' => 'form-control')))
        ;
    }/**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\ME'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_me';
    }


}
