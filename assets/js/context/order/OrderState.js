import React, { useReducer } from "react";
import axios from "axios";
import OrderContext from "./orderContext";
import OrderReducer from "./orderReducer";
import {
  GET_MODELS,
  GET_MAKES,
  CREATE_ORDER,
  ADD_SERVICE,
  REMOVE_SERVICE,
  GET_CATEGORIES,
  GET_SERVICES
} from "../types";

const OrderState = props => {
  const initialState = {
    order: {},
    selectedServices: [],
    makes: [
      { id: 1, name: "Audi" },
      { id: 2, name: "BMW" },
      { id: 3, name: "VW" }
    ],
    models: [
      { id: 1, name: "Passat" },
      { id: 2, name: "A6" },
      { id: 3, name: "535D" }
    ],
    price: 0,
    services: [],
    categories: [
      {
        id: 1,
        name: "CategoryA",
        description:
          "Tuning your ECU is a great way to achieve more performance or fuel economy!",
        services: [
          { id: 1, name: "ServiceA", price: 20.21 },
          { id: 2, name: "ServiceB", price: 999.13 },
          { id: 3, name: "ServiceC", price: 9.78 }
        ]
      },
      {
        id: 2,
        name: "CategoryB",
        description:
          "Tuning your ECU is a great way to achieve more performance or fuel economy!",
        services: [
          { id: 4, name: "ServiceA", price: 20.21 },
          { id: 5, name: "ServiceB", price: 999.13 },
          { id: 6, name: "ServiceC", price: 9.78 }
        ]
      },
      {
        id: 3,
        name: "CategoryC",
        description:
          "Tuning your ECU is a great way to achieve more performance or fuel economy!",
        services: [
          { id: 7, name: "ServiceA", price: 20.21 },
          { id: 8, name: "ServiceB", price: 999.13 },
          { id: 9, name: "ServiceC", price: 9.78 }
        ]
      }
    ]
  };

  const [state, dispatch] = useReducer(OrderReducer, initialState);

  //Submit Order
  const submitOrder = async orderData => {
    const config = {
      headers: {
        "Content-Type": "application/json"
      }
    };
    try {
      const res = await axios.post("/api/order", orderData, config);
      //If everything is ok
      /*dispatch({
        type: SUCCESS,
        payload: res.data
      });*/
    } catch (error) {
      /*dispatch({
        type: FAIL,
        payload: error.response.data.msg
      });*/
    }
  };
  //Get Categories
  const getCategories = async () => {
    dispatch({ type: GET_CATEGORIES });
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
    console.log("Makes");
  };
  //Get models
  const getModels = async id => {
    console.log("Models");
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
