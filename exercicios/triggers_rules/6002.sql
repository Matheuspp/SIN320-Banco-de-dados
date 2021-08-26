CREATE DATABASE escola
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
        
        -- 3
        CREATE TABLE log_funcionario (
	    cpf_func VARCHAR(15),
	    novo_salario REAL,
	    Usuario VARCHAR(20),
	    data_hora TIMESTAMP
	);
	
	--4
	CREATE OR REPLACE RULE log_funcionario 
	AS ON UPDATE TO funcionario 
	WHERE new.salario <> old.salario DO 
	INSERT INTO log_funcionario(cpf_func, novo_salario, Usuario, data_hora) VALUES
	(new.cpf, new.salario, current_user, current_timestamp);
	
	--5
	UPDATE funcionario
	SET salario = 200
	WHERE cpf = '0987654321';
	
	SELECT * FROM log_funcioario;
	
	--6
	CREATE OR REPLACE RULE no_delete_profdisc_rule 
	AS ON DELETE TO professor_disciplina DO NOTHING;
	
	DELETE FROM professor_disciplina
	WHERE codigo_disc > 0;
	
	--7
	CREATE TABLE professor_disciplina_auditoria(
    	    codigo_disc INT,
	    cpf_func VARCHAR(15),
	    dt_exclusao DATE,
	    usuario VARCHAR(20)
	
	);
	
	--8
	CREATE OR REPLACE RULE tg_delete_prof_disc 
	AS ON  DELETE TO professor_disciplina
	WHERE codigo_disc = NULL  DO
	INSERT INTO professor_disciplina_auditoria(codigo_disc, cpf_func, dt_exclusao, usuario) VALUES
	(old.codigo_disc, old.cpf_func, current_timestamp, current_user);
	
	--9
	DELETE FROM professor_disciplina
	WHERE codigo_disc <> 0;

	SELECT * FROM professor_disciplina_auditoria;
	
	
	
	
	
	
