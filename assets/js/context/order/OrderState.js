import React, { useReducer } from "react";
import axios from "axios";
import OrderContext from "./orderContext";
import OrderReducer from "./orderReducer";
import {
  GET_MODELS,
  GET_MAKES,
  ADD_SERVICE,
  REMOVE_SERVICE,
  GET_CATEGORIES,
  GET_SERVICES
} from "../types";

const OrderState = props => {
  const initialState = {
    order: {},
    selectedServices: [],
    makes: [],
    models: [],
    price: 0,
    services: [],
    categories: []
  };

  const [state, dispatch] = useReducer(OrderReducer, initialState);

  //Submit Order
  const submitOrder = async orderData => {
    const config = {
      headers: {
        "Content-Type": "application/json"
      }
    };
    orderData.services = state.selectedServices;
    try {
      await axios.post("/order", orderData, config);
    } catch (error) {
      console.log(error.message);
    }
  };
  //Get Categories
  const getCategories = async () => {
    try {
      const res = await axios.get("/categoryAndServiceList");
      dispatch({ type: GET_CATEGORIES, payload: res.data });
    } catch (error) {
      console.log(error.message);
    }
  };
  //Get Services
  const getServices = async categoryID => {
    dispatch({ type: GET_SERVICES, payload: categoryID });
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
  const getMakes = async () => {
    try {
      const res = await axios.get(`/vehicle`);
      dispatch({ type: GET_MAKES, payload: res.data });
    } catch (error) {
      console.log(error.message);
    }
  };
  //Get models
  const getModels = async id => {
    try {
      const res = await axios.get(`/vehicle/${id}`);
      dispatch({ type: GET_MODELS, payload: res.data });
    } catch (error) {
      console.log(error.message);
    }
  };
  return (
    <OrderContext.Provider
      value={{
        order: state.order,
        selectedServices: state.selectedServices,
        price: state.price,
        services: state.services,
        categories: state.categories,
        makes: state.makes,
        models: state.models,
        submitOrder,
        addService,
        removeService,
        getMakes,
        getModels,
        getCategories,
        getServices
      }}
    >
      {props.children}
    </OrderContext.Provider>
  );
};

export default OrderState;
