<?php

namespace AppBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\FormEvent;
use Symfony\Component\Form\FormEvents;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;

class UserType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('email',EmailType::class,array('attr' => array('class' => 'form-control')))
            ->add('username',TextType::class,array('attr' => array('class' => 'form-control')))
            ->addEventListener(FormEvents::PRE_SET_DATA,function(FormEvent $event){
                $user = $event->getData();//Returns the data associated with this event.
                $form = $event->getForm();//Returns the form at the source of the event.
                // check if the Person object is "new", If no data is passed to the form, the data is "null".
                // This should be considered a new "Person"
                if(!$user || null===$user->getId()){
                    $form
                        ->add('password'/*,PasswordType::class,array('attr' => array('class' => 'form-control'))*/)
                        ->add('password',RepeatedType::class,array(
                            'type' => PasswordType::class,
                            'invalid_message' => 'Sus contraseñas no coinciden',
                            'required' => true,
                            'first_options' => array('label' => 'Contraseña'),
                            'second_options' => array('label' => 'Repita la contraseña')
                        ));
                }
            })
            ->add('name',TextType::class,array('attr' => array('class' => 'form-control')))
            ->add('occupation',TextType::class,array('attr' => array('class' => 'form-control')))
            ->add('isActive')
            ->add('roles',EntityType::class,array(
                'class' => 'AppBundle\Entity\Role',
                'expanded' => true,
                'multiple' => true,
                'required' => true,
                'attr' => array(
                    'class' => 'switch'
                )
            ));
    }/**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\User'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_user';
    }
}
