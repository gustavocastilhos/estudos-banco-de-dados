-- Comando para criar um novo banco de dados
CREATE DATABASE usinagem;

-- Comando serve para habilitar o banco
USE usinagem;

-- Criar a tabela 
CREATE TABLE fornecedor (
idfornecedor INT NOT NULL,
nome VARCHAR (100),
nacionalidade VARCHAR(100),
PRIMARY KEY (idfornecedor)
);

-- Comando para apagar a tabela
DROP TABLE fornecedor;

-- Adicionar nova coluna em tabela ja existente
ALTER TABLE fornecedor 
ADD COLUMN descricao TEXT;

-- Comando para criar tabela peça

CREATE TABLE peca (
idpeca INT NOT NULL,
nome VARCHAR (100),
peso DECIMAL(8,2),
ano_fabricacao DATE,
fornecedor_id INT,
PRIMARY KEY (idpeca),
FOREIGN KEY (fornecedor_id)
REFERENCES fornecedor (idfornecedor)
);

-- Apagar chave estrangeira
ALTER TABLE vaga
DROP FOREIGN KEY vaga_ibfk_1;

-- adicionar chave estrangeira
ALTER TABLE vaga
ADD  FOREIGN KEY (setor_id)
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
RENAME COLUMN codigo_barra to 

-- Mudar o nome da tabela
ALTER TABLE estacionamento
RENAME TO parking;
