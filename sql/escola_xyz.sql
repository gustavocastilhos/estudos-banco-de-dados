CREATE DATABASE escola_xyz;

-- Tabela aluno
CREATE TABLE aluno (
    Id_aluno INT PRIMARY KEY,
    nome VARCHAR(100)
);

-- Tabela curso
CREATE TABLE curso (
    Id_curso INT PRIMARY KEY,
    nome VARCHAR(100),
    duracao INT
);

-- Tabela inscricao
CREATE TABLE inscricao (
    Id_inscricao INT PRIMARY KEY,
    aluno_id INT,
    dt_inscricao DATE,
    curso_id INT,
    FOREIGN KEY (aluno_id) REFERENCES aluno(Id_aluno),
    FOREIGN KEY (curso_id) REFERENCES curso(Id_curso)
);

-- Tabela mensalidade
CREATE TABLE mensalidade (
    Id_mensalidade INT PRIMARY KEY,
    inscricao_id INT,
    dt_vencimento DATE,
    Valor DECIMAL(10, 2),
    status_pagamento ENUM('Pago', 'Não Pago'),
    FOREIGN KEY (inscricao_id) REFERENCES inscricao(Id_inscricao)
);
-- Inserir alunos (IDs de 1 a 5)
INSERT INTO aluno (Id_aluno, nome) VALUES
(1, 'João Silva'),
(2, 'Maria Santos'),
(3, 'Pedro Costa'),
(4, 'Ana Oliveira'),
(5, 'Luís Pereira');

-- Inserir cursos (IDs de 1 a 5)
INSERT INTO curso (Id_curso, nome, duracao) VALUES
(1, 'Engenharia Informática', 6),
(2, 'Direito', 8),
(3, 'Medicina', 12),
(4, 'Gestão', 6),
(5, 'Arquitetura', 10);

-- Inserir registos na tabela de inscricao
INSERT INTO inscricao (id_inscricao, dt_inscricao, aluno_id, curso_id) VALUES
(1, '2020-01-02', 4, 4),
(2, '2020-01-02', 3, 3),
(3, '2020-01-02', 2, 2),
(4, '2020-06-02', 4, 4),
(5, '2020-06-02', 3, 3),
(6, '2020-06-02', 2, 2),
(7, '2020-06-02', NULL, NULL);

-- Inserir registos na tabela de mensalidade
INSERT INTO mensalidade (id_mensalidade, dt_vencimento, valor, status_pagamento, inscricao_id) VALUES
(1, '2020-01-10', 550.00, 'Pago', 1),
(2, '2020-01-10', 540.00, 'Pago', 2),
(3, '2020-01-10', 530.00, 'Pago', 3),
(4, '2020-06-10', 580.00, 'Não Pago', 4),
(5, '2020-06-10', 570.00, 'Não Pago', 5),
(6, '2020-06-10', 560.00, 'Não Pago', 6);



-- a 
SELECT aluno.nome, sum(mensalidade.Valor) FROM mensalidade
JOIN inscricao ON inscricao.Id_inscricao = mensalidade.inscricao_id
JOIN aluno ON aluno.Id_aluno = inscricao.aluno_id
GROUP BY aluno.nome;

-- b 
SELECT sum(mensalidade.Valor) FROM mensalidade
WHERE mensalidade.status_pagamento = 'Não Pago';

-- c
SELECT aluno.nome, avg(mensalidade.Valor) AS valor_medio FROM mensalidade
JOIN inscricao ON inscricao.Id_inscricao = mensalidade.inscricao_id
JOIN aluno ON aluno.Id_aluno = inscricao.aluno_id
WHERE mensalidade.status_pagamento = 'Pago'
GROUP BY aluno.nome;

-- d 
SELECT max(mensalidade.Valor) FROM mensalidade;

-- e
SELECT min(mensalidade.Valor) FROM mensalidade;

-- f 
SELECT min(mensalidade.Valor) FROM mensalidade
WHERE mensalidade.status_pagamento = 'Não Pago';

-- g 
-- Utilizando DISTINCT
SELECT DISTINCT aluno.nome FROM aluno;

-- Utilizando GROUP BY
SELECT aluno.nome FROM aluno
GROUP BY aluno.nome;

-- h 
SELECT sum(mensalidade.Valor) FROM mensalidade
WHERE mensalidade.dt_vencimento < '2020-06-10';

-- i 
SELECT sum(mensalidade.Valor) FROM mensalidade
WHERE mensalidade.dt_vencimento > '2020-06-09';

-- j 
SELECT sum(mensalidade.Valor) FROM mensalidade
WHERE mensalidade.Id_mensalidade BETWEEN 2 AND 5;
