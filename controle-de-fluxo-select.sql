-->> CONTROLE DE FLUXO COM SELECT <<--
use SUCOS_VENDAS

--Nesse exemplo, o IF verifica a soma de créditos por bairro e usa como condição para 'liberar creditos ao usuário'

SELECT SUM([LIMITE DE CREDITO]) FROM [TABELA DE CLIENTES] WHERE BAIRRO = 'Jardins'

DECLARE @LIMITE_MAXIMO FLOAT
DECLARE @LIMITE_ATUAL FLOAT
DECLARE @BAIRRO VARCHAR(20)


SET @BAIRRO = 'Jardins'
SET @LIMITE_MAXIMO = 500000
SELECT @LIMITE_ATUAL = SUM([LIMITE DE CREDITO]) FROM [TABELA DE CLIENTES] WHERE BAIRRO = @BAIRRO
IF @LIMITE_MAXIMO <= @LIMITE_ATUAL
BEGIN 
	PRINT 'Não foi possível liberar o crédito!'
END
ELSE
BEGIN
	PRINT 'É possível liberar créditos novos!'
END
