## 1-
    SELECT
	    p.nome,
        p.telefone_residencial,
        p.telefone_comercial,
        p.telefone_recado
    FROM
	    proprietario p


## 2-
    SELECT
	    s.nome
    FROM
	    servico s;


## 3-
    SELECT
	    pr.nome
    FROM
	    produto pr;


## 4-
    SELECT
	    COUNT(v.idveiculo),
        v.marca
    FROM
	    veiculo v
    GROUP BY
	    v.marca;


## 5-
    SELECT
	    p.nome,
        p.dt_nascimento as aniversario
    FROM
	    proprietario p
    where
	    p.dt_nascimento BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 45 DAY)
    order by 
	    p.dt_nascimento;


## 6-
    SELECT
	    p.nome,
        v.modelo
    FROM
	    proprietario p
    LEFT JOIN veiculo v ON p.idproprietario = v.idproprietario
    order by p.nome;    


## 7-
    SELECT
	    v.modelo,
        p.nome
    FROM    
        proprietario p
    INNER JOIN veiculo v ON p.idproprietario = v.idproprietario
    ORDER BY p.nome;


## 8-
    SELECT
	    m.nome
    FROM
	    mecanico m;


## 9-
    SELECT
	    p.nome,
        p.valor
    FROM 
	    produto p 
    INNER JOIN item_produto i ON p.idproduto = i.idproduto;


## 10-
    SELECT
	    o.idorcamento,
	    COUNT(distinct o.idorcamento) as quantidade_orcamento,
        SUM(s.valor) as valorTotal   
    FROM 
	    servico s
    INNER JOIN item_servico i ON s.idservico = i.idservico
    INNER JOIN orcamento o ON i.idorcamento = o.idorcamento
    where o.idveiculo = 3
    group by o.idorcamento;


## 11-
    SELECT
	    o.idorcamento,
	    COUNT(distinct o.idorcamento) as quantidade_peça,
        SUM(p.valor) as valorTotal   
    FROM 
	    produto p
    INNER JOIN item_produto i ON p.idproduto = i.idproduto
    INNER JOIN orcamento o ON i.idorcamento = o.idorcamento
    where o.idveiculo = 3
    group by o.idorcamento;


## 12-
    SELECT
	    o.idorcamento,
        m.nome as mecanico
    FROM 
	    mecanico m
    INNER JOIN orcamento o ON o.idmecanico = m.idmecanico
    WHERE o.idveiculo = 2
    ORDER BY o.idorcamento;


## 13-
    SELECT
	    v.modelo,
        o.idveiculo,
        COUNT(o.idorcamento) as qnt_orcamento
    FROM
	    veiculo v
    INNER JOIN orcamento o ON v.idveiculo = o.idveiculo
    where v.ano_fabricacao = 2014
    group by v.modelo, v.idveiculo
    order by v.idveiculo


## 14-
    SELECT
	    o.idorcamento,
	    AVG((s.valor * its.qtde) +(ip.qtde * p.valor)) as media_orcamento
    FROM
	    produto p
    INNER JOIN item_produto ip ON p.idproduto = ip.idproduto
    INNER JOIN orcamento o ON ip.idorcamento = o.idorcamento
    INNER JOIN item_servico its ON o.idorcamento = its.idorcamento
    INNER JOIN servico s ON its.idservico = s.idservico
    GROUP BY o.idorcamento;


## 15-
    WITH Servicos AS (
        SELECT
            o.IDORCAMENTO,
            YEAR(o.DT_ORCAMENTO) AS ANO,
            MONTH(o.DT_ORCAMENTO) AS MES,
            SUM(s.VALOR * it.QTDE) AS VALOR_SERVICO
        FROM
            ORCAMENTO o
        INNER JOIN item_servico it ON o.IDORCAMENTO = it.IDORCAMENTO
        INNER JOIN servico s ON it.IDSERVICO = s.IDSERVICO
        GROUP BY 1, 2, 3
    ),
    Produtos AS (
        SELECT
            o.IDORCAMENTO,
            YEAR(o.DT_ORCAMENTO) AS ANO,
            MONTH(o.DT_ORCAMENTO) AS MES,
            SUM(p.VALOR * ip.QTDE) AS VALOR_PRODUTO
        FROM
            orcamento o
        INNER JOIN item_produto ip ON o.IDORCAMENTO = ip.IDORCAMENTO
        INNER JOIN produto p ON ip.IDPRODUTO = p.IDPRODUTO
        GROUP BY 1, 2, 3
    )
    SELECT
        ANO,
        MES,
        COUNT(IDORCAMENTO) AS QUANTIDADE_ORCAMENTOS,
        SUM(VALOR_TOTAL) AS VALOR_TOTAL_PAGO,
        AVG(VALOR_TOTAL) AS MEDIA_VALOR_PAGO
    FROM (
        SELECT idorcamento,
		    ano,
            mes,
            SUM(VALOR_TOTAL) as valor_total
    from (
        SELECT 
            IDORCAMENTO, ANO, MES, VALOR_SERVICO AS VALOR_TOTAL
        FROM Servicos
        UNION ALL
        SELECT 
            IDORCAMENTO, ANO, MES, VALOR_PRODUTO AS VALOR_TOTAL
        FROM Produtos
        ) AS X group by 1, 2, 3
    ) AS TodosOsItens
    GROUP BY ANO, MES
    ORDER BY ANO, MES;



