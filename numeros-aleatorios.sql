-->> Cursor - criando n�meros aleat�rios <<--

--Busca n�mero aleat�rio
SELECT RAND()

--Valor minimo = 100
--Valor maximo = 500
--ROUND: Define quantidade de casas decimais
SELECT ROUND(((500 -100  -1) * RAND() +1), 0) 


-- Fun��o para retornar valor aleat�rio
-- N�o � poss�vel chamar a fun��o RAND na cria ��o da fun��o (usaremos uma VW para retornar numeros aleat�rios)
CREATE FUNCTION NumeroAleatorio(@VAL_INIC INT, @VAL_FIM INT) RETURNS INT
AS
BEGIN
	DECLARE @ALEATORIO INT
	SET @ALEATORIO = ROUND(((@VAL_FIM - @VAL_INIC  -1) * RAND() + @VAL_INIC), 0) 
	RETURN @ALEATORIO 
END

--> Criando e retornando VW para gerar numeros aleat�rios
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