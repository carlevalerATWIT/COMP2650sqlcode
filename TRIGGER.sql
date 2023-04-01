Use homeimprovement;

DELIMITER //
CREATE TRIGGER ProductQuantityAfterPickupOrder
AFTER INSERT ON customerpickup
FOR EACH ROW
BEGIN
    UPDATE products
    SET amount = amount - NEW.customerpickupamount
    WHERE productid = NEW.productid;
END; //
DELIMITER ;

DELIMITER //
CREATE TRIGGER ProductQuantityAfterDeliveryOrder
AFTER INSERT ON customerdelivery
FOR EACH ROW
BEGIN
    UPDATE products
    SET amount = amount - NEW.customerdeliveryamount
    WHERE productid = NEW.productid;
END; //
DELIMITER ;
