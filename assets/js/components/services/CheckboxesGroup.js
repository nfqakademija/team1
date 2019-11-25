import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import FormLabel from "@material-ui/core/FormLabel";
import FormControl from "@material-ui/core/FormControl";
import FormGroup from "@material-ui/core/FormGroup";
import FormControlLabel from "@material-ui/core/FormControlLabel";
import FormHelperText from "@material-ui/core/FormHelperText";
import Checkbox from "@material-ui/core/Checkbox";

const useStyles = makeStyles(theme => ({
  root: {
    display: "flex"
  },
  formControl: {
    margin: theme.spacing(3)
  }
}));

export default function CheckboxesGroup(services) {
  const classes = useStyles();
  const [state, setState] = React.useState({
    array: [
      { name: "ServiceA", price: "20.21" },
      { name: "ServiceB", price: "45.13" },
      { name: "ServiceC", price: "9.78" }
    ]
  });

  const handleChange = name => event => {
    setState({ ...state, [name]: event.target.checked });
  };

  return (
    <div className={classes.root}>
      <FormControl component="fieldset" className={classes.formControl}>
        <FormLabel component="legend">Choose a service to order</FormLabel>
        <div>
          {state.array.map(service => (
            <div>
              <FormControlLabel
                style={{ marginBottom: "0rem" }}
                control={<Checkbox value={service.name} />}
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
        </div>
      </FormControl>
    </div>
  );
}
