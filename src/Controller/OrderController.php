<?php

namespace App\Controller;

use App\Entity\Service;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Validator\Validation;
use App\Entity\Order;
use App\Entity\OrderState;
use App\Entity\OrderVehicleData;
use App\Entity\VehicleMake;
use App\Entity\VehicleModel;
use App\Entity\User;

class OrderController extends AbstractController
{

    /**
     * @Route("/orderView", name="order")
     */
    public function index()
    {
        return $this->render('order/index.html.twig', [
            'someVariable' => 'Ordering Page',
        ]);
    }
    /**
     * @param Request $request
     * @return Response
     */
    public function submit(Request $request)
    {
        die("dead");
        $content = $request->request->all();
        $violations = $this->validate($content);

        if (0 !== count($violations)) {
            $response = $this->json($violations, Response::HTTP_EXPECTATION_FAILED);
        } else {
            $this->handleOrder($content);
            $response = $this->json(['message' => 'Success!'], Response::HTTP_OK);
        }
        return $response;
    }

    private function validate(array $input): array
    {

        $validator = Validation::createValidator();
        $constraint = new Assert\Collection([
            // the keys correspond to the keys in the input array
            'services' => new Assert\Type('array'),
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

        return $violations;
    }

    private function handleOrder(array $input)
    {
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');
        $em = $this->getDoctrine()->getManager();
        $order = new Order();
        $orderVehicle = new OrderVehicleData();
        $orderState = new OrderState();
        $repo = $this->getDoctrine()->getRepository(Service::class);
        $user = $this->getUser();
        //$user = $this->getDoctrine()->getRepository(User::class)->find(1); //encase the line above doesn't work
        $vehicleModel = $this->getDoctrine()->getRepository(VehicleModel::class)->findOneBy(['idVehicleModel' => $input['model']]);


        $priceSum = 0;
        foreach ($input['services'] as $eachService) {

            $found = $repo->find($eachService['id']);
            $priceSum = $priceSum + $found->getPrice();
        }

        $orderVehicle->setYear($input['year']);
        $orderVehicle->setPower($input['power']);
        $orderVehicle->setDisplacement($input['year']);
        $orderVehicle->setEcuModel($input['ecu']);
        $orderVehicle->setFkVehicleModel($vehicleModel);
        $em->persist($orderVehicle);

        $order->setPriceTotal($priceSum);
        $order->setComment($input['comment']);
        $order->setFkOrderVehicleData($orderVehicle);
        $order->setFkUser($user);
        $em->persist($order);

        $orderState->setState('nemodifikuotas');
        $orderState->setFkOrder($order);
        $em->persist($orderState);

        $em->flush();


    }

}
