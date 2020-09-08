-->> TABELAS TEMPORARIAS <<--

-- # vale para conexão vigente
-- ## vale para todas as conexões vigentes
-- @ vale para bloco sendo executado


CREATE TABLE #TABELA01 (ID VARCHAR(10) NULL, NOME VARCHAR(200) NULL)

INSERT INTO #TABELA01 (ID, NOME) VALUES ('1', 'João')

SELECT * FROM #TABELA01

