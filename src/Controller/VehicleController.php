<?php

namespace App\Controller;

use App\Entity\VehicleMake;
use App\Entity\VehicleModel;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

class VehicleController extends AbstractController
{
    /**
     * @Route("/vehicle", name="vehicleMakes", methods={"GET"})
     */
    public function getVehicleMakes()
    {
        $makes = $this->getDoctrine()
            ->getRepository(VehicleMake::class)
            ->findAll();
        if(!$makes)
        {
            $response = new JsonResponse(['error' => 'No makes could be found.']);

            $response->setStatusCode(404);
            return $response;
        }

        $makesArr = [];
        foreach($makes as $make)
        {
            $makesArr[] = [
                'id' => $make->getIdVehicleMake(),
                'make' => $make->getMake(),
            ];
        }

        $response = [
            'makes' => $makesArr,
        ];

        return new JsonResponse($response);
    }

    /**
     * @Route("/vehicle/{make_id}", name="vehicleModels", methods={"GET"})
     */
    public function getVehicleModelsByMake(int $make_id)
    {
        $models = $this->getDoctrine()
            ->getRepository(VehicleModel::class)
            ->findBy(['fkVehicleMake' => $make_id]);

        if(!$models)
        {
            $response = new JsonResponse(['error' => 'No models could be found by this make.']);

            $response->setStatusCode(404);
            return $response;
        }

        $modelsArr = [];
        foreach($models as $model)
        {
            $modelsArr[] = [
                'id' => $model->getIdVehicleModel(),
                'model' => $model->getModel(),
            ];
        }

        $response = [
            'models' => $modelsArr,
        ];

        return new JsonResponse($response);

    }
}
