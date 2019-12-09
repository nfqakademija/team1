import React, { useEffect, useContext } from "react";
import { makeStyles } from "@material-ui/core/styles";
import Grid from "@material-ui/core/Grid";
import Card from "./Card";
import OrderContext from "../../context/order/orderContext";

const useStyles = makeStyles(theme => ({
  root: {
    flexGrow: 1,
    marginTop: "10px"
  },
  control: {
    padding: theme.spacing(2)
  },
  card: {
    padding: theme.spacing(2),
    textAlign: "center",
    color: theme.palette.text.secondary
  }
}));

export default function SpacingGrid() {
  const servicesContext = useContext(OrderContext);
  //get categories
  const { getCategories, categories } = servicesContext;

  useEffect(() => {
    getCategories();
    //eslint-disable-next-line
  }, []);

  const [spacing] = React.useState(2);
  const classes = useStyles();

  return (
    <div className={classes.root}>
      <Grid container spacing={3}>
        {categories.map(value => (
          <Grid key={value.id} item xs>
            <Card category={value} />
          </Grid>
        ))}
      </Grid>
    </div>
  );
}
