import React, { useContext, useEffect } from "react";
import OrderContext from "../../context/order/orderContext";

function OrderSum() {
  const orderContext = useContext(OrderContext);
  const { selectedServices, price } = orderContext;

  useEffect(() => {});

  return (
    <div>
      {selectedServices.length > 0 ? (
        selectedServices.map(service => (
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
        ))
      ) : (
        <div></div>
      )}
      <h4>Full price of your order is {price} Eur</h4>
    </div>
  );
}

export default OrderSum;
