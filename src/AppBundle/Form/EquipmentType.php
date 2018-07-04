<?php

namespace AppBundle\Form;

use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\OptionsResolver\OptionsResolver;

class EquipmentType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('description',TextType::class,array(
                'attr' => array( 'class' => 'form-control'),
                'required' => false
            ))
            ->add('createAt', DateTimeType::class,array(
//                'label' => 'Introducido en',
                'widget' => 'single_text',
                'required' => true,
                'input' => 'datetime',
                'attr' => array('class' => 'form-control')
            ))
            ->add('invoice',EntityType::class,array(
                'class' => 'AppBundle\Entity\Invoice',
                'attr' => array(
                    'class' => 'form-control selectpicker',
                    'data-live-search' => true,
                ),
                'placeholder' => 'Seleccione la factura',
                'choice_attr' => function($val, $key, $index){
                    return [
                        'data-subtext' => strtolower($val->getDocument())
                    ];
                },
            ))
        ;
//            ->add('ni',TextType::class,array(
//                'attr' => array( 'class' => 'form-control')
//            ))
//            ->add('ns',IntegerType::class,array(
//                'attr' => array( 'class' => 'form-control')
//            ))

//            ->add('model')
//            ->add('distribution')
//            ->add('movement')
        //esto lo hice para q no se mostrara el campo de ns y ni en el new
        $builder->addEventListener(FormEvents::PRE_SET_DATA,function (FormEvent $event){
            $equipment = $event->getData();//Returns the data associated with this event.
            $form = $event->getForm();//Returns the form at the source of the event.
            // This should be considered a new "Equipment"
            if(!$equipment || null!==$equipment->getId()){
                $form
                    ->add('ni', TextType::class,array(
                        'attr' => array('class' => 'form-control')
                    ))
                    ->add('ns', TextType::class,array(
                        'attr' => array('class' => 'form-control')
                    ));
            }
        });
    }/**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Equipment'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_equipment';
    }


}
