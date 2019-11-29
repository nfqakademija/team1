<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Category;
use App\Entity\Service;

class ServiceListController extends AbstractController
{
    /**
     * @Route("/categoryAndServiceList", name="service_list")
     */
    public function getCategoryAndServiceList()
    {

        $categories = $this->getDoctrine()
            ->getRepository(Category::class)
            ->findAll();
        if (!$categories) {

            return $this->json(['error' => 'No categories could be found.'], Response::HTTP_NOT_FOUND);
        }

        $category_arr = [];
        foreach ($categories as $category) {

            $services = $this->getDoctrine()
                ->getRepository(Service::class)
                ->findBy(['fkCategory' => $category->getIdCategory()]);

            if (!$services) {

                return $this->json(['error' => 'No services could be found', Response::HTTP_NOT_FOUND]);
            }

            $service_arr = [];
            foreach ($services as $service) {
                $service_arr[] = [
                    'id' => $service->getIdService(),
                    'name' => $service->getName(),
                    'price' => $service->getPrice(),
                    'description' => $service->getDescription(),
                ];
            }

            $category_arr[] = [
                'id' => $category->getIdCategory(),
                'name' => $category->getName(),
                'picture' => $category->getPicture(),
                'summary' => $category->getSummary(),
                'services' => $service_arr,
            ];

        }

        return $this->json(['categories' => $category_arr], Response::HTTP_OK);
    }
}
