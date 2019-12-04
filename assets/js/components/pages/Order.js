import React from "react";
import CardGrid from "../services/CardGrid";
import OrderForm from "../orders/OrderForm";
import OrderSum from "../orders/OrderSum";

const Order = () => {
  return (
    <div className="container">
      <CardGrid />
      <div className="grid-2 my-3">
        <div>
          <OrderForm />
        </div>
        <div className="my-3">
          <OrderSum />
        </div>
      </div>
    </div>
  );
};

export default Order;
