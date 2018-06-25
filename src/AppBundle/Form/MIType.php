<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

class MIType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('date', DateTimeType::class,array(
                'widget' => 'single_text',
                'required' => true,
                'input' => 'datetime',
                'attr' => array('class' => 'form-control')
            ))
            ->add('description')
            ->add('person',EntityType::class,array(
                'class' => 'AppBundle\Entity\Person',
                'attr' => array(
                    'class' => 'form-control selectpicker',
                    'data-live-search' => true,
                    'data-size' => 10,
                    //poner el cargo en subtext
                    //esto es una funcion pra cuando seleccione la persona se seleccionen los equipos asignados previamente
        //            'onchange' => 'selectEquipmentByDistributionPerHotel(this.value)'
                ),
                'placeholder' => 'Seleccione la persona'
            ))
//            ->add('equipments',Entity)//ver si puedo ya poner los equipos seleccionados a la hora de editarlos
        ;
    }/**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\MI'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_mi';
    }


}
