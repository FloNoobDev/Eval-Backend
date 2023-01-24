<?php

namespace App\Controller;

use App\Repository\ProductRepository;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

#[Route('/', name: 'home')]
class HomeController extends AbstractController
{
    private ProductRepository $productRepository;

    public function __construct(
        ProductRepository $productRepository,
    )
    {
        $this->productRepository = $productRepository;
    }
    
    #[Route('/', name: '')]
    public function index(): Response
    {
        return $this->render('home/index.html.twig', [
            'products' => $this->productRepository->findBy([],['created_at'=>'DESC'],15),
        ]);
    }
}