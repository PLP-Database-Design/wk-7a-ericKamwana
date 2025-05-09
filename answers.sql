
-- ==========================================
-- Question 1: Achieving First Normal Form (1NF)
-- ==========================================

-- Problem:
-- The 'Products' column contains multiple values (comma-separated), which violates 1NF.

-- Goal:
-- Transform the table so that each product is represented in its own row (atomic values only).

-- Step 1: Create the new normalized table
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(50)
);

-- Step 2: Insert atomic data into ProductDetail_1NF
INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES 
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');

-- ==========================================
-- Question 2: Achieving Second Normal Form (2NF)
-- ==========================================

-- Problem:
-- The table is in 1NF, but there is a partial dependency: CustomerName depends only on OrderID.

-- Goal:
-- Eliminate partial dependency by decomposing the table into two separate tables:
--  - Orders (OrderID, CustomerName)
--  - OrderItems (OrderID, Product, Quantity)

-- Step 1: Create Orders table (CustomerName depends only on OrderID)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Step 2: Insert data into Orders table
INSERT INTO Orders (OrderID, CustomerName)
VALUES 
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');

-- Step 3: Create OrderItems table (Product and Quantity depend on entire primary key)
CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(50),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Step 4: Insert data into OrderItems table
INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);


