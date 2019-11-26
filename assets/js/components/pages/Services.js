import React, { Fragment } from "react";
import CardGrid from "../services/CardGrid";
import OrderForm from "../orders/OrderForm";
import OrderSum from "../orders/OrderSum";

const Services = () => {
  return (
    <div>
      <CardGrid />
      <div className="grid-2 my-2">
        <div>
          <OrderForm />
        </div>
        <div>
          <OrderSum />
        </div>
      </div>
    </div>
  );
};

export default Services;
