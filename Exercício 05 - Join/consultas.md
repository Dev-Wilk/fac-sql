## 7-
    SELECT SEXO,
        COUNT(*) AS QUANTIDADE
    FROM
        CLIENTE
    GROUP BY SEXO;

## 8-
    SELECT
        p.NOME,
        p.PRECO
    FROM 
        PRODUTO p
    ORDER BY p.CATEGORIA, p.NOME;

## 9-
    SELECT 
        p.categoria,
		count(*) AS QUANTIDADE_PRODUTOS,
        avg(p.preco) AS MEDIA_VALOR
    FROM 
        PRODUTO p
    group by p.categoria
    order by p.categoria ASC;

## 10-
    SELECT 
        i.idproduto as codigo_produto,
		sum(i.qtde) as quantidade_vendido,
        i.preco_unitario as preco
    FROM 
        item_pedido i
    group by i.idproduto , i.preco_unitario;

## 11-
    SELECT
        i.idpedido AS codigo_pedido,
        i.idproduto AS codigo_produto,
        i.preco_unitario,
        i.qtde AS quantidade_vendida,
        i.preco_unitario * i.qtde AS valor_total
    FROM
        item_pedido i
    GROUP BY i.idpedido, i.idproduto
    ORDER BY i.idpedido, i.idproduto;

## 12-
    SELECT 
		i.idpedido,
        count(distinct i.idpedido) AS total_pedidos,
        avg(i.qtde) as media_itens_vendido,
		avg(i.preco_unitario * i.qtde) AS valor_medio   
    FROM 
        item_pedido i
    group by i.idpedido;


## 13-
    SELECT *
    FROM pedido 
    WHERE idcliente = 3;


## 14-
    SELECT
		c.idcliente as codigo_cliente,
        c.nome as nome_cliente,
        count(pe.idpedido) as quantidade_pedido
    FROM 
        cliente c
    INNER JOIN	pedido pe ON pe.idcliente = c.idcliente
    GROUP BY c.idcliente;


## 15-
    SELECT
		c.idcliente as codigo_cliente,
        c.nome as nome_cliente,
        count(pe.idpedido) as quantidade_pedido
    FROM 
        cliente c
    LEFT JOIN	pedido pe ON pe.idcliente = c.idcliente
    GROUP BY c.idcliente , c.nome;


## 16-
    SELECT
		pr.idproduto,
        pr.nome as nome_produto,
        count(distinct i.idpedido) AS total_pedidos,
        sum(i.qtde) as quantidade_vendida,
        avg(i.qtde) as media_itens_vendido
    FROM 
        produto pr
    INNER JOIN item_pedido i ON pr.idproduto = i.idproduto
    GROUP BY pr.idproduto , pr.nome
    ORDER BY quantidade_vendida desc

## 17-
    SELECT
		pr.idproduto,
        pr.nome as nome_produto,
        count(distinct i.idpedido) AS total_pedidos,
        sum(i.qtde) as quantidade_vendida,
        avg(i.qtde) as media_itens_vendido
    FROM 
        produto pr
    LEFT JOIN item_pedido i ON pr.idproduto = i.idproduto
    GROUP BY pr.idproduto , pr.nome
    ORDER BY quantidade_vendida desc

## 18-
    SELECT
		c.idcliente,
        c.nome,
        i.qtde as quantidade_pedido
    FROM 
        cliente c
    INNER JOIN pedido pe ON pe.idcliente = c.idcliente
    INNER JOIN item_pedido i ON pe.idpedido = i.idpedido
    WHERE i.qtde > 5
    ORDER BY quantidade_pedido desc;

## 19-
    SELECT 
		c.idcliente,
		c.nome AS nome_cliente,
		pe.idpedido,
		pe.dtpedido,
		i.idproduto,
		pr.nome AS nome_produto,
		i.qtde,
		i.preco_unitario,
		(i.preco_unitario * i.qtde) AS valor_tota
    FROM 
        cliente c
    INNER JOIN pedido pe ON pe.idcliente = c.idcliente
    INNER JOIN item_pedido i ON pe.idpedido = i.idpedido
    INNER JOIN produto pr ON i.idproduto = pr.idproduto
    where pe.idpedido = 10

## 20-
    SELECT 
		c.sexo,
		pr.categoria,
		sum(i.qtde) as quantidade_vendida
    FROM 
        cliente c
    INNER JOIN pedido pe ON pe.idcliente = c.idcliente
    INNER JOIN item_pedido i ON pe.idpedido = i.idpedido
    INNER JOIN produto pr ON i.idproduto = pr.idproduto
    GROUP BY c.sexo , pr.categoria;