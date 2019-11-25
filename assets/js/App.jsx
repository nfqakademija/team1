import React, { Fragment } from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import { MuiPickersUtilsProvider } from "@material-ui/pickers";
import MomentUtils from "@date-io/moment";
import Navbar from "./components/layout/Navbar";
import Home from "./components/pages/Home";
import Alert from "./components/layout/Alert";
import Services from "./components/pages/Services";

import ServiceState from "./context/services/ServicesState";
import AlertState from "./context/alert/AlertState";
import OrderState from "./context/alert/OrderState";
import "./components/App.css";

const App = () => {
  return (
    <ServiceState>
      <AlertState>
        <OrderState>
          <Router>
            <MuiPickersUtilsProvider utils={MomentUtils}>
              <Fragment>
                <Navbar />
                <div className="container">
                  <Switch>
                    <Route exact path="/" component={Home} />
                    <Route exact path="/services" component={Services} />
                  </Switch>
                </div>
              </Fragment>
            </MuiPickersUtilsProvider>
          </Router>
        </OrderState>
      </AlertState>
    </ServiceState>
  );
};

export default App;
