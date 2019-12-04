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
          <div key={service.id} className="mx-2">
            <h5>{service.name}</h5>
            <p>{service.price} Eur</p>
          </div>
        ))
      ) : (
        <div></div>
      )}
      <h4 className="text-center">
        Full price of your order is {Number(price).toFixed(2)} Eur
      </h4>
    </div>
  );
}

export default OrderSum;
