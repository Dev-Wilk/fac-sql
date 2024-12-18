SET SQL_SAFE_UPDATES = 0;
DROP DATABASE IF EXISTS DBCONTACORRENTE;
CREATE DATABASE DBCONTACORRENTE;
USE DBCONTACORRENTE;


CREATE TABLE CLIENTE(
	IDCLIENTE INT NOT NULL PRIMARY KEY AUTO_INCREMENT
	, NOME VARCHAR(100)
	, CPF CHAR(11)
);


CREATE TABLE CONTA (
	IDCONTA INT NOT NULL PRIMARY KEY AUTO_INCREMENT
	, IDCLIENTE INT NOT NULL
	, DT_ABERTURA DATE
	, LIMITE_CREDITO NUMERIC(8,2)
	, TIPO ENUM('CONTA-CORRENTE', 'POUPANÇA')
	, FOREIGN KEY (IDCLIENTE) REFERENCES CLIENTE (IDCLIENTE)
);

CREATE TABLE MOVIMENTACAO(
	IDMOVIMENTACAO INT NOT NULL PRIMARY KEY AUTO_INCREMENT
	, IDCONTA INT NOT NULL
	, DT_MOVIMENTACAO DATE
	, VALOR NUMERIC(8,2)
	, TIPO ENUM('DEBITO', 'CRÉDITO')
	, OBSERVAÇÃO TEXT
	, FOREIGN KEY (IDCONTA) REFERENCES CONTA (IDCONTA)
);



