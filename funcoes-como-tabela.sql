--> Usando funções como tabelas <--

--Retorna todas as notas fiscais do cliente por CPF

USE SUCOS_VENDAS

CREATE FUNCTION ListaNotasClientes(@CPF AS VARCHAR(12)) RETURNS TABLE
AS
RETURN SELECT * FROM [NOTAS FISCAIS] WHERE CPF = @CPF

SELECT * FROM DBO.ListaNotasClientes('1471156710')

-- Lista numero de notas fiscais por CPF/Cliente
SELECT CPF, (SELECT COUNT(*) FROM dbo.ListaNotasClientes(CPF)) AS NUM_NF FROM [TABELA DE CLIENTES]

--Lista numero da NF e total de faturamento por cliente 
SELECT A.CPF, A.NUM_NF, B.FATURAMENTO_TOTAL FROM
	(SELECT CPF, (SELECT COUNT(*) FROM dbo.ListaNotasClientes(CPF)) AS NUM_NF 
	FROM [TABELA DE CLIENTES]) A
INNER JOIN 
	(SELECT CPF, SUM(dbo.FaturamentoNota(NUMERO)) AS FATURAMENTO_TOTAL 
	FROM [NOTAS FISCAIS] GROUP BY CPF) B
ON A.CPF = B.CPF