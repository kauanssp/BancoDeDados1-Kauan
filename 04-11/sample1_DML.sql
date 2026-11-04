-- DML - DATA MANIPULATION LANGUAGE
-- INSERT, UPDATE, DELETE


-- SINTAX INSERT COMMAND
INSERT INTO tabela (col1, col2, ..., coln) VALUES (val1, val2, ..., valn)


-- EXAMPLE TABLE DEPARTAMENTO
INSERT INTO departamento (nome, numero) VALUES ('FINANCEIRO', 1);
INSERT INTO departamento (nome, numero) VALUES ('COMERCIAL', 2);
INSERT INTO departamento (nome, numero) VALUES ('JURIDICO', 3);

-- EXAMPLE TABLE FUNCIONARIO
INSERT INTO FUNCIONARIO (ident, nome, sobrenome, endereco, dtnasc, salario, sexo, supident, dnumero)
            VALUES (1, 'Murilo', 'Varges', 'R. Pedro Cavalo', '1990-05-06', 77000.00, 'M', NULL, 1);

INSERT INTO FUNCIONARIO (ident, nome, sobrenome, endereco, dtnasc, salario, sexo, supident, dnumero)
            VALUES (2, 'Valtemir', 'Alencar', 'R. Joao Galo', '1970-05-06', 99000.00, 'M', 1, 2);

INSERT INTO FUNCIONARIO (ident, nome, sobrenome, endereco, dtnasc, salario, sexo, supident, dnumero)
            VALUES (3, 'Guilherme', 'Moreira', 'R. do Teiu', '1970-05-06', 2.00, 'M', 2, 2);

-- SEE INSERT REGISTERS
SELECT * FROM tabela ORDER BY coluna

-- SEE INSERT FUNCIONARIOS
SELECT * FROM funcionario;