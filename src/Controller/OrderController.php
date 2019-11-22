<?php

namespace App\Controller;



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
use App\Entity\Category;
use App\Entity\User;

class OrderController extends AbstractController
{


    /**
     * @Route("/order", name="order")
     * @param Request $request
     * @return Response
     */
    public function submit(Request $request)
    {

        $message = "order failed";
        $validator = Validation::createValidator();

        //$content=trim(file_get_contents("php://input"));
        //$input = json_decode($content, true);

        $input = json_decode($request->getContent(),true);

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
            $user=new User();
            $user=$this->getDoctrine()->getRepository(User::class)->find(1);

            $vehicleMake = $this->getDoctrine()->getRepository(VehicleMake::class)->findOneBy(['make' => $input['make']]);
            $vehicleModel = $this->getDoctrine()->getRepository(VehicleModel::class) ->findOneBy(['model' => $input['model']]);

            $orderVehicle->setYear($input['year']);
            $orderVehicle->setPower($input['power']);
            $orderVehicle->setDisplacement($input['year']);
            $orderVehicle->setEcuModel($input['ecu']);
            $orderVehicle->setFkVehicleModel($vehicleModel);
            $em->persist($orderVehicle);

            $em->flush();

            $order->setPriceTotal($input['price']);
            $order->setComment($input['comment']) ;
            $order->setFkOrderVehicleData($orderVehicle);
            $order->setFkUser($user);
            $em->persist($order);

            $em->flush();

            $orderState->setState('nemodifikuotas');
            $orderState->setFkOrder($order);
            $em->persist($orderState);

            $em->flush();

            $message="order successful";

        }

        return $this->render('order/index.html.twig', [
            'message' => $message
        ]);
    }

}
