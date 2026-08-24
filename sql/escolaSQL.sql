	CREATE DATABASE escola;
    
    USE escola;
    
    CREATE TABLE sala(
    idsala INT NOT NULL,
    nome_sala VARCHAR(45),
    capacidade_sala INT,
    PRIMARY KEY (idsala)
    );
    
  --  DROP TABLE sala
  
  CREATE TABLE turma(
  idturma INT NOT NULL,
  nome_turma VARCHAR(45),
  periodo VARCHAR (45),
	sala_id INT,
	PRIMARY KEY (idturma),
	FOREIGN KEY (sala_id)
    REFERENCES sala (idsala)
);
	

CREATE TABLE professor(
  idprofessor INT NOT NULL,
  nome_prof VARCHAR(45),
  formacao_prof VARCHAR (45),
	turma_id INT,
	PRIMARY KEY (idprofessor),
	FOREIGN KEY (turma_id)
    REFERENCES turma (idturma)
);

 CREATE TABLE aulas(
  idaulas INT NOT NULL,
  nome_aula VARCHAR(45),
	professor_id INT,
	PRIMARY KEY (idaulas),
	FOREIGN KEY (professor_id)
    REFERENCES professor (idprofessor)
);



