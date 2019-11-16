import { GET_CATEGORIES, GET_CATEGORY } from "../types";

export default (state, action) => {
  switch (action.type) {
    case GET_CATEGORIES:
      return {
        ...state,
        categories: action.payload
      };
    case GET_CATEGORY:
      return {
        ...state,
        category: action.payload
      };
    default:
      return state;
  }
};
