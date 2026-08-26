CREATE DATABASE estacionamento;

USE estacionamento;

CREATE TABLE ticket (
id_ticket INT NOT NULL,
codigo_barra INT ,
observacao TEXT,
PRIMARY KEY (id_ticket)
);

CREATE TABLE estacionamento (
id_estacionamento INT NOT NULL,
nome VARCHAR(45),
CNPJ BIGINT,
ticket_id int,
PRIMARY KEY (id_estacionamento),
FOREIGN KEY (ticket_id)
REFERENCES ticket (id_ticket)
);

CREATE TABLE setor (
id_setor INT NOT NULL,
nome VARCHAR(45),
descricao VARCHAR(45),
estacionamento_id int,
PRIMARY KEY (id_setor),
FOREIGN KEY (estacionamento_id)
REFERENCES estacionamento (id_estacionamento)
);

CREATE TABLE vaga (
id_vaga INT NOT NULL,
numero_vagas INT,
setor_id int,
PRIMARY KEY (id_vaga),
FOREIGN KEY (setor_id)
REFERENCES setor (id_setor)
);


-- Apagar chave estrangeira
ALTER TABLE vaga
DROP FOREIGN KEY vaga_ibfk_1;


-- adicionar chave estrangeira
ALTER TABLE vaga
ADD FOREIGN KEY (setor_id)
REFERENCES setor (id_setor);


-- adicionar coluna

ALTER TABLE ticket 
ADD COLUMN descricao TEXT;

-- Modificar o tipo de dado de uma coluna
ALTER TABLE ticket 
MODIFY COLUMN descricao VARCHAR(100);

-- apagar coluna

ALTER TABLE ticket
DROP COLUMN descricao;

-- renomear coluna
ALTER TABLE ticket
RENAME COLUMN codigo_barra TO codigo;

-- Mudar o nome da tabela
ALTER TABLE estacionamento
RENAME TO parking;

DESCRIBE setor;
DESCRIBE ticket;

