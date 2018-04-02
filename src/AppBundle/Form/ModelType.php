<?php

namespace AppBundle\Form;

use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
class ModelType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('brand',EntityType::class,array(
                'class' => 'AppBundle:Brand',
                'placeholder' => 'Seleccione la marca',
                'attr' => array(
                    'class' => 'selectpicker form-control',
                    'data-live-search' => true,
                    'data-size' => 10,
                    'width' => 'auto'
                ),
                'label' => false,
                'group_by' =>  function($val, $key, $index) {
                    return $val->getType();
                },
            ))
            ->add('name',TextType::class,array(
                'attr' => array(
                    'class' => 'form-control',
                    'placeholder' => 'Introdusca el modelo'
                ),
                'label' => false
            ))
        ;
    }

    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\Model'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_model';
    }


}
