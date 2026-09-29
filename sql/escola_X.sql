CREATE DATABASE Escola_X;

USE escola_X;

CREATE TABLE Aluno (
    id_Aluno INT PRIMARY KEY ,
    nome VARCHAR(45),
    dt_Nascimento DATE,                                
    cpf BIGINT UNIQUE                                      
);

CREATE TABLE Disciplina (
    id_Discplina INT PRIMARY KEY,
    nome VARCHAR(45),
    qtd_creditos INT
);

CREATE TABLE Turma (
    id_Turma INT PRIMARY KEY,
    Turno VARCHAR(45),                                
	disciplinaidDisciplina INT,
	FOREIGN KEY (disciplinaidDisciplina)
	REFERENCES Disciplina (id_Discplina)
);

CREATE TABLE Inscricao (
    id_Inscricao INT PRIMARY KEY,
	dt_inscricao DATE,
    aluno_id INT,
	turma_id INT,                                
	FOREIGN KEY (aluno_id)
	REFERENCES Aluno (id_Aluno),
    FOREIGN KEY (turma_id)
	REFERENCES Turma (id_Turma)
);
CREATE TABLE Mensalidade (
    id_Mensalidade INT PRIMARY KEY,
    dt_nascimento DATE,
    valor DECIMAL,
    staturs_pagamento ENUM('Pago', 'Não pago'),
    inscricao_id int,
    FOREIGN KEY (inscricao_id)
	REFERENCES Inscricao (id_Inscricao)
);


INSERT INTO Aluno (nome, dt_Nascimento,cpf ) VALUES
('Gustavo','2006-01-01','13663561950'),
('Julia', '2002-04-22','13622263950'),
('Roberto', '2016-05-20','11132350070'),
('Tiago', '2000-09-01','86822132250'),
('Bianca', '2001-07-06','66663561950');

INSERT INTO Disciplina (nome, qtd_creditos) VALUES
('Matematica','200'),
('Portugues','200'),
('Redação','150'),
('Ciencia','200'),
('Quimica','180');


INSERT INTO Turma (id_Turma, Turno) VALUES
('1','Matutino'),
('2','Matutino'),
('3','Vespertino'),
('4','Vespertino'),
('5','Vespertino');

INSERT INTO Inscricao (id_Inscricao, dt_Inscricao,aluno_id, turma_id) VALUES
('1','2024-01-01','4','1'),
('2','2024-01-01','3','2'),
('3','2024-01-01','2','3'),
('4','2024-06-01','4','1'),
('5','2024-06-01','3','2'),
('6','2024-06-01','2','3'),
('7','2024-06-01');



SELECT * FROM Turma;
SELECT * FROM Aluno;
SELECT * FROM Disciplina;
SELECT * FROM Inscricao;
SELECT * FROM Mensalidade;




