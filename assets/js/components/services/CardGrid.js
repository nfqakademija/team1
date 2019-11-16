import React, { useEffect, useContext } from "react";
import { makeStyles } from "@material-ui/core/styles";
import Grid from "@material-ui/core/Grid";
import Card from "./Card";
import ServicesContext from "../../context/services/servicesContext";

const useStyles = makeStyles(theme => ({
  root: {
    flexGrow: 1,
    marginTop: "10px"
  },
  control: {
    padding: theme.spacing(2)
  }
}));

export default function SpacingGrid() {
  const servicesContext = useContext(ServicesContext);
  //add categories
  //const { getCategories } = servicesContext;

  /*useEffect(() => {
    getCategories();
    //eslint-disable-next-line
  }, []);*/

  const [spacing] = React.useState(2);
  const classes = useStyles();

  return (
    <Grid container className={classes.root} spacing={2}>
      <Grid item xs={12}>
        <Grid container justify="center" spacing={spacing}>
          {[0, 1, 2].map(value => (
            <Grid key={value} item>
              <Card id={value.id} />
            </Grid>
          ))}
        </Grid>
      </Grid>
    </Grid>
  );
}
