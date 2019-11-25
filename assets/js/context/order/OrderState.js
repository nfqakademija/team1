import React, { useReducer } from "react";
import axios from "axios";
import OrderContext from "./orderContext";
import orderReducer from "./orderReducer";
import { GET_CATEGORIES, GET_CATEGORY } from "../types";

const OrderState = props => {
  const initialState = {
    order: {},
    selectedServices: [],
    price: ""
  };

  const [state, dispatch] = useReducer(orderReducer, initialState);

  //Submit Order
  const submitOrder = async () => {
    console.log("Submit Order");
  };

  //Add service to selected
  const addService = async id => {
    console.log("Add Service");
  };
  //Remove service from selected
  const removeService = async id => {
    console.log("Add Service");
  };
  //Get makes
  const getMakes = async id => {
    console.log("Add Service");
  };
  //Get models
  const getModels = async id => {
    console.log("Add Service");
  };
  return (
    <OrderContext.Provider
      value={{
        order: state.order,
        selectedServices: state.selectedServices,
        price: state.price,
        submitOrder,
        addService,
        removeService,
        getMakes,
        getModels
      }}
    >
      {props.children}
    </OrderContext.Provider>
  );
};

export default OrderState;
