import React, { Fragment } from "react";
import { MuiPickersUtilsProvider } from "@material-ui/pickers";
import DateFnsUtils from "@date-io/date-fns";
import Order from "./components/pages/Order";

import AlertState from "./context/alert/AlertState";
import OrderState from "./context/order/OrderState";
import "./components/App.css";

const App = () => {
  return (
    <AlertState>
      <OrderState>
        <MuiPickersUtilsProvider utils={DateFnsUtils}>
          <Fragment>
            <Order />
          </Fragment>
        </MuiPickersUtilsProvider>
      </OrderState>
    </AlertState>
  );
};

export default App;
