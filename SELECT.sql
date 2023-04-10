
-- Find the employees with their department names and store adresses.
SELECT e.FirstName, e.LastName, d.DeptName, s.StoreAddress
FROM Employee e
JOIN Department d ON e.DeptID = d.DeptID
JOIN Store s ON e.StoreID = s.StoreID;
