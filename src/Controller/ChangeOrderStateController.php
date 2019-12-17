<?php

namespace App\Controller;

use App\Entity\Order;
use App\Entity\OrderState;
use mysql_xdevapi\Statement;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class ChangeOrderStateController extends AbstractController
{
    /**
     * @Route("/changeOrderState", name="change_order_state", methods={"POST"})
     * @param Request $request
     * @return Response
     */
    public function index(Request $request)
    {
        $content = $request->request->all();
        $id=$content['orderId'];
        $orderState =$this->getDoctrine()->getRepository(OrderState::class)->findOneBy(array('fkOrder' =>$id));
        $state=$orderState->getState();
        var_dump($state);

        if($state === "OPEN"){
            $this->ChangeStateFromOpenToProcessed($orderState);
            $response = $this->json(['message' => 'Order state has been changed to PROCESSED'], Response::HTTP_OK);
        }
        else if($state === "PROCESSED"){
            $this->ChangeStateFromProcessedToFinished($orderState);
            $response = $this->json(['message' => 'Order state has been changed to PROCESSED'], Response::HTTP_OK);
        }
        else{
            $response = $this->json(['message' => 'Cannot modify this state anymore!'], Response::HTTP_OK);
        }
        return $response;
    }

    public function ChangeStateFromOpenToProcessed($orderState){
        $em = $this->getDoctrine()->getManager();
        $orderState->setState("PROCESSED");
        $em->flush();
    }
    public function ChangeStateFromProcessedToFinished($orderState){
        $em = $this->getDoctrine()->getManager();
        $orderState->setState("FINISHED");
        $em->flush();
    }
}
