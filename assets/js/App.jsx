import React from "react";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";
import Navbar from "./components/layout/Navbar";
import CardGrid from "./components/services/CardGrid";
import OrderForm from "./components/orders/OrderForm";
import { MuiPickersUtilsProvider } from "@material-ui/pickers";
import MomentUtils from "@date-io/moment";

const App = () => {
  return (
    <Router>
      <MuiPickersUtilsProvider utils={MomentUtils}>
        <div className="App">
          <Navbar />
          <CardGrid />
          <OrderForm />
        </div>
      </MuiPickersUtilsProvider>
    </Router>
  );
};

export default App;
