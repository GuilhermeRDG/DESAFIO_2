--1. Listar los usuarios que cumplan años el día de hoy cuya cantidad de ventas realizadas en enero 2020 sea superior a 1500. 
SELECT c.first_name, c.last_name, c.email
FROM Customer c
JOIN Item i ON c.customer_id = i.seller_id
JOIN Order_Item oi ON i.item_id = oi.item_id
JOIN "Order" o ON oi.order_id = o.order_id
WHERE c.birth_date = CURRENT_DATE
AND o.order_date BETWEEN '2020-01-01' AND '2020-01-31'
GROUP BY c.customer_id
HAVING SUM(oi.quantity * oi.unit_price) > 1500;



--2. Por cada mes del 2020, se solicita el top 5 de usuarios que más vendieron($) en la categoría Celulares. 
--Se requiere el mes y año de análisis, nombre y apellido del vendedor, cantidad de ventas realizadas, cantidad de productos vendidos y el monto total transaccionado. 
SELECT 
    TO_CHAR(o.order_date, 'YYYY-MM') AS month_year,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT o.order_id) AS num_sales,
    SUM(oi.quantity) AS num_products_sold,
    SUM(oi.quantity * oi.unit_price) AS total_sales
FROM Customer c
JOIN Item i ON c.customer_id = i.seller_id
JOIN Order_Item oi ON i.item_id = oi.item_id
JOIN "Order" o ON oi.order_id = o.order_id
JOIN Category cat ON i.category_id = cat.category_id
WHERE cat.name = 'Celulares'
AND o.order_date BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY month_year, c.customer_id
ORDER BY month_year, total_sales DESC, num_products_sold DESC
LIMIT 5;






--3. Se solicita poblar una nueva tabla con el precio y estado de los Ítems a fin del día. Tener en cuenta que debe ser reprocesable. Vale resaltar que en la tabla Item, vamos a tener únicamente el último estado informado por la PK definida. (Se puede resolver a través de StoredProcedure) 
CREATE OR REPLACE PROCEDURE Populate_Item_Daily_History() 
LANGUAGE plpgsql
AS $$
BEGIN
    -- Inserir os dados atuais dos itens na tabela de histórico diário
    INSERT INTO Item_Daily_History (item_id, record_date, price, status)
    SELECT
        item_id,
        CURRENT_DATE AS record_date, -- Usa a data atual
        price,
        status
    FROM Item
    ON CONFLICT (item_id, record_date) DO NOTHING; -- Evita duplicatas
END;
$$;


CALL Populate_Item_Daily_History();
