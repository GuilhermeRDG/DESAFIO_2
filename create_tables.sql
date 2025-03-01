
/*
DROP TABLE Cliente CASCADE;
DROP TABLE Categoria CASCADE;
DROP TABLE Item CASCADE;
DROP TABLE Item_Diario CASCADE;
DROP TABLE Pedido CASCADE;
*/


-- Tabela Cliente
CREATE TABLE Cliente (
    cliente_id SERIAL PRIMARY KEY,
    email VARCHAR(100) NOT NULL UNIQUE,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    sexo CHAR(1),
    endereco VARCHAR(200),
    data_nascimento DATE,
    telefone VARCHAR(15)
);

-- Tabela Categoria
CREATE TABLE Categoria (
    categoria_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    caminho VARCHAR(200)
);

-- Tabela Item
CREATE TABLE Item (
    item_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    data_retirada DATE,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES Categoria(categoria_id)
);

-- Tabela Pedido
CREATE TABLE Pedido (
    pedido_id SERIAL PRIMARY KEY,
    cliente_id INT,
    item_id INT,
    data_pedido TIMESTAMP NOT NULL,
    quantidade INT NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Cliente(cliente_id),
    FOREIGN KEY (item_id) REFERENCES Item(item_id)
);

-- Tabela Item_Diario
CREATE TABLE Item_Diario (
    item_id INT,
    preco DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL,
    data DATE NOT NULL,
    PRIMARY KEY (item_id, data),
    FOREIGN KEY (item_id) REFERENCES Item(item_id)
);
