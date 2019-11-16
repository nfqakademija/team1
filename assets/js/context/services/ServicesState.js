import React, { useReducer } from "react";
import axios from "axios";
import ServicesContext from "./servicesContext";
import ServicesReducer from "./servicesReducer";
import { GET_CATEGORIES, GET_CATEGORY } from "../types";

const ServicesState = props => {
  const initialState = {
    categories: [],
    services: [],
    loading: false,
    category: {}
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
        categoty: state.category,
        getCategories,
        getCategory
      }}
    >
      {props.children}
    </ServicesContext.Provider>
  );
};

export default ServicesState;
