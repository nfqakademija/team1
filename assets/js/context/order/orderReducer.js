import { GET_MODELS, GET_MAKES, CREATE_ORDER, CALC_PRICE } from "../types";

export default (state, action) => {
  switch (action.type) {
    case GET_MODELS:
      return {
        ...state,
        models: action.payload
      };
    case GET_MAKES:
      return {
        ...state,
        makes: action.payload
      };
    case CREATE_ORDER:
      return {
        ...state,
        orders: [state.orders, action.payload]
      };
    case CALC_PRICE:
      return {
        ...state,
        price: state.price + action.payload
      };
    default:
      return state;
  }
};
