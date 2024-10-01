## 1-
    SELECT
	    f.nome,
        d.nome
    FROM 
        departamento d
    INNER JOIN funcionario f ON d.iddepartamento = f.iddepartamento
    WHERE d.nome = 'financeiro';

## 2-
    SELECT 
        f.idfuncionario AS codigo,
        f.nome AS nome_funcionario,
        fu.nome AS nome_funcao
    FROM 
        funcionario f
    INNER JOIN funcao fu ON f.idfuncao = fu.idfuncao
    WHERE fu.nome IN ('ASSISTENTE DE MANUTENÇÃO', 'ASSISTENTE ADMINISTRATIVO');

## 3-
    SELECT
	    f.nome,
        f.dtadmissao as admissao,
        f.salario  
    FROM 
        funcionario f
    WHERE salario > 1800;

## 4-
    SELECT
	    f.nome,
        f.dtadmissao as admissao,
        f.salario  
    FROM 
        funcionario f
    WHERE f.iddepartamento = 1;

## 5-
    SELECT
        f.idfuncionario,
        f.nome,
        f.salario,
        d.nome as departamento,
        fu.nome as funcao
    FROM 
        funcao fu
    INNER JOIN funcionario f ON f.idfuncao = f.idfuncao
    INNER JOIN departamento d ON f.iddepartamento = d.iddepartamento;

## 6-
    SELECT
	    sexo,
	    max(salario) as maior,
        min(salario) as menor
    FROM 
        funcionario 
    GROUP BY sexo;


## 7-
    SELECT
        d.iddepartamento,
        d.nome as departamento,
        SUM(f.salario) as soma,
        AVG(f.salario) as media    
    FROM 
        departamento d
    INNER JOIN funcionario f ON f.iddepartamento = d.iddepartamento
    GROUP BY d.iddepartamento, d.nome;

## 8-
    WITH FuncionariosAntigos AS (
        SELECT 
            f.idfuncionario, 
            f.nome, 
            f.salario, 
            f.idfuncao
        FROM 
            funcionario f
        WHERE 
            dtadmissao < DATE_SUB(NOW(), INTERVAL 1 YEAR)
    )
    SELECT 
        fa.nome, 
        fa.salario, 
        fu.nome AS nome_funcao
    FROM 
        FuncionariosAntigos fa
    INNER JOIN funcao fu ON fa.idfuncao = fu.idfuncao;

## 9-
    SELECT
	    SUM(f.idfuncionario),
        d.nome as departamento
    FROM 
        departamento d
    INNER JOIN funcionario f ON f.iddepartamento = d.iddepartamento
    group by d.nome
    ORDER BY d.nome;

## 10-
    SELECT
	    fu.nome,
	    sum(f.salario) as soma_salario,
        max(f.salario) as maior,
        min(f.salario) as menor
    FROM 
        funcao fu
    INNER JOIN funcionario f ON f.idfuncao = fu.idfuncao
    GROUP BY fu.nome;