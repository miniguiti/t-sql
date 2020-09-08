-->> SPs com interface - Entrada escalar <--

--Busca nota fiscal do cliente em um range de data

CREATE PROCEDURE BuscaNotasClientes
@CPF VARCHAR(12),
@DATA_INICIAL AS DATETIME = '20160101',
@DATA_FINAL AS DATETIME = '20161231'
AS
BEGIN
	SELECT * FROM [NOTAS FISCAIS] WHERE CPF = @CPF AND [DATA] >= @DATA_INICIAL AND [DATA] <= @DATA_FINAL
END

--> Testando
-- Caso algum parametro seja omitido na chamada, 
-- a busca será feita com que foi definido como padrão na proc

EXEC BuscaNotasClientes @CPF = '19290992743' 
EXEC BuscaNotasClientes @CPF = '19290992743', @DATA_INICIAL = '20161201'