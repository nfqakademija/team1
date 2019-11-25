import React, { Fragment } from "react";
import CardGrid from "../services/CardGrid";
import OrderForm from "../orders/OrderForm";
import "../App.css";

const Home = () => {
  return (
    <div>
      <CardGrid />
      <div className="grid-2 my-2">
        <OrderForm />
      </div>
    </div>
  );
};

export default Home;
