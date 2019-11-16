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
    gilad: true,
    jason: false,
    antoine: false,
    array: [
      { name: "ServiceA", price: "20.21" },
      { name: "ServiceB", price: "45.13" },
      { name: "ServiceC", price: "9.78" }
    ]
  });

  const handleChange = name => event => {
    setState({ ...state, [name]: event.target.checked });
  };

  const { gilad, jason, antoine } = state;

  return (
    <div className={classes.root}>
      <FormControl component="fieldset" className={classes.formControl}>
        <FormLabel component="legend">Choose a service to order</FormLabel>
        <FormGroup>
          {state.array.map(service => (
            <div>
              <FormControlLabel
                control={<Checkbox value={service.name} />}
                label={service.name}
              />
              <p
                style={{
                  display: "inline",
                  textAlign: "right",
                  alignItems: "center",
                  justifyContent: "right"
                }}
              >
                {service.price} EUR
              </p>
            </div>
          ))}
        </FormGroup>
      </FormControl>
    </div>
  );
}
