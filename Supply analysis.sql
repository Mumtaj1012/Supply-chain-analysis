create database supp_mgt;

CREATE TABLE supply_chain (
    product_type VARCHAR(100),
    sku VARCHAR(50) PRIMARY KEY,
    price DECIMAL(10, 2),
    availability INT,
    number_of_products_sold INT,
    revenue_generated DECIMAL(12, 2),
    customer_demographics VARCHAR(100),
    stock_levels INT,
    lead_times INT,
    order_quantities INT,
    shipping_times INT,
    shipping_carriers VARCHAR(100),
    shipping_costs DECIMAL(10, 2),
    supplier_name VARCHAR(100),
    location VARCHAR(100),
    lead_time INT,
    production_volumes INT,
    manufacturing_lead_time INT,
    manufacturing_costs DECIMAL(12, 2),
    inspection_results VARCHAR(50),
    defect_rates DECIMAL(5, 2),
    transportation_modes VARCHAR(100),
    routes VARCHAR(255),
    costs DECIMAL(12, 2)
);

select * from supply_chain limit 5;

DESCRIBE supply_chain;

SELECT * FROM supply_chain WHERE revenue_generated IS NULL;

UPDATE supply_chain
SET supplier_name = TRIM(LOWER(supplier_name)),
    location = TRIM(LOWER(location)),
    shipping_carriers = TRIM(LOWER(shipping_carriers)),
    customer_demographics = TRIM(LOWER(customer_demographics));

SELECT sku, COUNT(*)
FROM supply_chain
GROUP BY sku
HAVING COUNT(*) > 1;

SELECT * FROM supply_chain
WHERE shipping_costs > 10000;


ALTER TABLE supply_chain ADD COLUMN Profit DECIMAL(12,2);

UPDATE supply_chain
SET Profit = revenue_generated - shipping_costs - manufacturing_costs;

ALTER TABLE supply_chain
CHANGE `Product_type` product_type VARCHAR(100),
CHANGE `Revenue_generated` revenue_generated DECIMAL(12,2),
CHANGE `Shipping_costs` shipping_costs DECIMAL(12,2);

SELECT * FROM supply_chain LIMIT 10;
SELECT COUNT(*) FROM supply_chain_data;

