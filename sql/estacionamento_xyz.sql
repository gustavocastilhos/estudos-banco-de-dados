CREATE DATABASE estacionamento_xyz;

USE estacionamento_xyz;


CREATE TABLE Estacionamento (
    id_estacionamento INT PRIMARY KEY,
    nome VARCHAR(45),
    capacidade INT,
	subsolo ENUM ('Não','Sim'),
	especial ENUM ('Não','Sim')
);

INSERT INTO Estacionamento (id_estacionamento, nome, capacidade, subsolo, especial) VALUES
('1', 'Estacionamento A', 20, 'Não', 'Não'),
('2', 'Estacionamento B', 35, 'Sim', 'Sim'),
('3', 'Estacionamento C', 40, 'Sim', 'Sim'),
('4', 'Estacionamento D', 50, 'Sim', 'Sim'),
('5', 'Estacionamento E', 15, 'Sim', 'Não'),
('6', 'Estacionamento F', 85, 'Sim', 'Sim'),
('7', 'Estacionamento G', 100, 'Não', 'Não');


SELECT nome, capacidade 
FROM Estacionamento 
WHERE especial = 'Sim' AND subsolo = 'Sim';

SELECT * FROM Estacionamento 
WHERE especial = 'Sim';


SELECT * FROM Estacionamento 
WHERE capacidade > 50
ORDER BY capacidade DESC; -- decresente

SELECT * FROM Estacionamento 
WHERE capacidade > 50
ORDER BY capacidade ASC; -- ascendente


SELECT nome, capacidade FROM Estacionamento 
WHERE especial = 'Sim' AND subsolo = 'Sim ' AND capacidade >= 20 AND capacidade <= 40 
ORDER BY capacidade ASC;



 
