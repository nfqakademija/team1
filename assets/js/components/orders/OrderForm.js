import React, { useState, useContext, useEffect } from "react";
import { DatePicker } from "@material-ui/pickers";
import OrderContext from "../../context/order/orderContext";
import AlertContext from "../../context/alert/alertContext";
import Alert from "../layout/Alert";

const OrderForm = () => {
  const orderContext = useContext(OrderContext);
  const alertContext = useContext(AlertContext);

  const { setAlert } = alertContext;
  const { createOrder, getMakes, getModels, makes, models } = orderContext;

  const [order, setOrder] = useState({
    make: "",
    model: "",
    power: "",
    gearbox: "automatic",
    displacement: "",
    ecu: "",
    comment: "",
    file: ""
  });
  const [filename, setFilename] = useState("Choose File");

  useEffect(() => {
    getMakes();
    getModels();
    //eslint-disable-next-line
  }, []);

  const { make, model, power, gearbox, displacement, ecu, comment } = order;
  const [selectedDate, handleDateChange] = useState(new Date());
  const onChange = e => {
    if (e.target.name === "file") {
      setOrder({ ...order, [e.target.name]: e.target.files[0] });
      setFilename(e.target.files[0].name);
    } else {
      setOrder({ ...order, [e.target.name]: e.target.value });
    }
  };

  const onSubmit = e => {
    e.preventDefault();
    //Add manufactoring year to the order from date picker
    order.year = selectedDate;
    //Validation
    if (
      make === "" ||
      model === "" ||
      power === "" ||
      gearbox === "" ||
      displacement === "" ||
      ecu === ""
    ) {
      setAlert("Please fill in all the required fields", "danger");
    } else if (order.year < new Date("1936") && order.year > Date.now()) {
      setAlert("Manufactoring year must be a valid value", "danger");
    } else {
      //send add contact request
      createOrder(order);
    }
  };

  return (
    <form onSubmit={onSubmit}>
      <h2 className="text-primary">Create new Order</h2>
      <Alert />
      <div className="form-group">
        <label htmlFor="make">Car Make:</label>
        <select name="make" value={make} onChange={onChange}>
          <option value=""></option>
          {makes.map(make => (
            <option key={make.id} value={make.name}>
              {make.name}
            </option>
          ))}
        </select>
      </div>
      <div className="form-group">
        <label htmlFor="model">Car Model:</label>
        <select name="model" value={model} onChange={onChange}>
          <option value=""></option>
          {models.map(model => (
            <option key={model.id} value={model.name}>
              {model.name}
            </option>
          ))}
        </select>
      </div>
      <div className="form-group">
        <label htmlFor="year">Manufactoring Year:</label>
        <DatePicker
          InputProps={{
            disableUnderline: true
          }}
          name="year"
          style={{ width: "100%" }}
          views={["year"]}
          maxDate={new Date()}
          minDate={"03/18/1936"}
          value={selectedDate}
          onChange={handleDateChange}
        />
      </div>
      <div className="form-group">
        <label htmlFor="gearbox">Gearbox Type:</label>
        <select name="gearbox" value={gearbox} onChange={onChange}>
          <option value=""></option>
          <option value="automatic">Automatic</option>
          <option value="manual">Manual</option>
          <option value="sequential">Sequential</option>
        </select>
      </div>
      <div className="form-group">
        <label htmlFor="power">Power (kw):</label>
        <input
          type="text"
          placeholder="Power"
          name="power"
          value={power}
          onChange={onChange}
        />
      </div>
      <div className="form-group">
        <label htmlFor="displacement">Vehicle Displacement:</label>
        <input
          type="text"
          placeholder="Displacement"
          name="displacement"
          value={displacement}
          onChange={onChange}
        />
      </div>
      <div className="form-group">
        <label htmlFor="ecu">ECU Model Name:</label>
        <input
          type="text"
          placeholder="Ecu"
          name="ecu"
          value={ecu}
          onChange={onChange}
        />
      </div>
      <div className="form-group">
        <label>Vehicle ECU File Upload:</label>
        <div className="custom-file mb-4">
          <input
            type="file"
            className="custom-file-input"
            name="file"
            id="customFile"
            onChange={onChange}
          />
          <label className="custom-file-label" htmlFor="customFile">
            {filename}
          </label>
        </div>
      </div>
      <div className="form-group">
        <label htmlFor="comment">Additional Comments:</label>
        <textarea
          name="comment"
          rows="5"
          value={comment}
          placeholder="Comment...(optional)"
          onChange={onChange}
        />
      </div>
      <div>
        <input
          type="submit"
          value="Create Order"
          className="btn btn-primary btn-block mt-4"
        />
      </div>
    </form>
  );
};

export default OrderForm;
