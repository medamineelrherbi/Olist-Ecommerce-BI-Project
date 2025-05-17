
-- 1. dim_date
CREATE TABLE dim_date (
    date_key INT PRIMARY KEY,              -- YYYYMMDD format
    [date] DATE NOT NULL,
    month_number TINYINT NOT NULL,
    month_name NVARCHAR(20) NOT NULL,
    quarter TINYINT NOT NULL,
    [year] SMALLINT NOT NULL,
    year_month NVARCHAR(7) NOT NULL        -- YYYY-MM format
);
GO


CREATE TABLE Fournisseur (
    ProductName NVARCHAR(255) NOT NULL PRIMARY KEY,
    SupplierName NVARCHAR(100),
    SupplierCountry NVARCHAR(50)
);
GO

-- 3. dim_product
CREATE TABLE dim_product (
    product_key INT PRIMARY KEY IDENTITY(1,1),
    product_id NVARCHAR(50) NOT NULL UNIQUE, -- Business Key from source
    product_category NVARCHAR(100),
    ProductName NVARCHAR(255) NULL,          -- Foreign Key to Fournisseur table
    CONSTRAINT FK_dim_product_Fournisseur FOREIGN KEY (ProductName) REFERENCES Fournisseur(ProductName)
);
GO

-- 4. dim_seller
CREATE TABLE dim_seller (
    seller_key INT PRIMARY KEY IDENTITY(1,1),
    seller_id NVARCHAR(50) NOT NULL UNIQUE,  -- Business Key from source
    seller_city NVARCHAR(100),
    seller_state NVARCHAR(50)
);
GO

-- 5. dim_customer
CREATE TABLE dim_customer (
    customer_key INT PRIMARY KEY IDENTITY(1,1),
    customer_unique_id NVARCHAR(50) NOT NULL UNIQUE, -- Business Key from source
    customer_zip_code NVARCHAR(20),
    customer_city NVARCHAR(100),
    customer_state NVARCHAR(50)
);
GO

-- 6. dim_order_status
CREATE TABLE dim_order_status (
    order_status_key INT PRIMARY KEY IDENTITY(1,1),
    order_status NVARCHAR(50) NOT NULL UNIQUE -- Business Key (e.g., 'delivered', 'shipped')
);
GO

-- 7. dim_review
CREATE TABLE dim_review (
    review_key INT PRIMARY KEY IDENTITY(1,1),
    review_id NVARCHAR(50) NOT NULL UNIQUE, -- Business Key from source
    review_score TINYINT,
    review_date_key INT NULL,               -- Optional: if a review has a date
    CONSTRAINT FK_dim_review_dim_date FOREIGN KEY (review_date_key) REFERENCES dim_date(date_key)
);
GO


-- 8. dim_delivery
CREATE TABLE dim_delivery (
    delivery_key INT PRIMARY KEY IDENTITY(1,1),
    order_id NVARCHAR(50) NOT NULL UNIQUE,       
    estimated_delivery_date_key INT NULL,
    actual_delivery_date_key INT NULL,
    approved_at_date_key INT NULL,          
    delay_days INT NULL,
    CONSTRAINT FK_dim_delivery_est_date FOREIGN KEY (estimated_delivery_date_key) REFERENCES dim_date(date_key),
    CONSTRAINT FK_dim_delivery_act_date FOREIGN KEY (actual_delivery_date_key) REFERENCES dim_date(date_key),
    CONSTRAINT FK_dim_delivery_app_date FOREIGN KEY (approved_at_date_key) REFERENCES dim_date(date_key)
);
GO




-- 9. fact_orders
CREATE TABLE fact_orders (
    order_key INT PRIMARY KEY IDENTITY(1,1), 
    order_id NVARCHAR(50) NOT NULL UNIQUE,   
    customer_key INT NULL,
    order_status_key INT NULL,
    purchase_date_key INT NULL,
    delivery_key INT NULL,
    review_key INT NULL,                     -- Link to the specific review for this order
    total_price DECIMAL(18,2) NULL,
    total_freight_value DECIMAL(18,2) NULL,
    item_count INT NULL,

    CONSTRAINT FK_fact_orders_dim_customer FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key),
    CONSTRAINT FK_fact_orders_dim_order_status FOREIGN KEY (order_status_key) REFERENCES dim_order_status(order_status_key),
    CONSTRAINT FK_fact_orders_dim_date_purchase FOREIGN KEY (purchase_date_key) REFERENCES dim_date(date_key),
    CONSTRAINT FK_fact_orders_dim_delivery FOREIGN KEY (delivery_key) REFERENCES dim_delivery(delivery_key),
    CONSTRAINT FK_fact_orders_dim_review FOREIGN KEY (review_key) REFERENCES dim_review(review_key)
);
GO

-- 10. fact_order_items
CREATE TABLE fact_order_items (
    order_item_key INT PRIMARY KEY IDENTITY(1,1), 
    order_key INT NOT NULL,                       -- Foreign Key to fact_orders
    product_key INT NULL,
    seller_key INT NULL,
    price DECIMAL(18,2) NULL,
    freight_value DECIMAL(18,2) NULL,
    order_item_id INT NULL,                       

    CONSTRAINT FK_fact_order_items_fact_orders FOREIGN KEY (order_key) REFERENCES fact_orders(order_key),
    CONSTRAINT FK_fact_order_items_dim_product FOREIGN KEY (product_key) REFERENCES dim_product(product_key),
    CONSTRAINT FK_fact_order_items_dim_seller FOREIGN KEY (seller_key) REFERENCES dim_seller(seller_key)
);
GO

PRINT 'All tables created successfully.';