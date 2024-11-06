## 1-
    DELIMITER $$
    CREATE TRIGGER tr_CalculaICMS AFTER INSERT ON Produto
    FOR EACH ROW
    BEGIN
	    IF NEW.VALOR IS NULL OR NEW.ESTADO IS NULL THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Valor e Estado são obrigatórios para inserir ou atualizar um produto.';
        ELSEIF NEW.VALOR < 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'O valor do produto não pode ser negativo.';
        ELSEIF NOT EXISTS (SELECT 1 FROM BASE_ICMS WHERE ESTADO = NEW.ESTADO) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'O estado informado não existe na tabela BASE_ICMS.';
        END IF;

        IF NEW.VALOR IS NOT NULL AND NEW.ESTADO IS NOT NULL THEN
            UPDATE Produto p
            INNER JOIN BASE_ICMS b ON p.ESTADO = b.ESTADO
            SET p.ICMS_PERCENTUAL = b.ICMS_PERCENTUAL,
                p.ICMS_VALOR = p.VALOR * b.ICMS_PERCENTUAL / 100
            WHERE p.IDPRODUTO = NEW.IDPRODUTO;
        END IF;
    END $$
    DELIMITER ;



    DELIMITER $$
    CREATE TRIGGER tr_CalculaICMS AFTER UPDATE ON Produto 
    FOR EACH ROW
    BEGIN
	    IF NEW.VALOR IS NULL OR NEW.ESTADO IS NULL THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Valor e Estado são obrigatórios para inserir ou atualizar um produto.';
        ELSEIF NEW.VALOR < 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'O valor do produto não pode ser negativo.';
        ELSEIF NOT EXISTS (SELECT 1 FROM BASE_ICMS WHERE ESTADO = NEW.ESTADO) THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'O estado informado não existe na tabela BASE_ICMS.';
        END IF;

        IF NEW.VALOR IS NOT NULL AND NEW.ESTADO IS NOT NULL THEN
            UPDATE Produto p
            INNER JOIN BASE_ICMS b ON p.ESTADO = b.ESTADO
            SET p.ICMS_PERCENTUAL = b.ICMS_PERCENTUAL,
                p.ICMS_VALOR = p.VALOR * b.ICMS_PERCENTUAL / 100
            WHERE p.IDPRODUTO = NEW.IDPRODUTO;
        END IF;
    END $$

    DELIMITER ;

## 2-
    INSERT INTO Produto (NOME, ESTADO, VALOR) VALUES ('Produto A', 'SP', 100.00);
    INSERT INTO Produto (NOME, ESTADO, VALOR) VALUES ('Produto B', 'SC', '');
    INSERT INTO Produto (NOME, ESTADO, VALOR) VALUES ('Produto C', 'RJ', 75.00);
    INSERT INTO Produto (NOME, ESTADO, VALOR) VALUES ('Produto D', '', 39.00);
    INSERT INTO Produto (NOME, ESTADO, VALOR) VALUES ('Produto E', 'RS', 235.00);

## 3- 
    UPDATE Produto SET ESTADO = 'RJ' WHERE IDPRODUTO = 1;
    UPDATE Produto SET VALOR = 180.00 WHERE IDPRODUTO = 1;
    UPDATE Produto SET VALOR = 80.00 WHERE IDPRODUTO = 3;
    UPDATE Produto SET ESTADO = 'MA' WHERE NOME = 'Produto E';
    UPDATE Produto SET ESTADO = 'GO' WHERE NOME = 'Produto C';


