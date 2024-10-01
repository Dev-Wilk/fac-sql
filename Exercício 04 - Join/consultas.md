## 1-
    select 
	    c.nome as nome_cliente,
        p.idpedido as numero_pedido,
        p.dtpedido as data_pedido
    from 
	    cliente c
    inner join pedido p ON c.idcliente = p.idcliente

## 2- 
    select
	    p.nome as nome_produto,
        p.preco as preço,
        ip.qtde as quantidade
    from 
	    item_pedido ip
    inner join produto p ON p.idproduto = ip.idproduto;

## 3-
    select
	    p.dtpedido as data_pedido,
        i.qtde as quantidade,
        i.preco_unitario
    from
	    item_pedido i
    inner join pedido p ON p.idpedido = i.idpedido;

## 4-
    select
	    p.idpedido,
        p.dtpedido,
        i.qtde as quantidade,
        pr.nome as nome_produto
    from
	    item_pedido i
    inner join pedido p on p.idpedido = i.idpedido
    inner join produto pr on i.idproduto = pr.idproduto;

## 5-
    select
	    c.nome as nome_cliente,
        p.dtpedido as data_pedido,
        i.qtde as quantidade
    from
	    item_pedido i
    inner join pedido p on i.idpedido = p.idpedido
    inner join cliente c on c.idcliente = p.idcliente;

    5- Melhor consulta
    select
	    c.nome as nome_cliente,
        p.dtpedido as data_pedido,
        i.qtde as quantidade
    from
	    cliente c
    inner join pedido p on c.idcliente = p.idcliente
    inner join item_pedido i on i.idpedido = p.idpedido;
    
## 6-
    elect
	    c.nome as nome_cliente,
        p.dtpedido,
        pr.nome as produto,
        i.qtde as quantidade
    from
	    cliente c
    inner join pedido p on p.idcliente = c.idcliente
    inner join item_pedido i on p.idpedido = i.idpedido
    inner join produto pr on pr.idproduto = i.idproduto;
