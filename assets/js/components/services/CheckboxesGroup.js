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
    categories,
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
        {categories
          .find(category => category.id == categoryID)
          .services.map(service => (
            <div key={service.id}>
              <p>
                <label className="black-text">
                  <input
                    type="checkbox"
                    name="serviceCheckbox"
                    value={service}
                    onChange={() => onChange(service)}
                  />
                  <span>{service.name}</span>
                  <span
                    style={{
                      marginLeft: "26px",
                      display: "inline-flex",
                      fontSize: "1.25rem"
                    }}
                  >
                    {service.price} Eur
                  </span>
                </label>
              </p>
            </div>
          ))}
      </form>
    </div>
  );
}
