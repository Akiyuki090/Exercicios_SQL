-- 1
CREATE FUNCTION CalcularFrete(distancia DECIMAL(10,2))
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE frete DECIMAL(10,2);
    SET frete = distancia * 05;    --para calcular frete precisamos de mais informações, como foi pedida apenas calcular pela distancia, vamos simplificar
    RETURN frete;
END;

SELECT CalcularFrete(10);

-- 2
CREATE FUNCTION ConverterParaMaiúsculas(string VARCHAR(255))
RETURNS VARCHAR(255)
BEGIN
    DECLARE maiuscula VARCHAR(255)
    SET maiuscula = UPPER(string)
    RETURN maiuscula
END;

SELECT ConverterParaMaiúsculas('baixinho');

-- 3
CREATE FUNCTION CalcularIdade(nascimento DATE)
RETURNS INT
BEGIN
    DECLARE idade INT;
    SET idade = IF(MONTH(nascimento) < MONTH(CURRENT_DATE()), YEAR(CURRENT_DATE()) - YEAR(nascimento), (YEAR(CURRENT_DATE()) - YEAR(nascimento)) - 1);
    RETURN idade;
END;

SELECT CalcularIdade('08-25-1982');

-- 4
CREATE FUNCTION CalcularDesconto(valorTotal DECIMAL(10,2), cupom INT)
RETURNS DECIMAL(10,2)
BEGIN
    DECLARE ValorFinal DECIMAL(10,2)
    SET ValorFinal = valorTotal - (valorTotal * (cupom/100))
    RETURN ValorFinal
END;

SELECT CalcularDesconto(100, 15);

-- 5
CREATE FUNCTION CalcularTotalVendas(data_inicial DATE, data_final DATE)
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE total_vendas DECIMAL(10, 2);
    
    SELECT SUM(Valor) INTO total_vendas
    FROM Pedidos
    WHERE Data >= data_inicial AND Data <= data_final;
    
    RETURN total_vendas;
END;

SELECT CalcularTotalVendas('2023-01-01', '2023-12-31');
