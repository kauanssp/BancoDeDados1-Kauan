-- BASIC CONSOLE COMMANDS
-- \c <DATABASE> => Change database
-- \dt           => Show table
-- \d <TABLE>    => Describe table
-- git config --global user.email "you@example.com"
-- git config --global user.name "your name"

-- Para visualizar as tabelas:
-- \dt

-- Para visualizar a estrutura de uma tabela:
-- \d funcionario
-- \d departamento
-- \d dependente
-- \d localizacao
-- \d projeto
-- \d trabalha_em


\c postgres;

DROP DATABASE IF EXISTS empresa;
CREATE DATABASE empresa;

\c empresa;


CREATE DOMAIN TIPO_ID AS CHAR(6);

CREATE DOMAIN D_NUM AS INTEGER
CHECK (VALUE > 0 AND VALUE < 21);


CREATE TABLE departamento
(
    numero TIPO_ID,
    nome VARCHAR(15) NOT NULL,
    gident TIPO_ID,
    dtinicio DATE,
    PRIMARY KEY(numero)
);

CREATE TABLE FUNCIONARIO
(
    ident TIPO_ID,
    nome VARCHAR(15) NOT NULL,
    sobrenome VARCHAR(15) NOT NULL,
    endereco VARCHAR(30),
    dtnasc DATE,
    salario DECIMAL(10,2),
    sexo VARCHAR(15),
    supident TIPO_ID,
    dnumero TIPO_ID NOT NULL,
    PRIMARY KEY(ident),
    FOREIGN KEY(supident) REFERENCES FUNCIONARIO(ident),
    FOREIGN KEY(dnumero) REFERENCES departamento(numero)
);


CREATE TABLE dependente
(
    fident TIPO_ID,
    nome VARCHAR(15) NOT NULL,
    sobrenome VARCHAR(15) NOT NULL,
    sexo VARCHAR(15),
    relacionamento VARCHAR(15),
    PRIMARY KEY(fident, nome),
    FOREIGN KEY(fident) REFERENCES FUNCIONARIO(ident)
);


CREATE TABLE localizacao
(
    dnumero TIPO_ID,
    localizacao VARCHAR(30) NOT NULL,
    PRIMARY KEY(dnumero, localizacao),
    FOREIGN KEY(dnumero) REFERENCES departamento(numero)
);


CREATE TABLE projeto
(
    numero TIPO_ID,
    nome VARCHAR(15),
    localizacao VARCHAR(30),
    dnumero TIPO_ID,
    PRIMARY KEY(numero),
    FOREIGN KEY(dnumero) REFERENCES departamento(numero)
);


CREATE TABLE trabalha_em
(
    fident TIPO_ID,
    pnumero TIPO_ID,
    horas INTEGER,
    PRIMARY KEY(fident, pnumero),

    FOREIGN KEY(fident)
        REFERENCES FUNCIONARIO(ident),

    FOREIGN KEY(pnumero)
        REFERENCES projeto(numero)
);


ALTER TABLE FUNCIONARIO 
ADD CONSTRAINT fk_funcionario_superior
                        FOREIGN KEY (supident)
                        REFERENCES FUNCIONARIO (ident);

ALTER TABLE FUNCIONARIO
ADD CONSTRAINT fk_funcionario_departamento
                        FOREIGN KEY (dnumero)
                        REFERENCES departamento (numero);

ALTER TABLE FUNCIONARIO
ALTER supident SET DEFAULT 5;

ALTER TABLE FUNCIONARIO 
ALTER SEXO TYPE VARCHAR(1);

ALTER TABLE departamento -- VAI DAR ERRO NEGUIN
DROP numero RESTRICT; -- NAO DEIXA DELETAR SE TIVER ALGUM OUTRO OBJETO RELACIONADO

ALTER TABLE departamento
DROP numero CASCADE; -- DELETO OBJETO E TODOS SEUS RELACIONAMENTOS