DROP DATABASE IF EXISTS DBAVALIACAO_20242;
CREATE DATABASE DBAVALIACAO_20242;

USE DBAVALIACAO_20242;

CREATE TABLE ALUNO (
    IDALUNO INT PRIMARY KEY,
    NOME VARCHAR(100),
    DATA_NASCIMENTO DATE,
    SEXO CHAR(1)
);

CREATE TABLE CURSO (
    IDCURSO INT PRIMARY KEY,
    NOME_CURSO VARCHAR(100),
    DEPARTAMENTO VARCHAR(100)
);

CREATE TABLE DISCIPLINA (
    IDDISCIPLINA INT PRIMARY KEY,
    NOME_DISCIPLINA VARCHAR(100),
    IDCURSO INT,
    FOREIGN KEY (IDCURSO) REFERENCES CURSO(IDCURSO)
);

CREATE TABLE PROFESSOR (
    IDPROFESSOR INT PRIMARY KEY,
    NOME_PROFESSOR VARCHAR(100),
    TITULACAO VARCHAR(50)
);

CREATE TABLE MATRICULA (
    IDMATRICULA INT PRIMARY KEY,
    IDALUNO INT,
    IDDISCIPLINA INT,
    IDPROFESSOR INT,
    NOTA DECIMAL(3, 1),
    ANO int,
    SEMESTRE INT,
    FOREIGN KEY (IDALUNO) REFERENCES ALUNO(IDALUNO),
    FOREIGN KEY (IDDISCIPLINA) REFERENCES DISCIPLINA(IDDISCIPLINA),
    FOREIGN KEY (IDPROFESSOR) REFERENCES PROFESSOR(IDPROFESSOR)
);


INSERT INTO ALUNO VALUES (1, 'João Silva', '2000-03-15', 'M');
INSERT INTO ALUNO VALUES (2, 'Maria Oliveira', '1999-07-22', 'F');
INSERT INTO ALUNO VALUES (3, 'Pedro Santos', '2001-11-30', 'M');

INSERT INTO CURSO VALUES (1, 'Ciência da Computação', 'Exatas');
INSERT INTO CURSO VALUES (2, 'Engenharia Elétrica', 'Exatas');

INSERT INTO DISCIPLINA VALUES (1, 'Banco de Dados', 1);
INSERT INTO DISCIPLINA VALUES (2, 'Eletrônica Básica', 2);

INSERT INTO PROFESSOR VALUES (1, 'Dr. Carlos Pereira', 'Doutor');
INSERT INTO PROFESSOR VALUES (2, 'Dra. Ana Lima', 'Mestre');

INSERT INTO MATRICULA VALUES (1, 1, 1, 1, 8.5, 2024, 2);
INSERT INTO MATRICULA VALUES (2, 2, 1, 1, 9.0, 2024, 2);
INSERT INTO MATRICULA VALUES (3, 3, 2, 2, 7.0, 2024, 2);


