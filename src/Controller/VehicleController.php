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
        if (!$makes) {
            return $this->json(['error' => 'No makes could be found.'], 404);
        }

        $makes_arr = [];
        foreach ($makes as $make) {
            $makes_arr[] = [
                'id' => $make->getIdVehicleMake(),
                'make' => $make->getMake(),
            ];
        }

        return $this->json(['makes' => $makes_arr], 200);
    }

    /**
     * @Route("/vehicle/{make_id}", name="vehicleModels", methods={"GET"})
     */
    public function getVehicleModelsByMake(int $make_id)
    {
        $models = $this->getDoctrine()
            ->getRepository(VehicleModel::class)
            ->findBy(['fkVehicleMake' => $make_id]);

        if (!$models) {
            return $this->json(['error' => 'No models could be found by this make.', 404]);
        }

        $models_arr = [];
        foreach ($models as $model) {
            $models_arr[] = [
                'id' => $model->getIdVehicleModel(),
                'model' => $model->getModel(),
            ];
        }

        return $this->json(['models' => $models_arr], 200);
    }
}
