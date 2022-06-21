USE empregados_db;

SELECT * FROM departamento;
SELECT * FROM empregado;
SELECT * FROM dependentes;
SELECT * FROM log_salario;
SELECT * FROM log_depto;

START TRANSACTION;
UPDATE empregado set salario=2560.30 WHERE cod_empregado=1;
ROLLBACK;
COMMIT;
/* Tabela de Log_Depto*/
START TRANSACTION;
CREATE TABLE `empregados_db`.`log_depto` (
  `cod_log_depto` INT NOT NULL AUTO_INCREMENT,
  `cod_empregado` INT NOT NULL,
  `emp_troca` INT NOT NULL,
  `dt_troca_depto` DATETIME NOT NULL,
  `depto_antigo` INT NOT NULL,
  `depto_novo` INT NOT NULL,
  `correcao_log` BIT(1) NOT NULL,
  PRIMARY KEY (`cod_log_depto`));
  ROLLBACK;
  COMMIT;
  /* Gatilho de empregado troca depto */
DELIMITER //
CREATE TRIGGER tg_log_depto_update BEFORE UPDATE ON empregado
FOR EACH ROW 
BEGIN
	IF(NEW.cod_depto <> OLD.cod_depto) THEN
		INSERT log_depto(cod_empregado, emp_troca, dt_troca_depto, depto_antigo, depto_novo, correcao_log)
        VALUES(NEW.cod_empregado, 0, NOW(), OLD.cod_depto, NEW.cod_depto, 0);
    END IF;
END //
DELIMITER ;
/* Trasação de Updates */
START TRANSACTION;
UPDATE empregado set cod_depto=2 WHERE cod_empregado=1;
UPDATE empregado set cod_depto=2 WHERE cod_empregado=3;
UPDATE empregado set cod_depto=4 WHERE cod_empregado=10;
UPDATE empregado set cod_depto=3 WHERE cod_empregado=11;
UPDATE empregado set cod_depto=3 WHERE cod_empregado=13;
UPDATE empregado set cod_depto=3 WHERE cod_empregado=14;
ROLLBACK;
COMMIT;

