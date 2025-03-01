--1. Listar los usuarios que cumplan años el día de hoy cuya cantidad de ventas realizadas en enero 2020 sea superior a 1500. 
SELECT 
    c.nome, 
    c.sobrenome, 
    c.email
FROM 
    Cliente c
JOIN 
    Pedido p ON c.cliente_id = p.cliente_id
WHERE 
    EXTRACT(MONTH FROM c.data_nascimento) = EXTRACT(MONTH FROM CURRENT_DATE)
    AND EXTRACT(DAY FROM c.data_nascimento) = EXTRACT(DAY FROM CURRENT_DATE)
    AND EXTRACT(YEAR FROM p.data_pedido) = 2020
    AND EXTRACT(MONTH FROM p.data_pedido) = 1
GROUP BY 
    c.cliente_id
HAVING 
    SUM(p.valor_total) > 1500;


--2. Por cada mes del 2020, se solicita el top 5 de usuarios que más vendieron($) en la categoría Celulares. 
--Se requiere el mes y año de análisis, nombre y apellido del vendedor, cantidad de ventas realizadas, cantidad de productos vendidos y el monto total transaccionado. 
SELECT 
    EXTRACT(MONTH FROM p.data_pedido) AS mes,
    EXTRACT(YEAR FROM p.data_pedido) AS ano,
    c.nome,
    c.sobrenome,
    COUNT(p.pedido_id) AS numero_vendas,
    SUM(p.quantidade) AS numero_produtos_vendidos,
    SUM(p.valor_total) AS valor_total_transacionado
FROM 
    Pedido p
JOIN 
    Cliente c ON p.cliente_id = c.cliente_id
JOIN 
    Item i ON p.item_id = i.item_id
JOIN 
    Categoria cat ON i.categoria_id = cat.categoria_id
WHERE 
    EXTRACT(YEAR FROM p.data_pedido) = 2020
    AND cat.nome = 'Celulares'
GROUP BY 
    mes, ano, c.cliente_id
ORDER BY 
    mes, ano, valor_total_transacionado DESC
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
        preco,
        status
    FROM Item
    ON CONFLICT (item_id, record_date) DO NOTHING; -- Evita duplicatas
END;
$$;


CALL Populate_Item_Daily_History();
