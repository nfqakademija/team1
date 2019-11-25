import React, { useContext } from "react";
import OrderContext from "../../context/order/orderContext";

function OrderSum() {
  const orderContext = useContext(OrderContext);
  const { selectedServices, price } = orderContext;
  return (
    <div>
      {selectedServices.array.map(service => (
        <div>
          <h5>{service.name}</h5>
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
      <h2>Full price is {price}</h2>
    </div>
  );
}

export default OrderSum;
