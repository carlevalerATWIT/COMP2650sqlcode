INSERT INTO Department(DeptID, DeptName, DeptLocation)
VALUES
(1, 'Electrical', 'AisleOne'),
(2, 'Millworks', 'AisleTwo'),
(3, 'Appliances', 'AisleThree'),
(4, 'ISLG', 'AisleFour'),
(5, 'OSLG', 'AisleFive');

INSERT INTO Store(StoreID, StoreAddress)
VALUES 
(12345, '321 Main St, Boston MA'),
(84392, '453 Oak St, Boston MA'),
(94583, '34 Pencil St, Boston MA');

INSERT INTO Shelves(ShelfID, ShelfSection, DeptID)
VALUES 
(1, 'A1', 1),
(2, 'A2', 2),
(3, 'B1', 3),
(4, 'B2', 4),
(5, 'C1', 5);

INSERT INTO Customer(CustomerID, CustomerPhone, HomeAddress, LastName, FirstName)
VALUES
(123456, '5551234567', '123 Main St', 'Smith', 'John'),
(234567, '5552345678', '456 Elm St', 'Johnson', 'Jane'),
(345678, '5553456789', '789 Oak St', 'Williams', 'David'),
(456789, '5554567890', '321 Maple Ave', 'Brown', 'Jessica'),
(567890, '5555678901', '654 Pine St', 'Davis', 'Michael'),
(678901, '5556789012', '987 Cedar Rd', 'Miller', 'Emily'),
(789012, '5557890123', '246 Birch Ln', 'Jones', 'Steven');

INSERT INTO Store (StoreID, StoreAddress) 
VALUES 
(1, '123 Main St, Anytown, USA'),
(2, '456 Oak St, Othertown, USA');

INSERT INTO Employee(EmployeeID, FirstName, LastName, Birthday, ESSN, HomeAddress, Salary, StoreID, DeptID)
VALUES
(1, 'John', 'Doe', '1990-05-01', '123456789', '123 Main St, Anytown, USA', 60000, 1, 1),
(2, 'Jane', 'Smith', '1995-08-15', '98654321', '456 Oak St, Anytown, USA', 55000, 2, 2),
(3, 'Michael', 'Johnson', '1992-02-28', '54219876', '789 Maple Ave, Anytown, USA', 65000, 1, 3),
(4, 'Emily', 'Davis', '1998-11-07', '45679123', '101 Elm St, Anytown, USA', 50000, 2, 1),
(5, 'David', 'Lee', '1991-07-23', '789123456', '555 Pine St, Anytown, USA', 70000, 1, 2);

INSERT INTO Managers(DeptID, ESSN, EmployeeID)
VALUES
(2, '789123456', 5);

INSERT INTO Products(ProductID, ProductName, SetPrice, SalePrice, SerialNumber, Amount, ShelfID, CustomerID)
VALUES
(1, 'Toilet', 100, 80, 'HD-1001', 10, 1, 123456),
(2, 'GFCI Outlet', 120, 100, 'CS-2002', 8, 2, 123456),
(3, 'Refrigerator', 80, 70, 'PS-3003', 12, 3, 234567),
(4, 'Nails', 200, 180, 'AC-4004', 5, 4, 567890),
(5, 'DoorHandle', 300, 250, 'WTS-5005', 3, 5, 345678),
(6, 'Deadbolt', 150, 120, 'CS-6006', 15, 5, 789012),
(7, 'Vanity Lighting', 70, 50, 'ID-7007', 20, 1, 345678),
(8, 'Circuit Breaker', 250, 200, 'RT-8008', 6, 2, 234567);

INSERT INTO Sale(DeptID, SaleDate, AmountSold, CustomerID, ProductID)
VALUES
(3, '2023-04-01', 2, 234567, 3),
(2, '2023-04-02', 1, 567890, 4),
(1, '2023-04-03', 3, 123456, 2);

INSERT INTO CustomerDelivery(DeliveryID, DeliveryDate, CustomerID, CustomerDeliveryAmount, ProductID)
VALUES
(24402, '2023-04-03', 345678, 1, 4);

INSERT INTO CustomerPickup(PickupID, PickupDate, CustomerID, CustomerPickupAmount, ProductID)
VALUES
(3, '2023-04-03', 789012, 3, 3);

INSERT INTO ProductDelivery(DeliveryDate, TruckID, DeliveryAmount, ProductID)
VALUES
('2023-04-01', 1001, 20, 1),
('2023-04-02', 1002, 30, 5),
('2023-04-03', 1003, 15, 2);

INSERT INTO BELONG_ON (ProductID, ShelfID)
VALUES
(8, 1),
(7, 1),
(6, 2),
(5, 2),
(4, 2),
(3, 3),
(2, 1),
(1, 3);
