CREATE DATABASE loja_z;

USE loja_z;

DROP TABLE cliente;

CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY ,
    nome VARCHAR(45),
	cidade VARCHAR(45)									
);

CREATE TABLE acompanhamento (
    c INT PRIMARY KEY ,
    situação VARCHAR(45)									
);

CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY ,
    data_pedido DATE,
	valor DECIMAL(8,2),	
    cliente_id INT,
    acompanhamento_id INT,
    FOREIGN KEY (cliente_id)
	REFERENCES cliente (id_cliente),
    FOREIGN KEY (acompanhamento_id)
	REFERENCES acompanhamento (id_acompanhamento)
);

CREATE VIEW pai_filho AS
SELECT * FROM pai
JOIN filho
    ON pai.filho_id = filho.id_filho;
    
SELECT * FROM pai_filho;

CREATE TABLE filho(
id_filho INT PRIMARY KEY,
nome_filho VARCHAR(45)
);
CREATE TABLE pai(
id_pai INT PRIMARY KEY,
nome_pai VARCHAR(45),
filho_id iNT,
 FOREIGN KEY (filho_id)
REFERENCES filho (id_filho)
);

INSERT INTO filho(id_filho, nome_filho) VALUES
('1','Joaozinho'),
('2','Mariazinha'),
('3','Carlnha'),
('4','Aninha');

INSERT INTO pai(id_pai, nome_pai, filho_id) VALUES
('1','Antonio','4'),
('2','Antonio','3'),
('3','Carlos','2');

INSERT INTO pai (id_pai, nome_pai) VALUES
('4','Mateus');

INSERT INTO cliente (id_cliente, nome, cidade) VALUES
(1, 'João', 'Macaé'),
(2, 'Carlos', 'Salvador'),
(3, 'Maria', 'Niterói'),
(4, 'Ana', 'Campinas'),
(5, 'Marcos', 'Santos');

INSERT INTO acompanhamento (id_acompanhamento, situação) VALUES
(1, 'Registrado'),
(2, 'Em transporte'),
(3, 'Entregue');

INSERT INTO pedido (id_pedido, data_pedido, valor, cliente_id, acompanhamento_id) VALUES
(1, '2024-09-24', 250.00, 2, 1),
(2, '2024-09-25', 150.00, 1, 2),
(3, '2024-09-25', 450.00, 4, 3);




SELECT * FROM pedido
JOIN cliente
ON pedido.cliente_id = cliente.id_cliente;

SELECT * FROM pedido
JOIN cliente
ON pedido.cliente_id = cliente.id_cliente
JOIN acompanhamento
ON pedido.acompanhamento_id = acompanhamento.id_acompanhamento;


SELECT 
    pedido.id_pedido,
    pedido.data_pedido,
    cliente.nome,
    acompanhamento.situação 
FROM pedido
JOIN cliente
    ON pedido.cliente_id = cliente.id_cliente
JOIN acompanhamento
    ON pedido.acompanhamento_id = acompanhamento.id_acompanhamento;
    
SELECT pai.nome_pai, filho.nome_filho FROM pai
JOIN filho
ON pai.filho_id = filho.id_filho;

SELECT pai.nome_pai, filho.nome_filho FROM pai
LEFT JOIN filho
ON pai.filho_id = filho.id_filho;


SELECT pai.nome_pai, filho.nome_filho FROM pai
RIGHT JOIN filho
ON pai.filho_id = filho.id_filho;



SELECT pai.nome_pai, filho.nome_filho FROM pai
LEFT JOIN filho
ON pai.filho_id = filho.id_filho
UNION
SELECT pai.nome_pai, filho.nome_filho FROM pai
RIGHT JOIN filho
ON pai.filho_id = filho.id_filho;

SELECT * FROM acompanhamento;
SELECT * FROM cliente;
SELECT * FROM pai;
SELECT * FROM filho;





