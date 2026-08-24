	CREATE DATABASE usinagem2;

	USE usinagem2;

	CREATE TABLE fornecedor (
	idfornecedor INT NOT NULL,
	nome VARCHAR (100),
	nacionalidade VARCHAR(100),
	PRIMARY KEY (idfornecedor)
	);

	CREATE TABLE categoria (
	idcategoria INT NOT NULL,
	descricao VARCHAR(100),
	PRIMARY KEY (idcategoria)
	);

	-- DROP TABLE categoria;

	CREATE TABLE peca (
	idpeca INT NOT NULL,
	nome VARCHAR (100),
	peso DECIMAL(8,2),
	ano_fabricacao DATE,
	fornecedor_id INT,
	categoria_id INT,
	PRIMARY KEY (idpeca),
	FOREIGN KEY (fornecedor_id)
	REFERENCES fornecedor (idfornecedor),
	FOREIGN KEY (categoria_id)
	REFERENCES categoria (idcategoria)
	);



