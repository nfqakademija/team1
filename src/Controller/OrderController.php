<?php

namespace App\Controller;

use App\Entity\Service;
use App\Entity\VehicleEcuFile;
use App\Service\FileUploader;
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

        $content = $request->getContent();
        $content = json_decode($content, true);

        $violations = $this->validate($content);

        if (0 !== count($violations)) {
            $response = $this->json($violations, Response::HTTP_EXPECTATION_FAILED);
        }
        else {

            if($this->handleOrder($content)){

                $response = $this->json(['message' => 'Success!'], Response::HTTP_OK);
            } else {
                $response = $this->json(['message' => 'File upload failed.'], Response::HTTP_EXPECTATION_FAILED);
            }
        }
        return $response;
    }

    private function validate(array $input)
    {

        $validator = Validation::createValidator();

        $constraint = new Assert\Collection([
            // the keys correspond to the keys in the input array
            'services' => new Assert\Type('array'),
            'year' => new Assert\Type('int'),
            'make' => [
                new Assert\Length(['max' => 50]),
                new Assert\Length(['min' => 1])
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

        /*
        $fileHash = $this->handleFileUpload($input['file']);

        if($fileHash === null)
        {
            return false;
        }
        $file = new VehicleEcuFile();
        $file->setFilename($input['file']['name']);
        $file->setHash($fileHash);
        $file->setType('TYPE_NEW');
        $file->addFkOrder($order);

        $order->addFkVehicleEcuFile($file);
        */

        //$em->persist($file);

        $em->persist($order);

        $orderState->setState('OPEN');

        $orderState->setFkOrder($order);

        $em->persist($orderState);


        try {
            $em->flush();
        } catch (\Exception $e) {
            print $e->getMessage();
        }

        return true;
    }

    private function handleFileUpload($file, FileUploader $fileUploader)
    {
        if($file)
        {
            $file_name = $file['name'];
            $file_ext=strtolower(end(explode('.',$file['name'])));

            $extensions= array("zip");

            if($file_name === null || $file_name == '')
            {
                return null;
            }

            if(in_array($file_ext,$extensions)=== false){
                return null;
            }

            $hash = $fileUploader->upload($file);

            if($hash != null)
            {
                return $hash;
            }

            return $hash;
        }
    }

}
