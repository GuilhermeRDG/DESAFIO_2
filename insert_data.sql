


INSERT INTO Categoria (nome, caminho)
VALUES 
    ('Celulares', 'Eletrônicos > Celulares'),  -- categoria_id = 1
    ('Notebooks', 'Eletrônicos > Computadores > Notebooks');  -- categoria_id = 2



INSERT INTO Cliente (email, nome, sobrenome, sexo, endereco, data_nascimento, telefone)
VALUES 
    ('joao.silva@email.com', 'João', 'Silva', 'M', 'Rua A, 123', '1990-02-28', '11987654321'),  -- cliente_id = 1
    ('maria.oliveira@email.com', 'Maria', 'Oliveira', 'F', 'Rua B, 456', '1985-10-20', '11912345678');  -- cliente_id = 2

    
INSERT INTO Item (nome, descricao, preco, status, data_retirada, categoria_id)
VALUES 
    ('iPhone 13', 'Smartphone Apple', 5000.00, 'Ativo', NULL, 1),  -- item_id = 1, categoria_id = 1 (Celulares)
    ('Samsung Galaxy S21', 'Smartphone Samsung', 4500.00, 'Ativo', NULL, 1),  -- item_id = 2, categoria_id = 1 (Celulares)
    ('MacBook Pro', 'Notebook Apple', 12000.00, 'Ativo', NULL, 2);  -- item_id = 3, categoria_id = 2 (Notebooks)
    
    
INSERT INTO Pedido (cliente_id, item_id, data_pedido, quantidade, valor_total)
VALUES 
    (1, 1, '2020-01-10 14:30:00', 1, 5000.00),  -- cliente_id = 1, item_id = 1 (iPhone 13)
    (2, 2, '2020-01-15 10:00:00', 2, 9000.00),  -- cliente_id = 2, item_id = 2 (Samsung Galaxy S21)
    (1, 3, '2020-02-01 09:00:00', 1, 12000.00);  -- cliente_id = 1, item_id = 3 (MacBook Pro)
    
    
    
