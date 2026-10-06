CREATE DATABASE estacionamento_abc;

USE estacionamento_abc;

CREATE TABLE Cliente (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(45),
    dt_Nascimento DATE
);

CREATE TABLE Categoria (
    id_categoria INT PRIMARY KEY,
    nome VARCHAR(45),
    descricao VARCHAR(45)
);

CREATE TABLE Veiculo (
    id_veiculo INT PRIMARY KEY,
    placa VARCHAR(45),
    cor VARCHAR(45),
    cliente_id INT,
    categoria_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Cliente (id_cliente),
    FOREIGN KEY (categoria_id) REFERENCES Categoria (id_categoria)
);

CREATE TABLE Estacionamento (
    id_estacionamento INT PRIMARY KEY,
    nome VARCHAR(45),
    capacidade INT,
    dt_entrada DATE,
    dt_saida DATE,
    hs_entrada TIME,
    hs_saida TIME,
    veiculo_id INT,
    FOREIGN KEY (veiculo_id) REFERENCES Veiculo (id_veiculo)
);



INSERT INTO Cliente (id_cliente, nome, dt_Nascimento) VALUES
('1', 'João Silva', '1985-04-12'),
('2', 'Maria Santos', '1992-08-25'),
('3', 'Carlos Oliveira', '1978-11-03');

INSERT INTO Categoria (id_categoria, nome, descricao) VALUES
('1', 'Utilitario', 'Veiculos utilitarios leves e comerciais'),
('2', 'Van', 'Veiculos de transporte de passageiros'),
('3', 'Pick-up', 'Camionetas com cacamba aberta');

INSERT INTO Veiculo (id_veiculo, placa, cor, cliente_id, categoria_id) VALUES
('1', 'AAA-2020', 'Preto', '1', '2'),
('2', 'BBB-1111', 'Branco', '1', '3'),
('3', 'CCCC-5050', 'Azul', '2', '3'),
('4', 'DDD-1234', 'Branco', '1', '2'),
('5', 'RRR-2525', 'Azul', '1', '2');

INSERT INTO Estacionamento (id_estacionamento, nome, capacidade, dt_entrada, dt_saida, hs_entrada, hs_saida, veiculo_id) VALUES
('1', 'Estacionamento Centro', 50, '2024-10-10', '2024-10-10', '08:30:00', '12:00:00', '1'),
('2', 'Estacionamento Aeroporto', 200, '2024-10-10', '2024-10-10', '14:30:00', '18:15:00', '2'),
('3', 'Estacionamento Plaza', 100, '2024-10-11', '2024-10-11', '09:00:00', '17:30:00', '3');


SELECT * FROM Cliente;
SELECT * FROM Categoria;
SELECT * FROM Veiculo;
SELECT * FROM Estacionamento;


SELECT * 
FROM Veiculo
INNER JOIN Cliente ON Veiculo.cliente_id = Cliente.id_cliente
INNER JOIN Categoria ON Veiculo.categoria_id = Categoria.id_categoria;

SELECT * 
FROM Veiculo
LEFT JOIN Cliente ON Veiculo.cliente_id = Cliente.id_cliente;

SELECT * 
FROM Veiculo
RIGHT JOIN Categoria ON Veiculo.categoria_id = Categoria.id_categoria;

SELECT * 
FROM Veiculo
FULL JOIN Cliente ON Veiculo.cliente_id = Cliente.id_cliente;

SELECT 
    Veiculo.id_veiculo,
    Veiculo.placa AS placa_registrada,
    Veiculo.cor,
    Cliente.nome AS nome_do_cliente
FROM Veiculo
INNER JOIN Cliente ON Veiculo.cliente_id = Cliente.id_cliente;

CREATE VIEW vw_veiculo_cliente AS
SELECT 
    Veiculo.id_veiculo,
    Veiculo.placa AS placa_registrada,
    Veiculo.cor,
    Cliente.nome AS nome_do_cliente
FROM Veiculo
INNER JOIN Cliente ON Veiculo.cliente_id = Cliente.id_cliente;