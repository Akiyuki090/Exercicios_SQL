-- 1
CREATE TRIGGER AtualizaDataPedido
AFTER INSERT ON Pedidos
FOR EACH ROW
BEGIN
    UPDATE Clientes
    SET Data_Último_Pedido = CURRENT_DATE()
    WHERE ID_cliente = NEW.ID_cliente;
END;

-- 2
CREATE TRIGGER AtualizaPedido
AFTER DELETE ON Clientes
FOR EACH ROW
BEGIN
    DELETE FROM Pedidos WHERE ID_cliente = NEW.ID_cliente;
END;

--3
CREATE TRIGGER AtualizaQtd
AFTER UPDATE ItensPedido
FOR EACH ROW
BEGIN
    UPDATE Pedidos
    SET Valor_Total = Quantidade * Preco_Item
    WHERE ID_produto = NEW,ID_produto
END;

-- 4
CREATE TRIGGER AtualizaQtdTotal
AFTER UPDATE ON ItensPedido
FOR EACH ROW
BEGIN
    UPDATE Pedidos
    SET Quantidade = Quantidade + NEW.Quantidade
    WHERE ID_produto = NEW.ID_produto;
END;

-- 5
CREATE TRIGGER AtualizaStatus
AFTER UPDATE Pedidos
FOR EACH ROW
BEGIN
    INSERT INTO Log_Pedidos(Id_Pedido, data, status) VALUES(NEW.Id_Pedido, NEW.data, NEW.status)
END;

-- 6
CREATE TRIGGER VerificaPedido
AFTER INSERT Pedidos
FOR EACH ROW
BEGIN
    DECLARE totalPedidos INT

    SELECT COUNT(*) INTO totalPedidos
    FROM Pedidos
    WHERE ID_cliente = NEW.ID_cliente;

    IF totalPedidos > 5 THEN
    INSERT INTO ClientesVIP (ID_cliente)
    VALUES(NEW.ID_cliente);
    END IF;
END;

-- 7


