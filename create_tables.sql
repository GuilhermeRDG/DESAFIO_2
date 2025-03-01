
/*
DROP TABLE Category CASCADE;
DROP TABLE Customer CASCADE;
DROP TABLE Item CASCADE;
DROP TABLE "Order" CASCADE;
DROP TABLE Order_Item CASCADE;
DROP TABLE Item_History CASCADE;
*/







-- Criando tabelas
CREATE TABLE Category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    path TEXT NOT NULL
);

CREATE TABLE Customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    birth_date DATE,
    phone VARCHAR(20),
    user_type VARCHAR(50) NOT NULL 
);

CREATE TABLE Item (
    item_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category_id INT REFERENCES Category(category_id),
    seller_id INT REFERENCES Customer(customer_id),
    price DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL
);

CREATE TABLE "Order" (
    order_id SERIAL PRIMARY KEY,
    buyer_id INT REFERENCES Customer(customer_id),
    order_date DATE NOT NULL
);

CREATE TABLE Order_Item (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT REFERENCES "Order"(order_id),
    item_id INT REFERENCES Item(item_id),
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE Item_History (
    history_id SERIAL PRIMARY KEY,
    item_id INT REFERENCES Item(item_id),
    record_date DATE NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    UNIQUE (item_id, record_date)
);