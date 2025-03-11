CREATE TABLE PESSOAS (
idpessoa int identity(1,1) primary key,
cpf varchar(14),
nome varchar(30) not null,
sobrenome varchar(50) not null,
endereco varchar(50),
idade int
);

CREATE TABLE ANO_LETIVO (
idanoLetivo int identity(1,1) primary key,
ano varchar(4) not null,
data_inicio varchar(10) not null,
data_fim varchar(10) not null
);
INSERT INTO ANO_LETIVO(ano, data_inicio, data_fim)
VALUES 
	('2024','01/01/2024','31/12/2024'),
	('2025','01/01/2025','31/12/2025'),
	('2026','01/01/2026','31/12/2026'),
	('2027','01/01/2027','31/12/2027'),
	('2028','01/01/2028','31/12/2028'),
	('2029','01/01/2029','31/12/2029'),
	('2030','01/01/2030','31/12/2030'),
	('2031','01/01/2031','31/12/2031'),
	('2032','01/01/2032','31/12/2032'),
	('2033','01/01/2033','31/12/2033');

CREATE TABLE TURMA (
idturma int identity(1,1) primary key,
nome varchar(30) not null,
ANO_LETIVO_idAnoLetivo int foreign key references ANO_LETIVO (idanoLetivo) NOT NULL
);
select * from TURMA
insert into TURMA(nome, ANO_LETIVO_idAnoLetivo)
VALUES
		('1°B ENSINO MÉDIO', '1'),
		('2°B ENSINO MÉDIO', '2'),
		('3°B ENSINO MÉDIO', '3');

CREATE TABLE ALUNO(
	RM INT IDENTITY (1000,1) PRIMARY KEY,
	EMAIL_INSTITUCIONAL VARCHAR(50) NOT NULL,
	IDPESSOA INT NOT NULL,
	FOREIGN KEY (IDPESSOA) REFERENCES PESSOAS(idpessoa)
);
CREATE TABLE PROFESSOR(
	IDPROFESSOR INT IDENTITY(1,1) PRIMARY KEY,
	DATA_ADMISSAO DATE NOT NULL,
	ESPECIALIDADE VARCHAR(50) NOT NULL,
	IDPESSOA INT NOT NULL,
	FOREIGN KEY (idpessoa) REFERENCES PESSOAS(idpessoa)
);
CREATE TABLE MATRICULA(
	IDMATRICULA INT IDENTITY(1,1) PRIMARY KEY,
	RM INT NOT NULL,
	IDTURMA INT NOT NULL,
	NUMORDEM INT NOT NULL,
	PERIODO VARCHAR(20) NOT NULL,
	DATA_MATRICULA DATE NOT NULL,
	TIPO_MATRICULA VARCHAR(50) NOT NULL,
	STATUS VARCHAR (30) NOT NULL,
	IDANOLETIVO INT NOT NULL,
	FOREIGN KEY (RM) REFERENCES ALUNO(RM),
	FOREIGN KEY (idturma) REFERENCES TURMA(idturma),
	FOREIGN KEY (IDANOLETIVO) REFERENCES ANO_LETIVO(idanoLetivo)
);
insert into MATRICULA(RM, IDTURMA, NUMORDEM, PERIODO, DATA_MATRICULA, TIPO_MATRICULA, STATUS, IDANOLETIVO)
values
(1000,1,22,'T','2024-2-28','rematrícula','ativo',1),
(1001,2,24,'T','2025-2-28','rematrícula','ativo',2),
(1002,3,12,'T','2026-2-28','rematrícula','ativo',3),
(1003,1,46,'T','2024-2-28','rematrícula','ativo',1),
(1004,2,54,'T','2025-2-28','rematrícula','ativo',2),
(1005,3,31,'T','2026-2-28','rematrícula','ativo',3),
(1006,3,25,'T','2026-2-28','rematrícula','ativo',2),
(1007,2,42,'T','2025-2-28','rematrícula','ativo',1),
(1008,1,11,'T','2024-2-28','rematrícula','ativo',3),
(1009,2,13,'T','2025-2-28','rematrícula','ativo',3);
select * from PROFESSOR
INSERT INTO PROFESSOR(DATA_ADMISSAO, ESPECIALIDADE, IDPESSOA)
values
('2024-02-28', 'Mathematics', 1),
('2024-02-28', 'English', 2),
('2024-02-28', 'Portuguese', 3),
('2024-02-28', 'Españish', 4),
('2024-02-28', 'Ciencia', 5),
('2024-02-28', 'Pescaria', 6),
('2024-02-28', 'Education Finances', 7),
('2024-02-28', 'Sociales Relaciones', 8),
('2024-02-28', 'Física', 9),
('2024-02-28', 'Química', 10);
select * from TURMA
select * from DISCIPLINA
select * from PROFESSOR
insert into TURMADISCIPLINA(IDTURMA, IDDISCIPLINA, IDPROFESSOR)
values
(2,1,3),
(1,2,5),
(2,1,3),
(3,1,4),
(3,4,4),
(2,6,3),
(1,7,5),
(1,9,5),
(2,3,3),
(2,8,3);

insert into ALUNO(EMAIL_INSTITUCIONAL, IDPESSOA)
VALUES
('jonelso@jonelsoschool.jonelso', '1'),
('rodriguéles@jonelsoschool.jonelso','2'),
('raratakata@jonelsoschool.jonelso','3'),
('plinplinplon@jonelsoschool.jonelso','4'),
('a@jonelsoschool.jonelso','5'),
('internet@jonelsoschool.jonelso','6'),
('e@jonelsoschool.jonelso','7'),
('toxica@jonelsoschool.jonelso','8'),
('aquariano@jonelsoschool.jonelso', '9'),
('nato@jonelsoschool.jonelso','10');
update PROFESSOR
set ESPECIALIDADE='Química', IDPESSOA='10'
where IDPROFESSOR=12
select * from PROFESSOR;
insert into PROFESSOR(DATA_ADMISSAO, ESPECIALIDADE, IDPESSOA)
values
('2024-02-31','Mathematics','1');


CREATE TABLE TURMADISCIPLINA(
	IDTURMADISC INT IDENTITY(1,1) PRIMARY KEY,
	IDTURMA INT NOT NULL,
	IDDISCIPLINA INT NOT NULL,
	IDPROFESSOR INT NOT NULL,
	FOREIGN KEY (IDTURMA) REFERENCES TURMA(IDTURMA),
	FOREIGN KEY (IDDISCIPLINA) REFERENCES DISCIPLINA(IDDISCIPLINA),
	FOREIGN KEY (IDPROFESSOR) REFERENCES PROFESSOR (IDPROFESSOR)
	);

INSERT INTO TURMA(nome, ANO_LETIVO_idAnoLetivo)
VALUES 
	('1° SÉRIE B','1'),
	('2° SÉRIE B','2'),
	('3° SÉRIE B','3');


CREATE TABLE DISCIPLINA (
iddisciplina int identity(1,1) primary key,
nome varchar(255) not null,
);

INSERT INTO DISCIPLINA(nome)
VALUES 
	('Mathematics'),
	('English'),
	('Portuguese'),
	('Españish'),
	('Ciencia'),
	('Pescaria'),
	('Education Finances'),
	('Sociales Relaciones'),
	('Física'),
	('Química');

select * from DISCIPLINA;
select * from ANO_LETIVO;
select * from PESSOAS;
select * from TURMA;
select * from MATRICULA;
select * from PROFESSOR;
select * from ALUNO;
select * from TURMADISCIPLINA;

select AVG(idade)
FROM PESSOAS

select max(idade)
from PESSOAS

select COUNT(*)
from PESSOAS

INSERT INTO PESSOAS (cpf, nome, sobrenome, endereco, idade)
VALUES 
	('590-040-304-94', 'SAMUEL', 'ABRAÃO', 'BANCO DE DADOS', '12'),
	('915-238-574-02', 'RODRIGO', 'DESNECEFÁRIO', 'CALDEIRÃO', '84'),
	('480-715-789-15', 'HOMEM', 'ARANHA', 'NOVA IORQUE', '76'),
	('100-434-121-36', 'JORGE', 'PINHEIROS', 'ANTONIETA','65'),
	('219-313-983-65', 'ALBERTO', 'LIMA', 'MARINA MORETTI','43'),
	('420-190-313-85', 'JUNIOR', 'SUZA', 'ALTOS','20'),
	('480-715-789-15', 'VAGNER', 'SOUZA', 'PALMITAL','23'),
	('407-271-698-88', 'WAGNER', 'SZA', 'DO','26'),
	('799-515-013-20', 'WALLACE', 'ZA', 'PARQUE','39'),
	('305-273-655-19', 'UALLACE', 'A', 'NAÇÕES','2');



UPDATE PESSOAS SET cpf = '41848063000' WHERE idpessoa=1

DELETE PESSOAS WHERE idpessoa = 1

SELECT nome, sobrenome from PESSOAS

SELECT DISTINCT(nome) FROM PESSOAS

select * 
from PESSOAS
WHERE idpessoa IN(3,4)

select * 
from PESSOAS
WHERE endereco LIKE'%VIDAL%'

select * 
from PESSOAS
WHERE nome = 'SAMUEL'
AND endereco = 'AV SAMPAIO VIDAL'

select *
from PESSOAS
ORDER by nome DESC

select *
from PESSOAS
ORDER by nome, sobrenome


ALTER TABLE PESSOAS
ADD IDADE INT

UPDATE PESSOAS
SET idpessoa=1
WHERE idpessoa=3

DROP TABLE PESSOAS

select * from PESSOAS
select * from ALUNO
select * from TURMA
select * from PROFESSOR
select * from PESSOAS inner join ALUNO ON PESSOAS.IDPESSOA=ALUNO.IDPESSOA

select TURMA.nome AS NOME_TURMA, DISCIPLINA.nome AS NOME_DISCIPLINA, 
PESSOAS.nome AS NOME_PROFESSOR, PESSOAS.cpf AS CPF_PROFESSOR

	from TURMADISCIPLINA inner join TURMA 
	on TURMADISCIPLINA.IDTURMA=TURMA.IDTURMA
	inner join DISCIPLINA
	ON TURMADISCIPLINA.IDDISCIPLINA=DISCIPLINA.iddisciplina
	inner join PROFESSOR
	ON TURMADISCIPLINA.IDPROFESSOR=PROFESSOR.IDPROFESSOR
	INNER JOIN PESSOAS
	ON PESSOAS.IDPESSOA=PROFESSOR.IDPESSOA


ORDER BY TURMA.NOME, PESSOAS.nome

select PESSOAS.nome AS NOME, PESSOAS.sobrenome as SOBRENOME, PESSOAS.cpf as CPF,
		PROFESSOR.DATA_ADMISSAO as DATA_ADMISSAO, PROFESSOR.ESPECIALIDADE AS ESPECIALIDADE

		from PESSOAS INNER JOIN PROFESSOR
		ON PESSOAS.idpessoa=PROFESSOR.IDPROFESSOR

ORDER BY PESSOAS.nome, PROFESSOR.ESPECIALIDADE

select PESSOAS.nome AS NOME, PESSOAS.sobrenome as SOBRENOME, PESSOAS.cpf as CPF,
		ALUNO.RM as RM, ALUNO.EMAIL_INSTITUCIONAL AS EMAIL_INSTITUCIONAL

		from PESSOAS INNER JOIN ALUNO
		ON PESSOAS.idpessoa=ALUNO.IDPESSOA

ORDER BY PESSOAS.nome, ALUNO.RM

SELECT * FROM ANO_LETIVO
SELECT * FROM TURMA
select ANO_LETIVO.ano AS ANO, ANO_LETIVO.data_inicio AS DATA_INICIO, ANO_LETIVO.data_fim AS DATA_TERMINO,
	TURMA.nome AS NOME

	from TURMA inner join ANO_LETIVO
	on TURMA.idturma=ANO_LETIVO.idanoLetivo

ORDER BY TURMA.idturma, ANO_LETIVO.idanoLetivo

select * from MATRICULA
select * from ALUNO
select * from TURMA
select * from ANO_LETIVO

select MATRICULA.PERIODO AS PERIODO, MATRICULA.DATA_MATRICULA AS DATA_MATRICULA, MATRICULA.TIPO_MATRICULA AS TIPO_MATRICULA,
	MATRICULA.STATUS AS STATUS, TURMA.nome AS TURMA, ANO_LETIVO.ano AS ANO, ANO_LETIVO.data_inicio AS INICIO, ANO_LETIVO.data_fim AS FIM,
	ALUNO.RM AS RM, ALUNO.EMAIL_INSTITUCIONAL AS EMAIL_INSTITUCIONAL, PESSOAS.nome as NOME_ALUNO, PESSOAS.SOBRENOME as SOBRENOME_ALUNO

	from MATRICULA inner join ANO_LETIVO
	on MATRICULA.IDANOLETIVO=ANO_LETIVO.idanoLetivo

	INNER JOIN ALUNO
	ON MATRICULA.RM=ALUNO.RM

	INNER JOIN TURMA
	ON MATRICULA.IDTURMA=TURMA.idturma

	INNER JOIN PESSOAS
	ON ALUNO.IDPESSOA=PESSOAS.IDPESSOA