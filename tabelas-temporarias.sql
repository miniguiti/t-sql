-->> TABELAS TEMPORARIAS <<--

-- # vale para conex�o vigente
-- ## vale para todas as conex�es vigentes
-- @ vale para bloco sendo executado


CREATE TABLE #TABELA01 (ID VARCHAR(10) NULL, NOME VARCHAR(200) NULL)

INSERT INTO #TABELA01 (ID, NOME) VALUES ('1', 'Jo�o')

SELECT * FROM #TABELA01

