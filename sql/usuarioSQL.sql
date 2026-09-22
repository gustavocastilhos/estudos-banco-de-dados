CREATE DATABASE regra_constraint;



CREATE TABLE usuario(
id_cliente INT AUTO_INCREMENT,
nome VARCHAR (50)NOT NULL,
cpf BIGINT UNIQUE,
pais VARCHAR (50) DEFAULT 'Brasil',
graduado ENUM('Sim','Nao'),
num_filhos INT,
CHECK (num_filhos >= 0),
PRIMARY KEY (id_cliente));


SELECT * FROM usuario;

INSERT INTO usuario
(nome, cpf, pais,graduado,num_filhos)
VALUES
('jose', 12345678912, 'Brasil', 'Sim', 2);


-- cpf diferente
INSERT INTO usuario
(nome, cpf, pais,graduado,num_filhos)
VALUES
('ronaldo', 12345678911, 'Brasil', 'Sim', 2);

-- sem colocar pais
INSERT INTO usuario
(nome, cpf,graduado,num_filhos)
VALUES
('carlos', 12345678910, 'Sim', 2);


-- colocar incompleto na graduação, não vai rodar
INSERT INTO usuario
(nome, cpf,graduado,num_filhos)
VALUES
('Maria', 12345678914, 'incompleto', 2);

-- colocar sim na gradução
INSERT INTO usuario
(nome, cpf,graduado,num_filhos)
VALUES
('Maria', 12345678914, 'Sim', 2);

-- colocar NUMERO de filhos NEGATIVO, vai dar erro
INSERT INTO usuario
(nome, cpf, pais, graduado, num_filhos)
VALUES
('Camila', 12345678915,'brasil', 'Sim', -1);

-- colocar NUMERO de filhos certo
INSERT INTO usuario
(nome, cpf, pais, graduado, num_filhos)
VALUES
('Camila', 12345678915,'brasil', 'Sim', 3);
