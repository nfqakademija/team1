import React, { useReducer } from "react";
import OrderContext from "./orderContext";
import OrderReducer from "./orderReducer";
import {
  GET_MODELS,
  GET_MAKES,
  CREATE_ORDER,
  CALC_PRICE,
  ADD_SERVICE,
  REMOVE_SERVICE
} from "../types";

const OrderState = props => {
  const initialState = {
    order: {},
    selectedServices: [],
    price: 0
  };

  const [state, dispatch] = useReducer(OrderReducer, initialState);

  //Submit Order
  const submitOrder = async () => {
    console.log("Submit Order");
  };

  //Add service to selected
  const addService = service => {
    dispatch({ type: ADD_SERVICE, payload: service });
  };
  //Remove service from selected
  const removeService = service => {
    dispatch({ type: REMOVE_SERVICE, payload: service });
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
