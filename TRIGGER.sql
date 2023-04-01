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

DELIMITER //
CREATE TRIGGER UpdateInventoryAfterProductDelivery
AFTER INSERT ON ProductDelivery
FOR EACH ROW
BEGIN
  UPDATE Products
  SET Amount = Amount + NEW.DeliveryAmount
  WHERE ProductID = NEW.ProductID;
END; //
DELIMITER ;

DELIMITER //
CREATE TRIGGER UpdateDailySalesAfterDelivery
AFTER INSERT ON CustomerDelivery
FOR EACH ROW
BEGIN
  INSERT INTO Sale (DeptID, SaleDate, AmountSold, ProductID, CustomerID)
  VALUES (
    (SELECT DeptID FROM BELONG_ON WHERE ProductID = NEW.ProductID),
    NEW.DeliveryDate,
    NEW.CustomerDeliveryAmount,
    NEW.ProductID,
    NEW.CustomerID
  )
  ON DUPLICATE KEY UPDATE
    AmountSold = AmountSold + NEW.CustomerDeliveryAmount;
END; //
DELIMITER ;

DELIMITER //
CREATE TRIGGER UpdateDailySalesAfterPickup
AFTER INSERT ON CustomerPickup
FOR EACH ROW
BEGIN
  INSERT INTO Sale (DeptID, SaleDate, AmountSold, ProductID, CustomerID)
  VALUES (
    (SELECT DeptID FROM BELONG_ON WHERE ProductID = NEW.ProductID),
    NEW.PickupDate,
    NEW.CustomerPickupAmount,
    NEW.ProductID,
    NEW.CustomerID
  )
  ON DUPLICATE KEY UPDATE
    AmountSold = AmountSold + NEW.CustomerPickupAmount;
END; //
DELIMITER ;
