import {
  GET_MODELS,
  GET_MAKES,
  ADD_SERVICE,
  REMOVE_SERVICE,
  GET_CATEGORIES,
  GET_SERVICES
} from "../types";

export default (state, action) => {
  switch (action.type) {
    case GET_CATEGORIES:
      return {
        ...state,
        categories: state.categories
      };
    case GET_MODELS:
      return {
        ...state,
        categories: state.models
      };
    case GET_MAKES:
      return {
        ...state,
        categories: state.makes
      };
    case GET_SERVICES:
      return {
        ...state,
        services: state.categories.find(
          category => category.id === action.payload
        ).services
      };
    case ADD_SERVICE:
      return {
        ...state,
        selectedServices: [...state.selectedServices, action.payload],
        price: state.price + action.payload.price
      };
    case REMOVE_SERVICE:
      return {
        ...state,
        selectedServices: state.selectedServices.filter(
          service => service.id !== action.payload.id
        ),
        price: state.price - action.payload.price
      };
    default:
      return state;
  }
};
