<?php

namespace AppBundle\Form;

use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class DistributionIType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('persons',EntityType::class,array(
            'class' => 'AppBundle\Entity\Person',
            'attr' => array(
                'class' => 'form-control selectpicker',
                'data-live-search' => true,
//                'data-max-options' => 2,
//                'data-max-options-text' => 'No quedan mas equipos para distribuir',
                'title' => 'Seleccione las personas'
//                'onchange' => 'addPersonToDistribution(this)',
            ),
            'placeholder' => 'Seleccione las personas',
            'multiple' => true,
        ));
    }/**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\DistributionI'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_distributioni';
    }


}
