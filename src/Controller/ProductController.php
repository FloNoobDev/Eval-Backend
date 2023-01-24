<?php

namespace App\Controller;

use App\Entity\Product;
use App\Form\ProductType;
use App\Form\ProductBookType;
use App\Repository\ProductRepository;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

#[Route('/product', name: 'product')]
class ProductController extends AbstractController
{
    private ProductRepository $productRepository;
    private ManagerRegistry $managerRegistry;

    public function __construct(
        ProductRepository $productRepository,
        ManagerRegistry $managerRegistry,
    )
    {
        $this->productRepository = $productRepository;
        $this->managerRegistry = $managerRegistry;
    }

    #[Route('/', name: '')]
    public function index(): Response
    {
        return $this->render('product/index.html.twig', [
            'products' => $this->productRepository->findAll(),
        ]);
    }

    #[Route('/detail/{id}', name: '-detail')]
    public function detail(Request $request,Product $product): Response
    {
        $form = $this->createForm(ProductBookType::class, $product);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            
        }

        return $this->render('product/detail.html.twig', [
            'product' => $product,
            'form' => $product->getReservationText() === '' ? $form->createView() : null ,
        ]);    
    }

    #[Route('/create', name: '-create')]
    public function create(Request $request): Response
    {
        $product = new Product();
        $form = $this->createForm(ProductType::class, $product);
        $form->handleRequest($request);


        if($form->isSubmitted()&& $form->isValid()){

            $imgData = $form['image']->getData();

            if(!empty($imgData)){
                $imgName = time() . '.' . $imgData->guessExtension();
                $imgData->move('img/product/', $imgName);
                $product->setImage($imgName);
            }

            $product->setReservationText('');
            $product->setCreatedAt(new \DateTimeImmutable());

            $mngr = $this->managerRegistry->getManager();
            $mngr->persist($product);
            $mngr->flush();

            return $this->redirectToRoute('product');
        }


        return $this->render('product/form.add.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}