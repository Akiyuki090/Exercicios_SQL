-- 1
SELECT
  C.Nome,
  P.Data,
  P.Valor
FROM Pedidos P
JOIN Clientes C ON P.ID_cliente= C.ID_cliente;

-- 2
SELECT
  P.ID_pedido,
  I.Produto,
FROM ItensPedido I
JOIN Pedidos P ON I.ID_pedido = P.ID_pedido;

-- 3
SELECT
  C.Nome,
  COUNT(*)       as QTD
FROM Pedidos P
JOIN Clientes C ON P.ID_cliente= C.ID_cliente
GROUP BY C.ID_cliente
HAVING COUNT(*) = 0;

-- 4
SELECT *
FROM Pedidos
WHERE Data = '2023-06-16';

-- 5
SELECT
  C.Nome,
  I.Produto,
  COUNT(*)       as QTD
FROM Pedidos P
JOIN Clientes C ON P.ID_cliente= C.ID_cliente
JOIN ItensPedido i ON P.ID_Pedido = I.ID_Pedido
GROUP BY C.Nome
HAVING COUNT(*) >= 1;

-- 6
SELECT
  C.Nome,
  P.Data,
  P.Valor
FROM Pedidos P
JOIN Clientes C ON P.ID_cliente = C.ID_cliente
HAVING P.Valor > 100;

-- 7
SELECT
  C.Nome
FROM Clientes C
JOIN Pedidos P ON C.ID_cliente = P.ID_cliente
HAVING P.Produto = 'Batata';

-- 8
SELECT
  P.ID_Pedido
  P.Data,
  P.Valor
FROM Pedidos P
JOIN Clientes C ON P.ID_cliente = C.ID_cliente
HAVING C.Endereco = 'SP';

-- 9 
SELECT
  C.Nome,
  COUNT(*)       as QTD
FROM Pedidos P
JOIN Clientes C ON P.ID_cliente= C.ID_cliente
GROUP BY C.ID_cliente
HAVING COUNT(*) > 1;

-- 10
SELECT C.Nome, COUNT(*) as QTD
FROM Pedidos P
JOIN Clientes C ON P.ID_cliente = C.ID_cliente
JOIN ItensPedido I ON P.ID_Pedido = I.ID_Pedido
WHERE I.Produto = 'nome_do_produto'
GROUP BY C.Nome
HAVING COUNT(*) > 1;
