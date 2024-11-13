-- COMANDO PRA LIGAR O BANCO DE DADOS: mysql -u root -p 
-- Banco de Dados: eteccommerce
-- DROP DATABASE IF EXISTS eteccommerce;
-- CREATE DATABASE eteccommerce;
-- USE eteccommerce;


-- historico(IDHISTORICO,ACAO,TABELA,ID,DTACAO)
CREATE TABLE historico (
    IDHISTORICO INT AUTO_INCREMENT PRIMARY KEY, 
    ACAO VARCHAR(10) NOT NULL,
    TABELA VARCHAR(50) NOT NULL,
    ID INT NOT NULL,
    DTHISTORICO DATE NOT NULL ,
	HRHISTORICO TIME NOT NULL
) ENGINE=INNODB DEFAULT CHARSET=LATIN1;

-- estado(IDESTADO,SIGLA,NOME,DTINSERT,CIDADES,HRINSERT,DTUPDATE,HRUPDATE)
CREATE TABLE estado
(
	IDESTADO INT PRIMARY KEY AUTO_INCREMENT,
	SIGLA VARCHAR(2) NOT NULL UNIQUE,
	NOME VARCHAR(50) NOT NULL UNIQUE,
	CIDADES INT DEFAULT 0,
	DTINSERT DATE,
	HRINSERT TIME,
	DTUPDATE DATE,
	HRUPDATE TIME
) ENGINE=INNODB DEFAULT CHARSET=LATIN1;


-- bkpestado(IDBKPESTADO,IDESTADO,SIGLA,NOME,CIDADES,DTINSERT,HRINSERT,DTUPDATE,HRUPDATE,DTBKP,HRBKP)
CREATE TABLE bkpestado
(
	IDBKPESTADO INT PRIMARY KEY AUTO_INCREMENT,
	IDESTADO INT NOT NULL,
	SIGLA VARCHAR(2) NOT NULL,
	NOME VARCHAR(50) NOT NULL,
	CIDADES INT,
	DTINSERT DATE,
	HRINSERT TIME,
	DTUPDATE DATE,
	HRUPDATE TIME,
	DTBKP DATE,
	HRBKP TIME
) ENGINE=INNODB DEFAULT CHARSET=LATIN1;

-- marca(IDMARCA,NOME,PRODUTOS,DTINSERT,HRINSERT,DTUPDATE,RHUPDATE)
CREATE TABLE marca
(
	IDMARCA INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(50) NOT NULL UNIQUE,
	PRODUTOS INT DEFAULT 0,
	DTINSERT DATE,
	HRINSERT TIME,
	DTUPDATE DATE,
	HRUPDATE TIME
) ENGINE=INNODB DEFAULT CHARSET=LATIN1;


-- bkpmarca(IDBKPMARCA,IDMARCA,NOME,PRODUTOS,HRINSERT,DTUPDATE,RHUPDATE,DTBKP,HRBKP)
CREATE TABLE bkpmarca
(
	IDBKPMARCA INT PRIMARY KEY AUTO_INCREMENT,
	IDMARCA INT NOT NULL,
	NOME VARCHAR(50) NOT NULL,
	PRODUTOS INT DEFAULT 0,
	DTINSERT DATE,
	HRINSERT TIME,
	DTUPDATE DATE,
	HRUPDATE TIME,
	DTBKP DATE,
	HRBKP TIME
) ENGINE=INNODB DEFAULT CHARSET=LATIN1;

-- unidade(IDUNIDADE,NOME,PRODUTOS,DTINSERT,HRINSERT,DTUPDATE,RHUPDATE)
CREATE TABLE unidade
(
	IDUNIDADE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(20) NOT NULL UNIQUE,
	PRODUTOS INT DEFAULT 0,
	DTINSERT DATE,
	HRINSERT TIME,
	DTUPDATE DATE,
	HRUPDATE TIME
) ENGINE=INNODB DEFAULT CHARSET=LATIN1;

-- bkpunidade(IDBKPUNIDADE,IDUNIDADE,NOME,PRODUTOS,HRINSERT,DTUPDATE,RHUPDATE,DTBKP,HRBKP)
CREATE TABLE bkpunidade
(
	IDBKPUNIDADE INT PRIMARY KEY AUTO_INCREMENT,
	IDUNIDADE INT NOT NULL,
	NOME VARCHAR(20) NOT NULL,
	PRODUTOS INT DEFAULT 0,
	DTINSERT DATE,
	HRINSERT TIME,
	DTUPDATE DATE,
	HRUPDATE TIME,
	DTBKP DATE,
	HRBKP TIME
) ENGINE=INNODB DEFAULT CHARSET=LATIN1;


-- cidade (IDCIDADE,NOME,IDESTADO,CLIENTES,DTINSERT,HRINSERT,DTUPDATE,HRUPDATE)
CREATE TABLE cidade 
(
	IDCIDADE INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(50) NOT NULL,
	IDESTADO INT NOT NULL,
	CLIENTES INT DEFAULT 0,
	DTINSERT DATE,
	HRINSERT TIME,
	DTUPDATE DATE,
	HRUPDATE TIME,
	FOREIGN KEY (IDESTADO) REFERENCES estado (IDESTADO)
) ENGINE=INNODB DEFAULT CHARSET=LATIN1;


-- bkpcidade(IDBKPCIDADE,IDCIDADE,NOME,IDESTADO,CLIENTES,DTINSERT,HRINSERT,DTUPDATE,HRUPDATE,DTBKP,HRBKP)
CREATE TABLE bkpcidade 
(
	IDBKPCIDADE INT PRIMARY KEY AUTO_INCREMENT,
	IDCIDADE INT NOT NULL,
	NOME VARCHAR(50) NOT NULL,
	IDESTADO INT NOT NULL,
	CLIENTES INT DEFAULT 0,
	DTINSERT DATE,
	HRINSERT TIME,
	DTUPDATE DATE,
	HRUPDATE TIME,
	DTBKP DATE,
	HRBKP TIME
) ENGINE=INNODB DEFAULT CHARSET=LATIN1;

-- produto (IDPRODUTO,NOME,PRECOCOMPRA,MARGEMLUCRO,PRECOVENDA,IDMARCA,IDUNIDADE,COMPRADOS,VENDIDOS,ESTOQUE, DTINSERT,HRINSERT,DTUPDATE,HRUPDATE)
CREATE TABLE produto (
	IDPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	NOME VARCHAR(50) NOT NULL,
	PRECOCOMPRA DECIMAL(10,2),
	MARGEMLUCRO DECIMAL(5,1),
	PRECOVENDA DECIMAL(10,2),
	IDMARCA INT,
	IDUNIDADE INT,
	COMPRADOS INT DEFAULT 0,
	VENDIDOS INT DEFAULT 0,
	ESTOQUE INT DEFAULT 0,
	DTINSERT DATE,
	HRINSERT TIME,
	DTUPDATE DATE,
	HRUPDATE TIME,
	FOREIGN KEY (IDMARCA) REFERENCES marca(IDMARCA),
	FOREIGN KEY (IDUNIDADE) REFERENCES unidade(IDUNIDADE)
) ENGINE=INNODB DEFAULT CHARSET=LATIN1;



-- bkpproduto (IDBKPPRODUTO,IDPRODUTO,NOME,PRECOCOMPRA,MARGEMLUCRO,PRECOVENDA,IDMARCA,IDUNIDADE,ESTOQUE, DTINSERT,HRINSERT,DTUPDATE,HRUPDATE,DTBKP,HRBKP)
CREATE TABLE bkpproduto 
(
	IDBKPPRODUTO INT PRIMARY KEY AUTO_INCREMENT,
	IDPRODUTO INT,
	NOME VARCHAR(50) NOT NULL,
	PRECOCOMPRA DECIMAL(10,2),
	MARGEMLUCRO DECIMAL(5,1),
	PRECOVENDA DECIMAL(10,2),
	IDMARCA INT,
	IDUNIDADE INT,
	COMPRADOS INT,
	VENDIDOS INT
	ESTOQUE INT,
	DTINSERT DATE,
	HRINSERT TIME,
	DTUPDATE DATE,
	HRUPDATE TIME,
	DTBKP DATE,
	HRBKP TIME
) ENGINE=INNODB DEFAULT CHARSET=LATIN1;



