import { GET_CATEGORIES, GET_CATEGORY_SERVICES } from "../types";

export default (state, action) => {
  switch (action.type) {
    case GET_CATEGORIES:
      return {
        ...state,
        categories
      };
    case GET_CATEGORY_SERVICES:
      return {
        ...state,
        services
      };
    default:
      return state;
  }
};
