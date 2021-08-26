CREATE DATABASE escola
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Portuguese_Brazil.1252'
    LC_CTYPE = 'Portuguese_Brazil.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

	CREATE VIEW estudantes_portugues (nome, matricula) AS
	SELECT e.nome, e.matricula 
	FROM estudante AS e JOIN cursa AS c 
	ON e.matricula = c.matricula_est JOIN disciplina AS d ON c.cod_disc = d.codigo
	WHERE d.descricao = 'Portugues';

	SELECT*FROM estudantes_portugues;

	CREATE OR REPLACE VIEW estudantes_portugues (nome, matricula, rg) AS
	SELECT e.nome, e.matricula, e.rg 
	FROM estudante AS e JOIN cursa AS c 
	ON e.matricula = c.matricula_est JOIN disciplina AS d ON c.cod_disc = d.codigo
	WHERE d.descricao = 'Portugues';

	CREATE VIEW numero_estudante_turma (serie, counter) AS
	SELECT t.serie, count(e.cod_turma)
	FROM turma AS t JOIN estudante AS e
	ON e.cod_turma = t.codigo
	GROUP BY t.serie;

	SELECT*FROM numero_estudante_turma;

	DROP VIEW numero_estudante_turma;
	
	CREATE VIEW estudantes_ingles (rg, telefone) AS
	SELECT e.rg, e.telefone 
	FROM estudante AS e JOIN cursa AS c 
	ON e.matricula = c.matricula_est JOIN disciplina AS d ON c.cod_disc = d.codigo
	WHERE d.descricao = 'Ingles';
	
	SELECT* FROM estudantes_ingles;

	
	
