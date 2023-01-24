<?php

namespace App\Form;

use App\Entity\Product;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\Validator\Constraints\Image;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;

class ProductType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('title', TextType::class, [
                'attr' => [
                    'minLength' => 2,
                    'maxlength' => 50,
                ],
                'help' => 'Minimum 2 caractères - Maximum 50 caractères',
            ]) 
            ->add('description', TextareaType::class, [
                'attr' => [
                    'minLength' => 15,
                    'maxlength' => 3000,
                ],
                'help' => '3000 caractères maximum',
            ])           
            ->add('price', IntegerType::class, [
                'help' => 'En €',
                'attr' => [
                    'min' => 0,
                    'step' => 1
                ]
            ]) 
            ->add('city', TextType::class, [
                'attr' => [
                    'minLength' => 2,
                    'maxlength' => 50,
                ],
                'help' => 'Minimum 2 caractères - Maximum 50 caractères',
            ]) 
            ->add('postal_code', TextType::class, [
                'attr' => [
                    'minLength' => 2,
                    'maxlength' => 15,
                ],
                'help' => 'Minimum 2 caractères - Maximum 15 caractères',
            ]) 


            ->add('image', FileType::class, [
                'required' => false,
                'mapped' => false,
                'help' => 'Image format jpg, jpeg, webp ou png - 1 Mo maximum',
                'constraints' => [
                    new Image([
                        'maxSize' => '1M',
                        'maxSizeMessage' => 'Le fichier est trop volumineux ({{ size }} {{ suffix }}). La taille maximale autorisée est de {{ limit }} {{ suffix }}',
                        'mimeTypes' => [
                            'image/jpg',
                            'image/jpeg',
                            'image/webp',
                            'image/png',
                        ],
                        'mimeTypesMessage' => 'Le type de fichier est invalide ({{ type }}). Les types autorisés sont {{ types }}'
                    ])
                ]
            ])        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Product::class,
        ]);
    }
}
