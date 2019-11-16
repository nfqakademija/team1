import React, { useState, Fragment } from "react";
import Grid from "@material-ui/core/Grid";
import Typography from "@material-ui/core/Typography";
import TextField from "@material-ui/core/TextField";
import FormControlLabel from "@material-ui/core/FormControlLabel";
import Checkbox from "@material-ui/core/Checkbox";
import { makeStyles } from "@material-ui/core/styles";
import { DatePicker } from "@material-ui/pickers";
import Select from "@material-ui/core/Select";
import InputLabel from "@material-ui/core/InputLabel";
import FormHelperText from "@material-ui/core/FormHelperText";
import Button from "@material-ui/core/Button";
import FormControl from "@material-ui/core/FormControl";

const useStyles = makeStyles(theme => ({
  root: {
    flexGrow: 1,
    marginTop: "20px"
  },
  paper: {
    padding: theme.spacing(2),
    textAlign: "center",
    color: theme.palette.text.secondary
  },
  formControl: {
    margin: theme.spacing(1),
    minWidth: 120
  }
}));

export default function OrderForm() {
  const classes = useStyles();
  const [state, setState] = React.useState({
    gearbox: ""
  });

  const [selectedDate, handleDateChange] = useState(new Date());
  return (
    <Fragment>
      <Grid
        container
        className={classes.root}
        container
        justify="center"
        alignItems="center"
      >
        <Grid item xs={12} sm={10}>
          <Typography variant="h6" gutterBottom>
            Oder data
          </Typography>
          <Grid item xs={12} sm={6}>
            <DatePicker
              views={["year"]}
              label="Year of manufactoring"
              value={selectedDate}
              onChange={handleDateChange}
              disableUnderline={true}
            />
          </Grid>
          <Grid item xs={12} sm={6}>
            <TextField
              required
              id="make"
              name="make"
              label="Vehicle Make"
              fullWidth
              autoComplete="make"
              disableUnderline={true}
            />
          </Grid>
          <Grid item xs={12} sm={6}>
            <TextField
              required
              id="model"
              name="model"
              label="Model"
              fullWidth
              autoComplete="model"
              disableUnderline={true}
            />
          </Grid>
          <Grid item xs={12} sm={6}>
            <TextField
              id="power"
              name="power"
              label="Power"
              fullWidth
              autoComplete="power"
              disableUnderline={true}
            />
          </Grid>
          <Grid item xs={12} sm={6}>
            <FormControl className={classes.formControl}>
              <InputLabel htmlFor="age-native-simple">Gearbox Type</InputLabel>
              <Select
                native
                value={state.gearbox}
                onChange={() => console.log("changed")}
                inputProps={{
                  name: "gearbox",
                  id: "gearbox-native-simple"
                }}
                style={{ minWidth: "120px" }}
              >
                <option value="" />
                <option value={"manual"}>Manual</option>
                <option value={"automatic"}>Automatic</option>
                <option value={"sequential"}>Sequential</option>
              </Select>
            </FormControl>
          </Grid>
          <Grid item xs={12} sm={6}>
            <TextField id="state" name="state" label="Displacement" fullWidth />
          </Grid>
          <Grid item xs={12} sm={6}>
            <TextField
              required
              id="ecuModel"
              name="ecuModel"
              label="ECU model"
              fullWidth
              autoComplete="ecu Model"
              disableUnderline={true}
            />
          </Grid>
          <Grid item xs={12} sm={6}>
            <TextField
              required
              id="comment"
              name="comment"
              label="Comment"
              fullWidth
              multiline={true}
              rows={4}
              rowsMax={8}
              autoComplete="comment"
              disableUnderline={true}
            />
          </Grid>
          <Grid item xs={12} sm={6}>
            <FormControlLabel
              control={
                <Checkbox color="secondary" name="saveVehicle" value="yes" />
              }
              label="Save this vehicle to my vehicle"
            />
          </Grid>
          <Button color="primary" type="submit">
            Submit
          </Button>
        </Grid>
      </Grid>
    </Fragment>
  );
}
