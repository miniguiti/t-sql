-->> Procedure para calculos <<--

-- Atualiza idade de acordo com a data de nascimento

CREATE PROCEDURE CalculaIdade
AS
BEGIN
	UPDATE [TABELA DE CLIENTES] SET IDADE = DATEDIFF(YEAR, [DATA DE NASCIMENTO], GETDATE())
END
