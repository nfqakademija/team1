import {
  GET_MODELS,
  GET_MAKES,
  CREATE_ORDER,
  CALC_PRICE,
  ADD_SERVICE,
  REMOVE_SERVICE
} from "../types";

export default (state, action) => {
  switch (action.type) {
    case CALC_PRICE:
      return {
        ...state,
        price: state.price
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
          service => service.name !== action.payload
        ),
        price: state.price - action.payload.price
      };
    default:
      return state;
  }
};
