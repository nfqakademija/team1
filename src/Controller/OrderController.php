<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validation;
use App\Entity\Order;
use App\Entity\OrderState;
use App\Entity\OrderVehicleData;
use App\Entity\VehicleMake;
use App\Entity\VehicleModel;

class OrderController extends AbstractController
{
    /**
     * @Route("/order", name="order")
     */
    public function index(Request $request)
    {
        $validator = Validation::createValidator();

        $content=trim(file_get_contents("php://input"));
        $input = json_decode($content, true);

        $constraint = new Assert\Collection([
            // the keys correspond to the keys in the input array
            'price' => new Assert\Type('float'),
            'year' => new Assert\Type('int'),
            'make' => [
                new Assert\Length(['max' => 45]),
                new Assert\Length(['min' => 10])
            ],
            'model' => [
                new Assert\Length(['max' => 45]),
                new Assert\Type('string')
            ],
            'power' => new Assert\Type('int'),
            'gearbox-type' => new Assert\Type('string'),
            'displacement' => new Assert\Type('int'),
            'ecu' => [
                new Assert\Length(['max' => 75]),
                new Assert\Type('string')
            ],
            'comment' => new Assert\Type('string'),
        ]);

        $violations = $validator->validate($input, $constraint);

        if (0 !== count($violations)) {
            // there are errors, now you can show them
            foreach ($violations as $violation) {
                echo $violation->getMessage().'<br>';
            }
        }
        else{

            $em = $this->getDoctrine()->getManager();
            $order = new Order();
            $orderVehicle = new OrderVehicleData();
            $orderState = new OrderState();
            $vehicleMake = new VehicleMake();
            $vehicleModel = new VehicleModel();
            $order->setPriceTotal($input['price']);
            $order->setComment($input['comment']);
            $order->setFkOrderVehicleData($orderVehicle->getIdOrderVehicleData());
            $orderState->setState('Unmodified');
            $orderState->setFkOrder($order->getIdOrder());
            $orderVehicle->setYear($input['year']);
            $orderVehicle->setPower($input['power']);
            $orderVehicle->setDisplacement($input['displacement']);
            $orderVehicle->setEcuModel($input['ecu']);
            $vehicleModel->setModel($input['model']);
            $vehicleMake->setMake($input['make']);

            $em->persist($vehicleMake);
            $em->persist($vehicleModel);
            $em->persist($orderVehicle);
            $em->persist($order);
            $em->persist($orderState);

            $em->flush();
        }


        return $this->render('order/index.html.twig', [
            'controller_name' => $violations,
        ]);
    }
}
