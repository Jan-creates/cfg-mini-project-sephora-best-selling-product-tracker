CREATE DATABASE SephoraBestSellers;

USE SephoraBestSellers;

CREATE TABLE Brands (
    Brand_ID INT AUTO_INCREMENT PRIMARY KEY,
    Brand_Name VARCHAR(50) NOT NULL
);

CREATE TABLE Categories (
    Category_ID INT AUTO_INCREMENT PRIMARY KEY,
    Category_Name VARCHAR(50) NOT NULL
);

CREATE TABLE Suppliers (
    Supplier_ID INT AUTO_INCREMENT PRIMARY KEY,
    Supplier_Name VARCHAR(100) NOT NULL,
    Contact_Person VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(150)
);

CREATE TABLE Products (
    Product_ID INT AUTO_INCREMENT PRIMARY KEY,
    Product_Name VARCHAR(50) NOT NULL,
    Brand_ID INT NOT NULL,
    Category_ID INT NOT NULL,
    Supplier_ID INT NOT NULL,  
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT NOT NULL,
    Rating DECIMAL(3, 2),  -- Average rating of the product 
    CONSTRAINT fk_brand FOREIGN KEY (Brand_ID) REFERENCES Brands(Brand_ID),
    CONSTRAINT fk_category FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID),
    CONSTRAINT fk_supplier FOREIGN KEY (Supplier_ID) REFERENCES Suppliers(Supplier_ID) -- Foreign key to link to the Suppliers table
);

CREATE TABLE Sales (
    Sale_ID INT AUTO_INCREMENT PRIMARY KEY,
    Product_ID INT NOT NULL,
    Quantity_Sold INT NOT NULL,
    Sales_Date DATE NOT NULL,
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

INSERT INTO Brands (Brand_Name)
VALUES
('Fenty Beauty'),
('Estee Lauder'),
('Dior'),
('Tarte'),
('Clinique'),
('Lancome'),
('Drunk Elephant'),
('Rare Beauty'),
('Huda Beauty'),
('Gucci'),
('Nars'),
('Milk Makeup'),
('Too Faced');

SELECT * FROM Brands;

INSERT INTO Categories (Category_Name)
VALUES
('Makeup'),
('Skincare'),
('Fragrance');

SELECT * FROM Categories;

INSERT INTO Suppliers (Supplier_Name, Contact_Person, Email, Phone, Address)
VALUES
('Fenty Labs', 'Robyn Fenty', 'contact@fentylabs.com', '+1-202-555-0101', 'New York, NY, USA'),
('Lauder Global', 'Jane Doe', 'support@lauderglobal.com', '+1-202-555-0102', 'New York, NY, USA'),
('Dior Fragrances', 'Jean-Claude Dior', 'contact@diorfragrances.com', '+33-1-42-68-53-00', 'Paris, France'),
('Tarte Inc.', 'Maureen Kelly', 'info@tartecosmetics.com', '+1-202-555-0103', 'New York, NY, USA'),
('Clinique Laboratories', 'Emily Green', 'contact@clinique.com', '+1-202-555-0104', 'New York, NY, USA'),
('Lancome Distribution', 'Pierre Dupont', 'support@lancome.com', '+33-1-42-68-53-01', 'Paris, France'),
('Drunk Elephant LLC', 'Tiffany Masterson', 'info@drunkelephant.com', '+1-202-555-0105', 'Austin, TX, USA'),
('Rare Beauty LLC', 'Selena Gomez', 'contact@rarebeauty.com', '+1-202-555-0106', 'Los Angeles, CA, USA'),
('Huda Beauty Ltd.', 'Huda Kattan', 'info@hudabeauty.com', '+971-4-555-0107', 'Dubai, UAE'),
('Gucci Beauty', 'Marco Bizzarri', 'support@guccibeauty.com', '+39-02-8800-5555', 'Milan, Italy'),
('NARS Cosmetics', 'François Nars', 'info@narscosmetics.com', '+1-202-555-0108', 'New York, NY, USA'),
('Milk Makeup', 'Georgie Greville', 'contact@milkmakeup.com', '+1-202-555-0109', 'Los Angeles, CA, USA'),
('Too Faced Inc.', 'Jerrod Blandino', 'support@toofaced.com', '+1-202-555-0110', 'Irvine, CA, USA');

SELECT * FROM Suppliers;

INSERT INTO Products (Product_Name, Brand_ID, Category_ID, Supplier_ID, Price, Stock, Rating)
VALUES
('Easy Bake Loose Powder', 9, 1, 9, 30.00, 200, 4.5),   -- Huda Beauty
('Hydro Grip Primer', 12, 1, 12, 35.00, 100, 4.0),      -- Milk Makeup
('Powermatte Lipstick', 11, 1, 11, 28.00, 135, 4.65),   -- NARS
('Plumping Gloss', 13, 1, 13, 25.00, 125, 4.21),        -- Too Faced
('Shape Tape', 4, 1, 4, 25.00, 200, 3.89),              -- Tarte
('Liquid Blush', 8, 1, 8, 20.00, 150, 5.0),             -- Rare Beauty
('Miss Dior', 3, 3, 3, 75.00, 250, 4.35),               -- Dior
('La Vie Est Belle', 6, 3, 6, 100.00, 100, 4.67),       -- Lancome
('Clarifique Pro-Solution Serum', 6, 2, 6, 120.00, 150, 3.45), -- Lancome
('Lala Cream', 7, 2, 7, 56.00, 120, 3.78),              -- Drunk Elephant
('Essence Pour Homme', 10, 3, 10, 82.00, 175, 3.0),     -- Gucci
('Moisture Surge', 5, 2, 5, 62.00, 280, 4.65),          -- Clinique
('Black Honey Lipstick', 5, 1, 5, 20.00, 200, 4.35),    -- Clinique
('Sauvage', 3, 3, 3, 70.00, 180, 3.9);                  -- Dior

SELECT * FROM Products;



INSERT INTO Sales (Product_ID, Quantity_Sold, Sales_Date)
VALUES
(5, 120, '2024-01-05'), 
(3, 70, '2024-01-12'),   
(7, 80, '2024-01-20'),   
(2, 110, '2024-02-01'),  
(6, 170, '2024-02-10'),  
(9, 90, '2024-02-15'),   
(8, 100, '2024-03-05'),  
(10, 50, '2024-03-10'),  
(4, 60, '2024-03-20'),   
(1, 50, '2024-04-01'),   
(14, 120, '2024-04-12'), 
(13, 180, '2024-04-25'), 
(11, 155, '2024-05-03'), 
(12, 99, '2024-05-15');

SELECT * FROM Sales;

-- CREATE A VIEW

CREATE VIEW Monthly_Revenue_Per_Product AS
SELECT
DATE_FORMAT(Sales_Date, '%Y-%m') AS Sales_Month,
p.Product_Name,
SUM(s.Quantity_Sold * p.Price) AS Total_Revenue
FROM Sales s
JOIN Products p ON s.Product_ID = p.Product_ID
GROUP BY Sales_Month, p.Product_Name
ORDER BY Sales_Month, Total_Revenue DESC;

SELECT * FROM Monthly_Revenue_Per_Product;


-- Products with Sales Above Average - example query with subquery

SELECT
p.Product_Name,
SUM(s.Quantity_Sold) AS Total_Quantity_Sold
FROM Products p
JOIN Sales s ON p.Product_ID = s.Product_ID
GROUP BY p.Product_Name
HAVING SUM(s.Quantity_Sold) > (
-- Subquery to calculate the average total quantity sold across all products
SELECT AVG(Total_Quantity_Sold)
FROM (
SELECT SUM(s.Quantity_Sold) AS Total_Quantity_Sold
FROM Sales s
GROUP BY s.Product_ID
) AS AvgSales
)
ORDER BY Total_Quantity_Sold DESC;





DELIMITER $$

CREATE FUNCTION GetTotalSalesRevenueByProduct(Product_ID INT)
RETURNS DECIMAL(10, 2)
DETERMINISTIC
BEGIN
    DECLARE Total_Revenue DECIMAL(10, 2);  -- Declare a variable to store total revenue
    
    -- Calculate total sales revenue for the given product
    SELECT SUM(s.Quantity_Sold * p.Price)
    INTO Total_Revenue
    FROM Sales s
    JOIN Products p ON s.Product_ID = p.Product_ID
    WHERE p.Product_ID = Product_ID;  -- Make sure the case matches
    
    -- Return the total revenue
    RETURN Total_Revenue;
END$$

DELIMITER ;


SELECT GetTotalSalesRevenueByProduct(13) AS Total_Revenue;


DELIMITER ;


-- Advanced Requirements, Stored Procedure: Retrieve Sales by Date Range

DELIMITER $$

CREATE PROCEDURE GetSalesByDateRange(IN start_date DATE, IN end_date DATE)
BEGIN
    SELECT
        p.Product_Name,
        b.Brand_Name,      
        s.Quantity_Sold,
        s.Sales_Date
    FROM Sales s
    JOIN Products p ON s.Product_ID = p.Product_ID
    JOIN Brands b ON p.Brand_ID = b.Brand_ID
    WHERE s.Sales_Date BETWEEN start_date AND end_date
    ORDER BY s.Sales_Date;
END$$

DELIMITER ;


CALL GetSalesByDateRange('2024-01-01', '2024-03-31');

DROP PROCEDURE IF EXISTS GetSalesByDateRange;


-- Trigger

DELIMITER $$

CREATE TRIGGER UpdateStockAfterSale
AFTER INSERT ON Sales
FOR EACH ROW
BEGIN
    -- Decrease the stock of the product based on the quantity sold
    UPDATE Products
    SET Stock = Stock - NEW.Quantity_Sold
    WHERE Product_ID = NEW.Product_ID;
END$$

DELIMITER ;

INSERT INTO Sales (Product_ID, Quantity_Sold, Sales_Date)
VALUES (1, 10, '2024-06-01');

