-- Find the employees with their department names and store adresses.
SELECT e.FirstName, e.LastName, d.DeptName, s.StoreAddress
FROM Employee e
JOIN Department d ON e.DeptID = d.DeptID
JOIN Store s ON e.StoreID = s.StoreID;

-- List all products sold within a specific date range.
SELECT p.ProductName, s.SaleDate, s.AmountSold
FROM Products p
JOIN Sale s ON p.ProductID = s.ProductID
WHERE s.SaleDate BETWEEN '2023-04-01' AND '2023-04-02';

-- Find the total number of products that a customer had delivered and picked up from the store.
SELECT c.FirstName, c.LastName,
       SUM(cd.CustomerDeliveryAmount) AS TotalDeliveries,
       SUM(cp.CustomerPickupAmount) AS TotalPickups
FROM Customer c
LEFT JOIN CustomerDelivery cd ON c.CustomerID = cd.CustomerID
LEFT JOIN CustomerPickup cp ON c.CustomerID = cp.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;
