import React, { Fragment } from "react";
import CardGrid from "../services/CardGrid";
import OrderForm from "../orders/OrderForm";

const Services = () => {
  return (
    <div>
      <CardGrid />
      <div className="grid-2 my-2">
        <div>
          <OrderForm />
        </div>
        <div></div>
      </div>
    </div>
  );
};

export default Services;
