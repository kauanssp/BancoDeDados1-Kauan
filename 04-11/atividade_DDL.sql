\c postgres;

DROP DATABASE IF EXISTS bi3032451_ifsp;
CREATE DATABASE bi3032451_ifsp;

\c bi3032451_ifsp;

CREATE DOMAIN D_NUM AS INTEGER
CHECK (VALUE > 0 AND VALUE < 21);


CREATE TABLE Curso
(
    id_curso INTEGER,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INTEGER NOT NULL,
    PRIMARY KEY (id_curso),
    CONSTRAINT curso_carga_horaria CHECK (carga_horaria > 0)
);

CREATE TABLE Aluno
(
    id_aluno INTEGER,
    nome VARCHAR(100) NOT NULL,
    matricula VARCHAR(20) NOT NULL,
    data_nascimento DATE,
    id_curso INTEGER NOT NULL,
    PRIMARY KEY (id_aluno),
    CONSTRAINT aluno_matricula UNIQUE (matricula),
    FOREIGN KEY(id_curso) REFERENCES Curso(id_curso)
);

CREATE TABLE Disciplina
(
    id_disciplina INTEGER,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INTEGER NOT NULL,
    id_curso INTEGER NOT NULL,
    PRIMARY KEY (id_disciplina),
    FOREIGN KEY(id_curso) REFERENCES Curso(id_curso),
    CONSTRAINT curso_carga_horaria CHECK (carga_horaria > 0)
);


ALTER TABLE Aluno
ADD COLUMN email VARCHAR(120);

ALTER TABLE Aluno
ADD COLUMN telefone VARCHAR(20) NOT NULL DEFAULT 'Não informado';

ALTER TABLE Aluno
ALTER COLUMN nome TYPE VARCHAR(150);

ALTER TABLE Curso
ADD COLUMN modalidade VARCHAR(20) DEFAULT 'Presencial';

ALTER TABLE Curso
ADD CONSTRAINT curso_modalidade
CHECK (modalidade IN ('Presencial', 'EAD', 'Hibrido'));

ALTER TABLE Disciplina
ADD COLUMN ementa VARCHAR(500);

ALTER TABLE Aluno
RENAME COLUMN telefone TO celular;

ALTER TABLE Aluno
DROP COLUMN celular;


DROP TABLE Curso;
DROP TABLE Aluno;
DROP TABLE Disciplina;
DROP TABLE Curso;

