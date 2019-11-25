import React, { useReducer } from "react";
import axios from "axios";
import ServicesContext from "./orderContext";
import ServicesReducer from "./orderReducer";
import { GET_CATEGORIES, GET_CATEGORY } from "../types";

const OrderState = props => {
  const initialState = {
    order: {},
    selectedServices: [],
    price: ""
  };

  const [state, dispatch] = useReducer(ServicesReducer, initialState);

  //Get all categories
  const getCategories = async () => {
    const res = await axios.get("/api/categories");
    dispatch({
      type: GET_CATEGORIES,
      payload: res.categories
    });
  };

  //Get all data of a specific category
  const getCategory = async id => {
    const res = await axios.get(`/api/categories/${id}`);
    dispatch({
      type: GET_CATEGORY,
      payload: res.categoy
    });
  };
  //Send selected categories and services

  return (
    <ServicesContext.Provider
      value={{
        categories: state.categories,
        services: state.services,
        loading: state.loading,
        category: state.category,
        getCategories,
        getCategory
      }}
    >
      {props.children}
    </ServicesContext.Provider>
  );
};

export default OrderState;
