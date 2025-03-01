INSERT INTO Category (name, path) VALUES
('Celulares', 'eletronicos/celulares'),
('Eletrônicos', 'eletronicos'),
('Acessórios', 'eletronicos/acessorios');




INSERT INTO Customer (first_name, last_name, email, birth_date, phone, user_type) VALUES
('João', 'Silva', 'joao.silva@example.com', '1990-02-28', '123456789', 'seller'),
('Maria', 'Santos', 'maria.santos@example.com', '1985-10-20', '987654321', 'seller'),
('Pedro', 'Oliveira', 'pedro.oliveira@example.com', '1992-03-25', '555555555', 'buyer'),
('Ana', 'Costa', 'ana.costa@example.com', '1988-07-10', '111111111', 'buyer'),
('Carlos', 'Pereira', 'carlos.pereira@example.com', '1995-12-05', '222222222', 'seller'),
('Teste', 'Aniversário', 'teste.aniversario@example.com', CURRENT_DATE, '999999999', 'seller'); -- Usuário com aniversário hoje



INSERT INTO Item (name, category_id, seller_id, price, status) VALUES
('Smartphone X', 1, 1, 1500.00, 'available'),
('Smartphone Y', 1, 2, 1200.00, 'available'),
('Smartphone Z', 1, 5, 1000.00, 'available'),
('Fone de Ouvido', 3, 1, 200.00, 'available'),
('Capa de Celular', 3, 2, 50.00, 'available'),
('Smartphone Teste', 1, 6, 2000.00, 'available'); -- Item vendido pelo usuário com aniversário hoje





INSERT INTO "Order" (buyer_id, order_date) VALUES
(3, '2020-01-10'),
(4, '2020-01-15'),
(3, '2020-01-20'),
(4, '2020-02-05'),
(3, '2020-02-10'),
(3, '2020-01-15'); -- Pedido para o usuário com aniversário hoje





INSERT INTO Order_Item (order_id, item_id, quantity, unit_price) VALUES
(1, 1, 1, 1500.00),
(2, 2, 1, 1200.00),
(3, 3, 2, 1000.00),
(4, 1, 1, 1500.00),
(5, 2, 1, 1200.00),
(6, 6, 1, 2000.00); -- Item vendido pelo usuário com aniversário hoje






INSERT INTO Item_History (item_id, record_date, price, status) VALUES
(1, '2020-01-01', 1500.00, 'available'),
(2, '2020-01-01', 1200.00, 'available'),
(3, '2020-01-01', 1000.00, 'available'),
(1, '2020-02-01', 1500.00, 'available'),
(2, '2020-02-01', 1200.00, 'available'),
(6, '2020-01-01', 2000.00, 'available'); -- Histórico do item vendido pelo usuário com aniversário hoje



