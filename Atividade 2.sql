BEGIN;
DROP SCHEMA IF EXISTS empresa_brunno;
CREATE SCHEMA empresa_brunno;
USE empresa_brunno;

CREATE TABLE Startup(
	id_startup CHAR(5) PRIMARY KEY NOT NULL,
	nome_startup VARCHAR(64) NOT NULL,
	cidade_sede VARCHAR (64)
);
    
CREATE TABLE Linguagem_Programacao(
	id_linguagem CHAR(5) PRIMARY KEY NOT NULL,
	nome_linguagem VARCHAR(64) NOT NULL,
	ano_lançamento YEAR NOT NULL
);
    
CREATE TABLE Programador(
	id_programador CHAR(5) PRIMARY KEY NOT NULL,
	id_startup CHAR(5),
	nome_programador VARCHAR(255) NOT NULL,
	gênero CHAR(1),
	data_nascimento DATE,
	email VARCHAR(255) UNIQUE
);
    
CREATE TABLE Programador_Linguagem(
	id_programador CHAR(5) NOT NULL,
	id_linguagem CHAR(5) NOT NULL
);

CREATE TABLE projetos(
	id_projeto CHAR(5) PRIMARY KEY NOT NULL,
	projeto_nome VARCHAR(255) NOT NULL,
	id_linguagem CHAR(5) NOT NULL,
	id_startup CHAR(5) NOT NULL
);


-- Populando
INSERT INTO Startup VALUES
	('10001','Tech4Toy','Porto Alegre'),
	('10002','Smart123','Belo Horizonte'),
	('10003','knowledgeUp','Rio de Janeiro'),
	('10004','BSI Next Level','Recife'),
	('10005','QualiHealth','São Paulo'),
	('10006','ProEdu','Florianópolis')
;

INSERT INTO Linguagem_Programacao VALUES
	('20001','Python','1991'),
	('20002','PHP','1995'),
	('20003','Java','1995'),
	('20004','C','1972'),
	('20005','JavaScript','1995'),
	('20006','Dart','2011')
;

INSERT INTO Programador VALUES
	('30001','10001','João Pedro','M','1993-06-23','joaop@mail.com'),
	('30002','10002','Paula Silva','F','1986-01-10','paulas@mail.com'),
	('30003','10003','Renata Vieira','F','1991-05-07','renatav@mail.com'),
	('30004','10004','Felipe Santos','M','1976-11-25','felipes@mail.com'),
	('30005','10001','Ana Cristina','F','1968-02-19','anac@mail.com'),
	('30006','10004','Alexandre Alves','M','1988-07-07','alexandrea@mail.com'),
	('30007','10002','Laura Marques','F','1987-10-04','lauram@mail.com')
;

INSERT INTO Programador_Linguagem VALUES
	('30001','20001'),
	('30001','20002'),
	('30002','20003'),
	('30003','20004'),
	('30003','20005'),
	('30004','20005'),
	('30007','20001'),
	('30007','20002')
;

INSERT INTO Projetos VALUES
	('40001','Lorem Ipsum','20001','10004'),
	('40002','dolor sit amet','20002','10004'),
	('40003','consectetur adipiscing','20003','10006'),
	('40004','sed do eiusmod','20001','10006')
;

ALTER TABLE Programador 
ADD FOREIGN KEY (id_startup) REFERENCES Startup(id_startup) 
ON DELETE CASCADE 
ON UPDATE CASCADE;

ALTER TABLE Programador_Linguagem 
ADD FOREIGN KEY(id_linguagem) REFERENCES Linguagem_Programacao(id_linguagem) 
ON DELETE RESTRICT;

ALTER TABLE Programador_Linguagem 
ADD FOREIGN KEY(id_programador) REFERENCES Programador(id_programador) 
ON DELETE RESTRICT;

ALTER TABLE Projetos 
ADD FOREIGN KEY(id_linguagem) REFERENCES Linguagem_Programacao(id_linguagem),
ADD FOREIGN KEY(id_startup) REFERENCES Startup(id_startup) 
ON DELETE CASCADE;

COMMIT;