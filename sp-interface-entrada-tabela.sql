--> SPs com interface - Entrada tabela <--
USE SUCOS_VENDAS

--Busca faturamento total por cliente
SELECT A.[CPF], A.[NOME], SUM(C.[QUANTIDADE] * C.[PREÇO]) AS FATURAMENTO 
FROM [TABELA DE CLIENTES] A
	INNER JOIN [NOTAS FISCAIS] B
ON A.[CPF] = B.[CPF] AND YEAR(B.[DATA]) = 2016
	INNER JOIN [ITENS NOTAS FISCAIS] C ON  B.NUMERO = C.NUMERO
GROUP BY A.[CPF], A.[NOME]

--> Criando tipo para usar nas variaveis  
CREATE TYPE ListaClientes AS TABLE 
(CPF VARCHAR(12) NOT NULL)

-- A variavel recebe um tipo tabela (ListaCliente)
-- então se comporta como um array de memória 
-- que guarda os CPFs de clientes
DECLARE @LISTA AS ListaClientes
INSERT INTO @LISTA (CPF) VALUES ('5576228758'),('5648641702'),('5840119709')
SELECT * FROM @LISTA


SELECT * FROM [TABELA DE CLIENTES]

--> Usando a variavel do tipo tabela no join para buscar faturamento
-- dos clientes que estão na lista 
DECLARE @LISTA AS ListaClientes
INSERT INTO @LISTA (CPF) VALUES ('5576228758'),('5648641702'),('5840119709')

SELECT A.[CPF], A.[NOME], SUM(C.[QUANTIDADE] * C.[PREÇO]) AS FATURAMENTO 
FROM [TABELA DE CLIENTES] A
	INNER JOIN [NOTAS FISCAIS] B
ON A.[CPF] = B.[CPF] AND YEAR(B.[DATA]) = 2016
	INNER JOIN [ITENS NOTAS FISCAIS] C ON  B.NUMERO = C.NUMERO
	INNER JOIN @LISTA D ON D.CPF = A.CPF 
GROUP BY A.[CPF], A.[NOME]


--> Criando procedure para retornar faturamento de acordo com lista
CREATE PROCEDURE FaturamentoClientes
@LISTA AS ListaClientes READONLY 
AS
SELECT A.[CPF], A.[NOME], SUM(C.[QUANTIDADE] * C.[PREÇO]) AS FATURAMENTO 
FROM [TABELA DE CLIENTES] A
	INNER JOIN [NOTAS FISCAIS] B
ON A.[CPF] = B.[CPF] AND YEAR(B.[DATA]) = 2016
	INNER JOIN [ITENS NOTAS FISCAIS] C ON  B.NUMERO = C.NUMERO
	INNER JOIN @LISTA D ON D.CPF = A.CPF 
GROUP BY A.[CPF], A.[NOME]

-- Declarando variavel tipo tabela para passar na execução da procedure
DECLARE @ListaCPFs ListaClientes
INSERT INTO @ListaCPFs (CPF) VALUES ('5576228758'),('5648641702'),('5840119709')

--> Executando procedure para retornar faturamento
EXEC  FaturamentoClientes @LISTA = @ListaCPFs