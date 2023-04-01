CREATE TABLE Department
(
  DeptName VARCHAR(255) NOT NULL,
  DeptID INT NOT NULL,
  DeptLocation VARCHAR(255) NOT NULL,
  PRIMARY KEY (DeptID)
);

CREATE TABLE Store
(
  StoreID INT NOT NULL,
  StoreAddress VARCHAR(255) NOT NULL,
  PRIMARY KEY (StoreID)
);

CREATE TABLE Shelves
(
  SelfSection VARCHAR(255) NOT NULL,
  ShelfID INT NOT NULL,
  DeptID INT NOT NULL,
  PRIMARY KEY (ShelfID),
  FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

CREATE TABLE Customer
(
  CustomerPhone INT NOT NULL,
  HomeAddress VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  FirstName VARCHAR(255) NOT NULL,
  CustomerID INT NOT NULL,
  PRIMARY KEY (CustomerID)
);

CREATE TABLE Employee
(
  EmployeeID INT NOT NULL,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  DeptID INT NOT NULL,
  Birthday DATE NOT NULL,
  ESSN INT NOT NULL,
  HomeAddress VARCHAR(255) NOT NULL,
  Salary INT NOT NULL,
  StoreID INT NOT NULL,
  PRIMARY KEY (EmployeeID),
  FOREIGN KEY (StoreID) REFERENCES Store(StoreID),
  FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);

CREATE TABLE Managers
(
  DeptID INT NOT NULL,
  ESSN INT NOT NULL,
  EmployeeID INT NOT NULL,
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

CREATE TABLE Products
(
  ProductName VARCHAR(255) NOT NULL,
  ProductID INT NOT NULL,
  SetPrice INT NOT NULL,
  SalePrice INT,
  SerialNumber INT NOT NULL,
  Amount INT NOT NULL,
  ShelfID INT NOT NULL,
  CustomerID INT NOT NULL,
  PRIMARY KEY (ProductID),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Sale
(
  DeptID INT NOT NULL,
  SaleDate DATE NOT NULL,
  AmountSold INT NOT NULL,
  ProductID INT NOT NULL,
  CustomerID INT NOT NULL,
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE CustomerDelivery
(
  DeliveryDate DATE NOT NULL,
  CustomerID INT NOT NULL,
  DeliveryID INT NOT NULL,
  CustomerDeliveryAmount INT NOT NULL,
  ProductID INT NOT NULL,
  PRIMARY KEY (DeliveryID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE CustomerPickup
(
  PickupDate DATE NOT NULL,
  CustomerID INT NOT NULL,
  PickupID INT NOT NULL,
  CustomerPickupAmount INT NOT NULL,
  ProductID INT NOT NULL,
  PRIMARY KEY (PickupID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE ProductDelivery
(
  DeliveryDate DATE NOT NULL,
  TruckID INT NOT NULL,
  DeliveryAmount INT NOT NULL,
  ProductID INT NOT NULL,
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE BELONG_ON
(
  ProductID INT NOT NULL,
  ShelfID INT NOT NULL,
  PRIMARY KEY (ProductID, ShelfID),
  FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
  FOREIGN KEY (ShelfID) REFERENCES Shelves(ShelfID)
);
