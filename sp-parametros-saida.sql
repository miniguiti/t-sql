-->> SPs com parametros de saida <<--

-- Busca numero de notas por cliente e ano 
SELECT COUNT(*) FROM [NOTAS FISCAIS] WHERE CPF = '5576228758' AND YEAR([DATA]) = 2016

-- Busca faturamento por cliente e ano
SELECT SUM([QUANTIDADE] * [PRE�O]) FROM [ITENS NOTAS FISCAIS] A
INNER JOIN [NOTAS FISCAIS] B ON A.NUMERO = B.NUMERO
WHERE  CPF = '5576228758' AND YEAR([DATA]) = 2016

CREATE PROCEDURE RetornaValores
@CPF AS VARCHAR(12),
@ANO AS INT,
@NUM_NOTAS AS INT OUTPUT, -- OUTPUT: poder� ser usada posteriormente com referencia
@FATURAMENTO AS FLOAT OUTPUT
AS
BEGIN
	SELECT @NUM_NOTAS =  COUNT(*) FROM [NOTAS FISCAIS] WHERE CPF = @CPF AND YEAR([DATA]) = @ANO

	SELECT @FATURAMENTO = SUM([QUANTIDADE] * [PRE�O]) FROM [ITENS NOTAS FISCAIS] A
	INNER JOIN [NOTAS FISCAIS] B ON A.NUMERO = B.NUMERO
	WHERE CPF = @CPF AND YEAR([DATA]) = @ANO
END

-- Declarando variaveis para usar na execu��o da proc
DECLARE @NUMERO_NOTAS INT,
@FATURAMENTO FLOAT,
@CPF VARCHAR(12),
@ANO INT

SET @CPF = 5576228758
SET @ANO = 2016

-- Ao executar a proc, NUMERO_NOTAS e FATURAMENTO recebem a referencia (OUTPUT) da proc
EXEC RetornaValores @CPF = @CPF, @ANO = @ANO, 
@NUM_NOTAS = @NUMERO_NOTAS OUTPUT, @FATURAMENTO = @FATURAMENTO OUTPUT

SELECT @NUMERO_NOTAS, @FATURAMENTO