import React, { useContext, useEffect } from "react";
import { makeStyles } from "@material-ui/core/styles";
import FormLabel from "@material-ui/core/FormLabel";
import Checkbox from "@material-ui/core/Checkbox";
import OrderContext from "../../context/order/orderContext";

const useStyles = makeStyles(theme => ({
  root: {
    display: "flex"
  },
  formControl: {
    margin: theme.spacing(3)
  }
}));

export default function CheckboxesGroup({ categoryID }) {
  const orderContext = useContext(OrderContext);
  const {
    addService,
    getServices,
    services,
    selectedServices,
    removeService
  } = orderContext;

  useEffect(() => {
    getServices(categoryID);
    //eslint-disable-next-line
  }, []);

  const classes = useStyles();

  const onChange = service => {
    if (selectedServices.includes(service)) {
      removeService(service);
    } else {
      addService(service);
    }
  };

  return (
    <div className={classes.root}>
      <form>
        <FormLabel component="legend">Choose a service to order</FormLabel>
        {services.map(service => (
          <div key={service.id}>
            <Checkbox
              name="serviceCheckbox"
              value={service.name}
              onChange={() => onChange(service)}
            />
            {service.name}
            <div
              style={{
                marginLeft: "16px",
                marginBottom: "0.5rem",
                display: "inline-flex"
              }}
            >
              {service.price} Eur
            </div>
          </div>
        ))}
      </form>
    </div>
  );
}
