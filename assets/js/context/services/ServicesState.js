import React, { useReducer } from "react";
import axios from "axios";
import ServicesContext from "./servicesContext";
import ServicesReducer from "./servicesReducer";
import { GET_CATEGORIES, GET_CATEGORY_SERVICES } from "../types";

const ServicesState = props => {
  const initialState = {
    categories: [],
    services: [],
    loading: false
  };

  const [state, dispatch] = useReducer(ServicesReducer, initialState);

  //Get all categories
  const getServiceCategories = async () => {
    const res = await axios.get("/api/categories");
    dispatch({
      type: GET_CATEGORIES,
      payload: res.categories
    });
  };

  //Get all services for category

  //Send selected categories and services

  return (
    <ServicesContext.Provider
      value={{
        categories: state.categories,
        services: state.services,
        loading: state.loading,
        getServiceCategories
      }}
    >
      {props.children}
    </ServicesContext.Provider>
  );
};
