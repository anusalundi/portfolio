CREATE TABLE Customers (
    CustomerID INTEGER PRIMARY KEY,
    FirstName TEXT,
    LastName TEXT,
    Email TEXT
);

INSERT INTO Customers (FirstName, LastName, Email) VALUES 
('Mari', 'Kiir', 'mari.kiir@example.com'),
('Jane', 'Ploom', 'jane123@example.com'),
('Anton', 'Veski', 'veski@example.com');

CREATE TABLE Products (
    ProductID INTEGER PRIMARY KEY,
    ProductName TEXT,
    Price REAL
);

INSERT INTO Products (ProductName, Price) VALUES 
('Laptop', 999.99),
('Smartphone', 499.99),
('Tablet', 299.99);

CREATE TABLE Orders (
    OrderID INTEGER PRIMARY KEY,
    CustomerID INTEGER,
    ProductID INTEGER,
    OrderDate TEXT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Orders (CustomerID, ProductID, OrderDate) VALUES 
(1, 1, '2024-08-22'),
(2, 2, '2024-08-22'),
(3, 3, '2024-08-23');
