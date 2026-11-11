--DQL - DATA QUERY LANGUAGE
-- SELECT, FROM, WHERE, JOIN, ORDER BY

SELECT * FROM Curso;

SELECT nome, matricula FROM Aluno;

SELECT * FROM Aluno
ORDER BY nome ASC;

SELECT * FROM Disciplina
ORDER BY carga_horaria DESC, nome ASC;


SELECT * FROM Aluno
WHERE id_curso = 1;

SELECT * FROM Disciplina
WHERE carga_horaria >= 80;

SELECT * FROM Aluno
WHERE data_nascimento < '2005-01-01';

SELECT * FROM Aluno
WHERE nome LIKE 'A%';

SELECT * FROM Aluno
WHERE data_nascimento IS NULL;

SELECT * FROM Aluno
WHERE id_curso IN (1, 3);

SELECT * FROM Disciplina
WHERE carga_horaria BETWEEN 60 AND 80;


SELECT Aluno.nome, Curso.nome FROM Aluno INNER JOIN Curso ON Aluno.id_curso = Curso.id_curso;

SELECT Disciplina.nome, Disciplina.carga_horaria, Curso.nome FROM Disciplina 
    INNER JOIN Curso 
        ON Disciplina.id_curso = Curso.id_curso;

SELECT Aluno.nome, Aluno.matricula FROM Aluno 
    INNER JOIN Curso 
        ON Aluno.id_curso = Curso.id_curso 
            WHERE Curso.nome = 'Engenharia de Computação';


SELECT COUNT(*) AS quantidade_alunos FROM Aluno;

SELECT MAX(carga_horaria) AS maior_carga,
       MIN(carga_horaria) AS menor_carga
FROM Disciplina;

SELECT AVG(carga_horaria) AS media_carga_horaria FROM Disciplina;

SELECT Curso.nome, COUNT(Aluno.id_aluno) AS quantidade_alunos
    FROM Curso
        LEFT JOIN Aluno
            ON Curso.id_curso = Aluno.id_curso
                GROUP BY Curso.id_curso, Curso.nome;


SELECT Curso.nome, COALESCE(SUM(Disciplina.carga_horaria), 0) AS total_carga_horaria
    FROM Curso LEFT JOIN Disciplina
        ON Curso.id_curso = Disciplina.id_curso 
            GROUP BY Curso.id_curso, Curso.nome;


SELECT Curso.nome, COUNT(Aluno.id_aluno) AS quantidade_alunos
    FROM Curso
        INNER JOIN Aluno
            ON Curso.id_curso = Aluno.id_curso
                GROUP BY Curso.id_curso, Curso.nome
                    HAVING COUNT(Aluno.id_aluno) >= 3;