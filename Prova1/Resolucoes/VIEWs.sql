-- 1 
CREATE VIEW Pedidos_Completos AS
SELECT
    C.Nome,
    C.Endereco,
    P.Data,
    P.Valor
FROM Clientes C
JOIN Pedidos P ON C.ID_cliente = P.ID_cliente;

-- 2
CREATE VIEW ItensMaisVendidos AS
SELECT
    Produto,
    Quantidade
FROM ItensPedidos
ORDER BY Quantidade DESC;

-- 3
CREATE VIEW ClientesVIP AS
SELECT
    C.Nome,
    SUM(P.Valor)      AS Total
FROM Clientes C
JOIN Pedidos P ON C.ID_cliente = P.ID_cliente
HAVING COUNT(*) > 10 AND SUM(P.Valor) > 1000
GROUP BY C.Nome;

-- 4
CREATE VIEW PedidosRecentes AS
SELECT * FROM Pedidos 
WHERE DAY(CURRENT_DATE()) - DAY(Data) = 30;

-- 5
CREATE VIEW TotalPedidosPorCliente AS
SELECT C.Nome, COUNT(*) AS Quantidade FROM Clientes C
JOIN Pedidos P ON C.ID_cliente = P.ID_cliente
GROUP BY C.ID_cliente;
