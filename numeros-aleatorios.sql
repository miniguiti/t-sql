-->> Cursor - criando números aleatórios <<--

--Busca número aleatório
SELECT RAND()

--Valor minimo = 100
--Valor maximo = 500
--ROUND: Define quantidade de casas decimais
SELECT ROUND(((500 -100  -1) * RAND() +1), 0) 


-- Função para retornar valor aleatório
-- Não é possível chamar a função RAND na cria ção da função (usaremos uma VW para retornar numeros aleatórios)
CREATE FUNCTION NumeroAleatorio(@VAL_INIC INT, @VAL_FIM INT) RETURNS INT
AS
BEGIN
	DECLARE @ALEATORIO INT
	SET @ALEATORIO = ROUND(((@VAL_FIM - @VAL_INIC  -1) * RAND() + @VAL_INIC), 0) 
	RETURN @ALEATORIO 
END

--> Criando e retornando VW para gerar numeros aleatórios
CREATE VIEW VW_ALEATORIO AS SELECT RAND() AS VALUE

SELECT * FROM VW_ALEATORIO

-- Usando retorno da VW na FN
CREATE FUNCTION NumeroAleatorio(@VAL_INIC INT, @VAL_FIM INT) RETURNS INT
AS
BEGIN
	DECLARE @ALEATORIO INT
	DECLARE @ALEATORIO_FLOAT FLOAT
	SELECT @ALEATORIO_FLOAT = VALUE FROM VW_ALEATORIO
	SET @ALEATORIO = ROUND(((@VAL_FIM - @VAL_INIC  -1) * @ALEATORIO_FLOAT + @VAL_INIC), 0) 
	RETURN @ALEATORIO 
END

--Testando
SELECT [dbo].[NumeroAleatorio](1,3)