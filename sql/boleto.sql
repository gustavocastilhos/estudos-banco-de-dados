CREATE DATABASE boleto;

USE boleto;

CREATE TABLE cliente (
id_cliente INT PRIMARY KEY,
nome VARCHAR(45)

);


CREATE TABLE Mensalidade (
    id_mensalidade INT PRIMARY KEY,
	cliente_id INT,
    valor DECIMAL,
    status_pagamento ENUM('Pago', 'Não pago'),
    FOREIGN KEY (cliente_id) REFERENCES Cliente (id_cliente)
);

INSERT INTO cliente (id_cliente, nome) VALUES
('1', 'Jose'),
('2', 'Carlos'),
('3', 'Marco');



INSERT INTO Mensalidade (id_mensalidade, cliente_id, valor, status_pagamento) VALUES
('1', '1', '650', 'Pago'),
('2', '2', '670', 'Pago'),
('3', '3', '690', 'Pago'),
('4', '1', '720', 'Não pago'),
('5', '2', '740', 'Não pago'),
('6', '3', '760', 'Não pago'),
('7', '3', '800', 'Não pago');


SELECT * FROM Cliente;

SELECT * FROM Mensalidade;

SELECT count(Mensalidade.status_pagamento) FROM Mensalidade;

SELECT cliente.nome, count(Mensalidade.status_pagamento) FROM Mensalidade
JOIN Cliente
ON Cliente.id_cliente = Mensalidade.cliente_id
GROUP BY cliente.nome;

SELECT cliente.nome, count(Mensalidade.status_pagamento),sum(Mensalidade.valor),avg(mensalidade.valor) FROM Mensalidade
JOIN Cliente
ON Cliente.id_cliente = Mensalidade.cliente_id
GROUP BY cliente.nome;
