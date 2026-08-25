CREATE DATABASE gestao_projetos;

USE gestao_projetos;

	CREATE TABLE empresa (
	id_empresa INT NOT NULL,
	codigoempresa INT,
	nomeempresa VARCHAR(45),
	rua VARCHAR(45),
	numero INT,
	bairro VARCHAR(45),
	cidade VARCHAR(45),
	estado VARCHAR(45),
	cep INT,
	PRIMARY KEY (id_empresa)
	);

	CREATE TABLE consultor (
	id_consultor INT NOT NULL,
	nomeconsultor VARCHAR(100),
	cpf BIGINT,
	especializacao VARCHAR(45),
	funcaoexercida VARCHAR(45),
	PRIMARY KEY (id_consultor)
	);

	CREATE TABLE unidade (
	id_unidade INT NOT NULL,
	nomegerente VARCHAR(45),
	nomesupervisor VARCHAR(45),
	PRIMARY KEY (id_unidade)
	);

	CREATE TABLE departamento (
	id_departamento INT NOT NULL,
	nomedepartamento VARCHAR(45),
	sigla VARCHAR(10),
	centrocusto INT,
	unidade_id_unidade INT,
	PRIMARY KEY (id_departamento),
	FOREIGN KEY (unidade_id_unidade)
	REFERENCES unidade (id_unidade)
	);

	CREATE TABLE projeto (
	id_projeto INT NOT NULL,
	numeroprojeto INT,
	datainicio DATE,
	datafim DATE,
	valorprojeto DECIMAL(8,2),
	departamento_id_departamento INT,
	empresa_id_empresa INT,
	consultor_id_consultor INT,
	PRIMARY KEY (id_projeto),
	FOREIGN KEY (departamento_id_departamento)
	REFERENCES departamento (id_departamento),
	FOREIGN KEY (empresa_id_empresa)
	REFERENCES empresa (id_empresa),
	FOREIGN KEY (consultor_id_consultor)
	REFERENCES consultor (id_consultor)
	);