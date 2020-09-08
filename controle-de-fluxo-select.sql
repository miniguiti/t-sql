-->> CONTROLE DE FLUXO COM SELECT <<--
use SUCOS_VENDAS

--Nesse exemplo, o IF verifica a soma de cr�ditos por bairro e usa como condi��o para 'liberar creditos ao usu�rio'

SELECT SUM([LIMITE DE CREDITO]) FROM [TABELA DE CLIENTES] WHERE BAIRRO = 'Jardins'

DECLARE @LIMITE_MAXIMO FLOAT
DECLARE @LIMITE_ATUAL FLOAT
DECLARE @BAIRRO VARCHAR(20)


SET @BAIRRO = 'Jardins'
SET @LIMITE_MAXIMO = 500000
SELECT @LIMITE_ATUAL = SUM([LIMITE DE CREDITO]) FROM [TABELA DE CLIENTES] WHERE BAIRRO = @BAIRRO
IF @LIMITE_MAXIMO <= @LIMITE_ATUAL
BEGIN 
	PRINT 'N�o foi poss�vel liberar o cr�dito!'
END
ELSE
BEGIN
	PRINT '� poss�vel liberar cr�ditos novos!'
END
