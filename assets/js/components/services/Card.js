import clsx from "clsx";
import React, { useEffect, useContext } from "react";
import Card from "@material-ui/core/Card";
import CardActions from "@material-ui/core/CardActions";
import CardContent from "@material-ui/core/CardContent";
import CardHeader from "@material-ui/core/CardHeader";
import CardMedia from "@material-ui/core/CardMedia";
import Collapse from "@material-ui/core/Collapse";
import { red } from "@material-ui/core/colors";
import IconButton from "@material-ui/core/IconButton";
import { makeStyles } from "@material-ui/core/styles";
import Typography from "@material-ui/core/Typography";
import ExpandMoreIcon from "@material-ui/icons/ExpandMore";
import CheckboxesGroup from "./CheckboxesGroup";
import ServicesContext from "../../context/services/servicesContext";

const useStyles = makeStyles(theme => ({
  card: {
    maxWidth: 345
  },
  media: {
    height: 0,
    paddingTop: "56.25%" // 16:9
  },
  expand: {
    transform: "rotate(0deg)",
    marginLeft: "auto",
    transition: theme.transitions.create("transform", {
      duration: theme.transitions.duration.shortest
    })
  },
  expandOpen: {
    transform: "rotate(180deg)"
  },
  avatar: {
    backgroundColor: red[500]
  }
}));

export default function RecipeReviewCard(id) {
  const servicesContext = useContext(ServicesContext);
  /*const { category, getCategory } = servicesContext;

  useEffect(() => {
    getCategory(this.props.id);
    //eslint-disable-next-line
  }, []);*/

  const classes = useStyles();
  const [expanded, setExpanded] = React.useState(false);

  const handleExpandClick = () => {
    setExpanded(!expanded);
  };

  return (
    <Card className={classes.card}>
      <CardHeader title="ECU" />
      <CardMedia
        className={classes.media}
        style={{ height: 0, paddingTop: "56%" }}
        image={require("../../../img/ecu.jpg")}
      ></CardMedia>
      <CardContent>
        <Typography variant="body2" color="textSecondary" component="p">
          Tuning your ECU is a great way to achieve more performance or fuel
          economy!
        </Typography>
      </CardContent>
      <CardActions disableSpacing>
        <IconButton
          className={clsx(classes.expand, {
            [classes.expandOpen]: expanded
          })}
          onClick={handleExpandClick}
          aria-expanded={expanded}
          aria-label="show more"
        >
          <ExpandMoreIcon />
        </IconButton>
      </CardActions>
      <Collapse in={expanded} timeout="auto" unmountOnExit>
        <CardContent>
          <Typography paragraph>
            <CheckboxesGroup />
          </Typography>
        </CardContent>
      </Collapse>
    </Card>
  );
}
