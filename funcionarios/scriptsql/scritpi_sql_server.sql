CREATE DATABASE DB_DADOS;

-- Tabela Usuarios
CREATE TABLE Usuarios (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nome VARCHAR(100),
  email VARCHAR(100)
);

-- Tabela Pedidos
CREATE TABLE Pedidos (
  id INT IDENTITY(1,1) PRIMARY KEY,
  usuario_id INT,
  data_pedido DATETIME DEFAULT CURRENT_TIMESTAMP,
  valor_total DECIMAL(10, 2),
  FOREIGN KEY (usuario_id) REFERENCES Usuarios(id)
);

-- Tabela Produtos
CREATE TABLE Produtos (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nome VARCHAR(100),
  preco DECIMAL(10, 2)
);

-- Tabela Itens_Pedido
CREATE TABLE Itens_Pedido (
  id INT IDENTITY(1,1) PRIMARY KEY,
  pedido_id INT,
  produto_id INT,
  quantidade INT CONSTRAINT quantidade_maior_que_zero CHECK (quantidade > 0),
  FOREIGN KEY (pedido_id) REFERENCES Pedidos(id),
  FOREIGN KEY (produto_id) REFERENCES Produtos(id)
);

-- Inserindo registros na tabela Usuarios
INSERT INTO Usuarios (nome, email) VALUES ('João', 'joao@example.com');
INSERT INTO Usuarios (nome, email) VALUES ('Maria', 'maria@example.com');

-- Inserindo registros na tabela Pedidos
INSERT INTO Pedidos (usuario_id, data_pedido, valor_total) VALUES (1, '2023-06-08', 100.50);
INSERT INTO Pedidos (usuario_id, data_pedido, valor_total) VALUES (2, '2023-06-08', 75.20);

-- Inserindo registros na tabela Produtos
INSERT INTO Produtos (nome, preco) VALUES ('Camiseta', 29.90);
INSERT INTO Produtos (nome, preco) VALUES ('Calça', 59.90);

-- Inserindo registros na tabela Itens_Pedido
INSERT INTO Itens_Pedido (pedido_id, produto_id, quantidade) VALUES (1, 1, 2);
INSERT INTO Itens_Pedido (pedido_id, produto_id, quantidade) VALUES (1, 2, 1);

SELECT top 10 * FROM Pedidos ORDER BY data_pedido DESC;

SELECT * FROM Usuarios
JOIN Pedidos ON Usuarios.id = Pedidos.usuario_id
JOIN Itens_Pedido ON Pedidos.id = Itens_Pedido.pedido_id
JOIN Produtos ON Itens_Pedido.produto_id = Produtos.id;

DELETE FROM Pedidos WHERE data_pedido BETWEEN '2023-06-01 00:00:00' AND '2023-06-01 23:59:59';

