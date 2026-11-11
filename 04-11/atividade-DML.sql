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


INSERT INTO Curso (id_curso, nome, carga_horaria) 
            VALUES (1, 'Engenharia de Computação', 3600),
                   (2, 'Análise e Desenvolvimento de Sistemas', 2400),
                   (3, 'Redes de Computadores', 2000),
                   (4, 'Gestão da Tecnologia da Informação', 2000);

INSERT INTO Aluno (id_aluno, nome, matricula, data_nascimento, id_curso)
            VALUES (1, 'Ana Souza', '2026001', '2005-03-15', 1),
                   (2, 'Bruno Lima', '2026002', '2004-07-22', 1),
                   (3, 'Carla Mendes', '2026003', '2006-01-10', 2),
                   (4, 'Diego Santos', '2026004', '2003-11-05', 2),
                   (5, 'Elisa Rocha', '2026005', '2005-09-18', 3),
                   (6, 'Felipe Alves', '2026006', '2004-04-30', 3),
                   (7, 'Gabriela Costa', '2026007', '2006-06-12', 1),
                   (8, 'Henrique Martins', '2026008', NULL, 2),
                   (9, 'Isabela Oliveira', '2026009', '2005-12-01', 1),
                   (10, 'João Pereira', '2026010', NULL, 3);

INSERT INTO Disciplina (id_disciplina, nome, carga_horaria, id_curso) 
            VALUES (1, 'Algoritmos', 80, 1),
                   (2, 'Banco de Dados I', 80, 1),
                   (3, 'Arquitetura de Computadores', 60, 1),
                   (4, 'Programação Web', 80, 2),
                   (5, 'Engenharia de Software', 60, 2),
                   (6, 'Banco de Dados', 60, 2),
                   (7, 'Redes de Computadores I', 80, 3),
                   (8, 'Segurança de Redes', 60, 3),
                   (9, 'Sistemas Operacionais', 60, 3);

INSERT INTO Aluno (id_aluno, nome, matricula, data_nascimento, id_curso)
            VALUES (11, 'Lucas Ferreira', '2026001', '2005-08-20', 1);

INSERT INTO Disciplina (id_disciplina, nome, carga_horaria, id_curso)
            VALUES (10, 'Inteligência Artificial', 80, 99);


