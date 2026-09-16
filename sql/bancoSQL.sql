CREATE TABLE categoria_cliente (
	cod_categoria_cliente INT NOT NULL,
	nom_categoria VARCHAR(100),
	PRIMARY KEY (cod_categoria_cliente)
);

CREATE TABLE agencia (
	num_agencia INT NOT NULL,
	nom_agencia VARCHAR(100),
	PRIMARY KEY (num_agencia)
);

CREATE TABLE tipo_conta (
	cod_tipo_conta INT NOT NULL,
	des_tipo_conta VARCHAR(100),
	PRIMARY KEY (cod_tipo_conta)
);

CREATE TABLE cliente (
	cod_cliente INT NOT NULL,
	nom_cliente VARCHAR(100),
	num_cpf_cnpj VARCHAR(20),
	num_celular VARCHAR(20),
	des_rua VARCHAR(100),
	num_endereco VARCHAR(10),
	nom_bairro VARCHAR(50),
	num_cep VARCHAR(10),
	nom_cidade VARCHAR(50),
	sgl_estado CHAR(2),
	categoria_cliente_cod_categoria_cliente INT,
	PRIMARY KEY (cod_cliente),
	FOREIGN KEY (categoria_cliente_cod_categoria_cliente)
	REFERENCES categoria_cliente (cod_categoria_cliente)
);

CREATE TABLE conta (
	num_conta INT NOT NULL,
	val_saldo DECIMAL(8,2),
	agencia_num_agencia INT,
	cliente_cod_cliente INT,
	tipo_conta_cod_tipo_conta INT,
	PRIMARY KEY (num_conta),
	FOREIGN KEY (agencia_num_agencia)
	REFERENCES agencia (num_agencia),
	FOREIGN KEY (cliente_cod_cliente)
	REFERENCES cliente (cod_cliente),
	FOREIGN KEY (tipo_conta_cod_tipo_conta)
	REFERENCES tipo_conta (cod_tipo_conta)
);