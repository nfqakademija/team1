import React, { useState, useContext, useEffect } from "react";
import { DatePicker } from "@material-ui/pickers";

const OrderForm = () => {
  //const orderContext = useContext(OrderContext);

  //const { createOrder, getMakes, getModels } = orderContext;

  const [order, setOrder] = useState({
    make: "",
    model: "",
    power: "",
    gearbox: "automatic",
    displacement: "",
    ecu: "",
    comment: ""
  });

  const { make, model, power, gearbox, displacement, ecu, comment } = order;
  const [selectedDate, handleDateChange] = useState(new Date());
  const onChange = e => setOrder({ ...order, [e.target.name]: e.target.value });

  const onSubmit = e => {
    e.preventDefault();
    console.log(selectedDate.year());
    order.year = selectedDate.year();
    console.log(order);
    //send add contact request
    //createOrder(order);
    //reset the form
    /*setOrder({
      make: "",
      model: "",
      power: "",
      gearbox: "automatic",
      displacement: "",
      ecu: "",
      comment: ""
    });*/
  };

  return (
    <form onSubmit={onSubmit}>
      <h2 className="text-primary">Create new Order</h2>
      <input
        type="text"
        placeholder="Model"
        name="model"
        value={model}
        onChange={onChange}
      />
      <input
        type="text"
        placeholder="Make"
        name="make"
        value={make}
        onChange={onChange}
      />
      <DatePicker
        style={{ width: "100%" }}
        views={["year"]}
        label="Year of manufactoring"
        value={selectedDate}
        onChange={handleDateChange}
      />
      <div className="form-group">
        <label htmlFor="gearbox">Gearbox Type:</label>
        <select name="gearbox" value={gearbox} onChange={onChange}>
          <option value="automatic">Automatic</option>
          <option value="manual">Manual</option>
          <option value="sequential">Sequential</option>
        </select>
      </div>
      <input
        type="text"
        placeholder="Power"
        name="power"
        value={power}
        onChange={onChange}
      />
      <input
        type="text"
        placeholder="Displacement"
        name="displacement"
        value={displacement}
        onChange={onChange}
      />
      <input
        type="text"
        placeholder="Ecu"
        name="ecu"
        value={ecu}
        onChange={onChange}
      />
      <div className="form-group">
        <textarea
          name="comment"
          rows="5"
          placeholder="Comment..."
          onChange={onChange}
        />
      </div>
      <div>
        <input
          type="submit"
          value="Create Order"
          className="btn btn-primary btn-block"
        />
      </div>
    </form>
  );
};

export default OrderForm;
