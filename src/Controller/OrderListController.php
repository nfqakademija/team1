<?php

namespace App\Controller;

use App\Entity\Order;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

class OrderListController extends AbstractController
{
    /**
     * @Route("/orderList", name="order_list")
     */
    public function getAllOrders()
    {
        $orders = $this->getDoctrine()
            ->getRepository(Order::class)
            ->findAll();
        if (!$orders) {
            return $this->json(['error' => 'No orders could be found.'], 404);
        }

        $orders_arr = [];
        foreach ($orders as $order) {
            $orders_arr[] = [
                'id' => $order->getIdOrder(),
                'price' => $order->getPriceTotal(),
                'comment' => $order->getComment(),
                'orderVehicle' => $order->getFkOrderVehicleData(),
                'user' => $order->getFkUser(),
                'service' => $order->getFkService(),
            ];
        }

        return $this->json(['orders' => $orders_arr], 200);
    }
    /**
     * @Route("/orderList/{order_id}", name="orderList", methods={"GET"})
     */
    public function getVehicleModelsByMake(int $order_id)
    {
        $order = $this->getDoctrine()
            ->getRepository(Order::class)
            ->find($order_id);
        if (!$order) {
            return $this->json(['error' => 'No order with that id could be found.'], 404);
        }

        $orders_arr = [];

        $orders_arr[] = [
            'id' => $order->getIdOrder(),
            'price' => $order->getPriceTotal(),
            'comment' => $order->getComment(),
            'orderVehicle' => $order->getFkOrderVehicleData(),
            'user' => $order->getFkUser(),
            'service' => $order->getFkService(),
        ];


        return $this->json(['order' => $orders_arr], 200);
    }
}
