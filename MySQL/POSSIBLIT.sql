USE empregados_db;
SELECT * FROM departamento;
SELECT * FROM empregado;
SELECT * FROM dependentes;
SELECT * FROM log_salario;
SELECT * FROM log_depto;


ALTER TABLE `empregados_db`.`log_salario` 
ADD COLUMN `correcao_legal` BIT(1) NOT NULL AFTER `valor_novo`,
ADD COLUMN `id_correcao` INT NOT NULL AFTER `correcao_legal`;

SELECT * FROM log_salario WHERE valor_antigo>valor_novo;

UPDATE log_salario SET correcao_legal=1, id_correcao=16 WHERE cod_log_salario=5;

DELIMITER //
CREATE PROCEDURE sps_verifica_log_salario(
IN dt_inicial_busca DATETIME,
IN dt_fim_busca DATETIME
)
BEGIN
	
END
//