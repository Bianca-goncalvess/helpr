USE empregados_db;

SELECT * FROM departamento;
SELECT * FROM empregado;
SELECT * FROM dependentes;
SELECT * FROM log_salario;


DELIMITER //
CREATE TRIGGER tg_log_salario_update BEFORE UPDATE ON empregado
FOR EACH ROW
BEGIN
IF (NEW.salario <> OLD.salario) THEN
INSERT log_salario(cod_empregado, cod_depto, dt_alteracao, valor_antigo, valor_novo)
VALUES(NEW.cod_empregado, NEW.cod_depto, NOW(), OLD.salario, NEW.salario);
END IF;
END //
DELIMITER ;
UPDATE empregado SET salario = 3125.40 WHERE cod_empregado=1;

UPDATE empregado SET salario = 4870.00 WHERE cod_empregado=14;
UPDATE empregado SET salario = 3820.25 WHERE cod_empregado=10;
UPDATE empregado SET salario = 8023.50 WHERE cod_empregado=5;
