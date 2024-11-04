-- COMANDO PRA LIGAR O BANCO DE DADOS: mysql -u root -p 

--  --  Criação do banco de dados eteccommerce
CREATE DATABASE eteccommerce;
USE eteccommerce;

--  Criação da tabela historico para armazenar informações de ações realizadas nas tabelas do banco de dados
CREATE TABLE historico (
    IDHISTORICO INT AUTO_INCREMENT PRIMARY KEY,  --  Chave primária auto-incremental para identificar unicamente cada registro
    ACAO VARCHAR(10) NOT NULL,  --  Coluna que armazena a ação realizada (INSERT, UPDATE, DELETE)
    TABELA VARCHAR(50) NOT NULL,  --  Coluna que indica em qual tabela a ação foi realizada
    ID INT NOT NULL,  --  Coluna que armazena o ID do registro afetado pela ação
    DTHISTORICO DATE NOT NULL,  --  Data em que a ação foi realizada
	HRHISTORICO TIME NOT NULL  --  Hora em que a ação foi realizada
) ENGINE=INNODB DEFAULT CHARSET=LATIN1;

--  Criação da tabela estado para armazenar informações sobre estados
CREATE TABLE estado
(
	IDESTADO INT PRIMARY KEY AUTO_INCREMENT,  --  Chave primária auto-incremental para identificar unicamente cada estado
	SIGLA VARCHAR(2) NOT NULL UNIQUE,  --  Coluna que armazena a sigla do estado, deve ser única
	NOME VARCHAR(50) NOT NULL UNIQUE,  --  Coluna que armazena o nome do estado, deve ser única
	DTINSERT DATE,
    CIDADES INT DEFAULT 0,  --  Coluna para armazenar a data de inserção do registro
	HRINSERT TIME,  --  Coluna para armazenar a hora de inserção do registro
	DTUPDATE DATE,  --  Coluna para armazenar a data de atualização do registro
	HRUPDATE TIME  --  Coluna para armazenar a hora de atualização do registro
) ENGINE=INNODB DEFAULT CHARSET=LATIN1;

--  Criação da tabela bkpestado para armazenar backups dos registros da tabela estado
CREATE TABLE bkpestado
(
	IDBKPESTADO INT PRIMARY KEY AUTO_INCREMENT,  --  Chave primária auto-incremental para identificar unicamente cada backup
	IDESTADO INT NOT NULL,  --  Coluna que armazena o ID do estado original
	SIGLA VARCHAR(2) NOT NULL,  --  Coluna que armazena a sigla do estado original
	NOME VARCHAR(50) NOT NULL,  --  Coluna que armazena o nome do estado original
	DTINSERT DATE,  --  Coluna para armazenar a data de inserção original
	HRINSERT TIME,  --  Coluna para armazenar a hora de inserção original
	DTUPDATE DATE,  --  Coluna para armazenar a data de atualização original
	HRUPDATE TIME,  --  Coluna para armazenar a hora de atualização original
	DTBKP DATE,  --  Coluna para armazenar a data em que o backup foi feito
	HRBKP TIME  --  Coluna para armazenar a hora em que o backup foi feito
) ENGINE=INNODB DEFAULT CHARSET=LATIN1;

--  Criação de triggers para automatizar tarefas em operações de inserção, atualização e exclusão

--  Exclui a trigger antesInserirEstado se ela já existir
DROP TRIGGER IF EXISTS antesInserirEstado;
--  Define o delimitador $$ para separar comandos dentro do bloco BEGIN...END da trigger
DELIMITER $$
--  Criação da trigger antesInserirEstado que será executada antes da inserção na tabela estado
CREATE TRIGGER antesInserirEstado BEFORE INSERT ON estado FOR EACH ROW
BEGIN
	SET NEW.NOME = UPPER(NEW.NOME);  --  Converte o nome do estado para letras maiúsculas
	SET NEW.SIGLA = UPPER(NEW.SIGLA);  --  Converte a sigla do estado para letras maiúsculas
	SET NEW.DTINSERT = CURRENT_DATE();  --  Define a data de inserção como a data atual
	SET NEW.HRINSERT = CURRENT_TIME();  --  Define a hora de inserção como a hora atual
END $$
DELIMITER ;  --  Redefine o delimitador padrão

--  Exclui a trigger antesAlterarEstado se ela já existir
DROP TRIGGER IF EXISTS antesAlterarEstado;
DELIMITER $$
--  Criação da trigger antesAlterarEstado que será executada antes de atualizar um registro na tabela estado
CREATE TRIGGER antesAlterarEstado BEFORE UPDATE ON estado FOR EACH ROW
BEGIN
	SET NEW.NOME = UPPER(NEW.NOME);  --  Converte o nome do estado para letras maiúsculas
	SET NEW.SIGLA = UPPER(NEW.SIGLA);  --  Converte a sigla do estado para letras maiúsculas
	SET NEW.DTUPDATE = CURRENT_DATE();  --  Define a data de atualização como a data atual
	SET NEW.HRUPDATE = CURRENT_TIME();  --  Define a hora de atualização como a hora atual
END $$
DELIMITER ;

--  Exclui a trigger antesExcluirEstado se ela já existir
DROP TRIGGER IF EXISTS antesExcluirEstado;
DELIMITER $$
--  Criação da trigger antesExcluirEstado (atualmente sem comandos)
CREATE TRIGGER antesExcluirEstado BEFORE DELETE ON estado FOR EACH ROW
BEGIN

END $$
DELIMITER ;

--  Exclui a trigger depoisInserirEstado se ela já existir
DROP TRIGGER IF EXISTS depoisInserirEstado;
DELIMITER $$
--  Criação da trigger depoisInserirEstado que será executada após a inserção na tabela estado
CREATE TRIGGER depoisInserirEstado AFTER INSERT ON estado FOR EACH ROW
BEGIN
	--  Insere um backup do registro inserido na tabela bkpestado
	INSERT INTO bkpestado(IDESTADO,SIGLA,NOME,DTINSERT,HRINSERT,DTUPDATE,HRUPDATE)
	VALUES (NEW.IDESTADO,
			NEW.SIGLA,
			NEW.NOME,
			NEW.DTINSERT,
			NEW.HRINSERT,
			NEW.DTUPDATE,
			NEW.HRUPDATE);
	--  Registra a ação de inserção na tabela historico
	INSERT INTO historico (ACAO,TABELA,ID) VALUES ("INSERT","estado",NEW.IDESTADO);
END $$
DELIMITER ;

--  Exclui a trigger depoisAlterarEstado se ela já existir
DROP TRIGGER IF EXISTS depoisAlterarEstado;
DELIMITER $$
--  Criação da trigger depoisAlterarEstado que será executada após a atualização de um registro na tabela estado
CREATE TRIGGER depoisAlterarEstado AFTER UPDATE ON estado FOR EACH ROW
BEGIN
	--  Insere um backup do registro atualizado na tabela bkpestado
	INSERT INTO bkpestado(IDESTADO,SIGLA,NOME,DTINSERT,HRINSERT,DTUPDATE,HRUPDATE)
	VALUES (NEW.IDESTADO,
			NEW.SIGLA,
			NEW.NOME,
			NEW.DTINSERT,
			NEW.HRINSERT,
			NEW.DTUPDATE,
			NEW.HRUPDATE);
	--  Registra a ação de atualização na tabela historico
	INSERT INTO historico (ACAO,TABELA,ID) VALUES ("UPDATE","estado",NEW.IDESTADO);			
END $$
DELIMITER ;

--  Exclui a trigger depoisExcluirEstado se ela já existir
DROP TRIGGER IF EXISTS depoisExcluirEstado;
DELIMITER $$
--  Criação da trigger depoisExcluirEstado que será executada após a exclusão de um registro na tabela estado
CREATE TRIGGER depoisExcluirEstado AFTER DELETE ON estado FOR EACH ROW
BEGIN
	--  Insere um backup do registro excluído na tabela bkpestado
	INSERT INTO bkpestado(IDESTADO,SIGLA,NOME,DTINSERT,HRINSERT,DTUPDATE,HRUPDATE)
	VALUES (OLD.IDESTADO,
			OLD.SIGLA,
			OLD.NOME,
			OLD.DTINSERT,
			OLD.HRINSERT,
			OLD.DTUPDATE,
			OLD.HRUPDATE);
	--  Registra a ação de exclusão na tabela historico
	INSERT INTO historico (ACAO,TABELA,ID) VALUES ("DELETE","estado",OLD.IDESTADO);				
END $$
DELIMITER ;

--  Exclui a trigger antesInserirBkpestado se ela já existir
DROP TRIGGER IF EXISTS antesInserirBkpestado;
DELIMITER $$
--  Criação da trigger antesInserirBkpestado que será executada antes da inserção na tabela bkpestado
CREATE TRIGGER antesInserirBkpestado BEFORE INSERT ON bkpestado FOR EACH ROW
BEGIN
	SET NEW.DTBKP = CURRENT_DATE();  --  Define a data de backup como a data atual
	SET NEW.HRBKP = CURRENT_TIME();  --  Define a hora de backup como a hora atual
END $$
DELIMITER ;

--  Exclui a trigger antesInserirHistorico se ela já existir
DROP TRIGGER IF EXISTS antesInserirHistorico;
DELIMITER $$
--  Criação da trigger antesInserirHistorico que será executada antes da inserção na tabela historico
CREATE TRIGGER antesInserirHistorico BEFORE INSERT ON historico FOR EACH ROW
BEGIN
	SET NEW.DTHISTORICO = CURRENT_DATE();  --  Define a data do histórico como a data atual
	SET NEW.HRHISTORICO = CURRENT_TIME();  --  Define a hora do histórico como a hora atual
END $$
DELIMITER ;


-- Tabela Cidade


--  cidade (IDCIDADE,NOME,IDESTADO,DTINSERT,HRINSERT,DTUPDATE,HRUPDATE)

CREATE TABLE cidade (
    IDCIDADE INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(50) NOT NULL,
    IDESTADO INT NOT NULL,
	DTINSERT DATE,
    HRINSERT TIME,
    DTUPDATE DATE,
    HRUPDATE TIME
) ENGINE=INNODB DEFAULT CHARSET=LATIN1;


--  bkpcidade(IDBKPCIDADE,IDCIDADE,NOME,IDESTADO,DTINSERT,HRINSERT,DTUPDATE,HRUPDATE,DTBKP,HRBKP)

CREATE TABLE bkpcidade (
    IDBKPCIDADE INT PRIMARY KEY AUTO_INCREMENT,
    IDCIDADE INT NOT NULL,
    NOME VARCHAR(50) NOT NULL,
    IDESTADO INT NOT NULL,
	DTINSERT DATE,
    HRINSERT TIME,
    DTUPDATE DATE,
    HRUPDATE TIME,
	DTBKP DATE,
	HRBKP TIME
) ENGINE=INNODB DEFAULT CHARSET=LATIN1;


-- fim tabela cidade

--  Lista de triggers planejadas, mas ainda não implementadas, para a tabela cidade e bkpCidade
--  TRIGGERS
--  antesInserirCidade
DROP TRIGGER IF EXISTS antesInserirCidade;
DELIMITER $$
CREATE TRIGGER antesInserirCidade BEFORE INSERT ON cidade FOR EACH ROW
BEGIN
	SET NEW.NOME = UPPER(NEW.NOME);    
	SET NEW.DTINSERT = CURRENT_DATE();  
	SET NEW.HRINSERT = CURRENT_TIME();  
END $$
DELIMITER ; 
--  antesAlterarCidade
DROP TRIGGER IF EXISTS antesAlterarCidade;
DELIMITER $$
CREATE TRIGGER antesAlterarCidade BEFORE UPDATE ON cidade FOR EACH ROW
SET NEW.NOME = UPPER(NEW.NOME);  
SET NEW.DTUPDATE = CURRENT_DATE();  
SET NEW.HRUPDATE = CURRENT_TIME();  
END $$
DELIMITER ;
--  antesExcluirCidade
DROP TRIGGER IF EXISTS antesExcluirCidade;
DELIMITER $$
CREATE TRIGGER antesExcluirCidade BEFORE DELETE ON cidade FOR EACH ROW
BEGIN

END $$
DELIMITER ;
--  depoisInserirCidade
DROP TRIGGER IF EXISTS depoisInserirCidade;
DELIMITER $$
CREATE TRIGGER depoisInserirCidade AFTER INSERT ON cidade FOR EACH ROW
BEGIN
		-- Alimentar a tabela bkpcidade
	
	
	INSERT INTO bkpcidade(IDCIDADE,NOME,IDESTADO,DTINSERT,HRINSERT,DTUPDATE,HRUPDATE)
	VALUES (NEW.IDCIDADE,
			NEW.NOME,
			NEW.IDESTADO,
			NEW.DTINSERT,
			NEW.HRINSERT,
			NEW.DTUPDATE,
			NEW.HRUPDATE);


		-- Alimentar a tabela histórico
	
	
	INSERT INTO historico (ACAO,TABELA,ID) VALUES ("INSERT","cidade",NEW.IDCIDADE);
END $$
DELIMITER ;
--  depoisAlterarCidade
DROP TRIGGER IF EXISTS depoisAlterarCidade;
DELIMITER $$
CREATE TRIGGER depoisAlterarCidade AFTER UPDATE ON cidade FOR EACH ROW
BEGIN
	
	INSERT INTO bkpcidade(IDCIDADE,NOME,IDESTADO,DTINSERT,HRINSERT,DTUPDATE,HRUPDATE)
	VALUES (NEW.IDCIDADE,
			NEW.NOME,
			NEW.IDESTADO,
			NEW.DTINSERT,
			NEW.HRINSERT,
			NEW.DTUPDATE,
			NEW.HRUPDATE);
	INSERT INTO historico (ACAO,TABELA,ID) VALUES ("UPDATE","cidade",NEW.IDCIDADE);			
END $$
DELIMITER ;
--  depoisExcluirCidade
DROP TRIGGER IF EXISTS depoisExcluirCidade;
DELIMITER $$
CREATE TRIGGER depoisExcluirCidade AFTER DELETE ON cidade FOR EACH ROW
BEGIN
	INSERT INTO bkpcidade(IDCIDADE,NOME,IDESTADO,DTINSERT,HRINSERT,DTUPDATE,HRUPDATE)
	VALUES (OLD.IDCIDADE,
			OLD.NOME,
			OLD.IDESTADO,
			OLD.DTINSERT,
			OLD.HRINSERT,
			OLD.DTUPDATE,
			OLD.HRUPDATE);
	INSERT INTO historico (ACAO,TABELA,ID) VALUES ("DELETE","cidade",OLD.IDCIDADE);				
END $$
DELIMITER ;
--  antesInserirBkpCidade
DROP TRIGGER IF EXISTS antesInserirBkpcidade;
DELIMITER $$
CREATE TRIGGER antesInserirBkpcidade BEFORE INSERT ON bkpcidade FOR EACH ROW
BEGIN
	SET NEW.DTBKP = CURRENT_DATE();  
	SET NEW.HRBKP = CURRENT_TIME();  
END $$
DELIMITER ;

-- Funções

-- Função inserirEstado
DROP FUNCTION IF EXISTS inserirEstado;
DELIMITER $$                             
CREATE FUNCTION inserirEstado (pSIGLA VARCHAR(2), pNOME VARCHAR(50)) RETURNS TEXT DETERMINISTIC
BEGIN
    DECLARE resultado INT;
    DECLARE textoResultado TEXT;

    -- Verificar se a sigla tem exatamente 2 caracteres
    IF CHAR_LENGTH(pSIGLA) != 2 THEN
        SET resultado = 1;  -- Retorna 1 para violação da condição da sigla
        SET textoResultado = 'Erro: A sigla deve ter exatamente 2 caracteres.';
    
    -- Verificar se a sigla contém apenas letras (incluindo acentuação e cê cedilha)
    ELSEIF pSIGLA NOT REGEXP '^[A-Za-zÀ-ÿ]+$' THEN
        SET resultado = 5;  -- Retorna 5 para violação de caracteres inválidos na sigla
        SET textoResultado = 'Erro: A sigla deve conter apenas letras (incluindo acentuação e cedilha).';

    -- Verificar se o nome tem, no mínimo, 4 caracteres
    ELSEIF CHAR_LENGTH(pNOME) < 4 THEN
        SET resultado = 2;  -- Retorna 2 para violação da condição do nome
        SET textoResultado = 'Erro: O nome do estado deve ter no mínimo 4 caracteres.';
    
    -- Verificar se o nome contém apenas letras, acentuação, cê cedilha e espaços
    ELSEIF pNOME NOT REGEXP '^[A-Za-zÀ-ÿ ]+$' THEN
        SET resultado = 6;  -- Retorna 6 para violação de caracteres inválidos no nome
        SET textoResultado = 'Erro: O nome deve conter apenas letras (incluindo acentuação e cedilha) e espaços.';

    ELSE
        -- Verificar se já existe um estado com a mesma SIGLA
        IF (SELECT COUNT(*) FROM estado WHERE SIGLA = pSIGLA) > 0 THEN
            SET resultado = 3;  -- Retorna 3 para violação da restrição UNIQUE em SIGLA
            SET textoResultado = 'Erro: Já existe um estado cadastrado com essa sigla.';

        -- Verificar se já existe um estado com o mesmo NOME
        ELSEIF (SELECT COUNT(*) FROM estado WHERE NOME = pNOME) > 0 THEN
            SET resultado = 4;  -- Retorna 4 para violação da restrição UNIQUE em NOME
            SET textoResultado = 'Erro: Já existe um estado cadastrado com esse nome.';
        
        ELSE
            -- Tentar inserir o novo estado
            INSERT INTO estado (SIGLA, NOME) VALUES (pSIGLA, pNOME);
            SET resultado = 0;  -- Retorna 0 se o INSERT for executado com sucesso
            SET textoResultado = 'Sucesso: O estado foi inserido corretamente.';
        END IF;
    END IF;

    RETURN textoResultado;  -- Retorna a mensagem com o resultado da operação
END$$
DELIMITER ;


-- função alterarEstado;
DROP FUNCTION IF EXISTS alterarEstado;
DELIMITER $$
CREATE FUNCTION alterarEstado (pIDESTADO INT, pSIGLA VARCHAR (2), pNOME VARCHAR (50)) RETURNS TEXT DETERMINISTIC
BEGIN
	DECLARE resultado INT;
	DECLARE textoResultado TEXT;

	-- Verificar se o estado com o ID informado existe
	
	IF (SELECT COUNT(*) FROM estado WHERE IDESTADO = pIDESTADO) = 0 THEN
		SET textoResultado= 'Erro: O estado com o ID informado não existe.';

	
	-- Verificar se a sigla tem exatamente 2 caracteres
	ELSEIF CHAR_LENGTH (pSIGLA) != 2 THEN
		SET textoResultado = 'Erro: A sigla deve ter exatamente 2 caracteres.';
    

	-- Verificar se a sigla contém apenas letras (incluindo acentuação e cê cedilha)

	ELSEIF pSIGLA NOT REGEXP '^[A-Za-zÂ-ÿ]+$' THEN
		SET textoResultado = 'Erro: A sigla deve conter apenas letras (incluindo acentuação e cê cedilha)';
    
    -- Verificar se o nome tem, no mínimo, 4 caracteres
    ELSEIF CHAR_LENGTH (pNOME) < 4 THEN
	SET textoResultado = 'Erro: o nome do estado deve ter no mínimo 4 caracteres';


-- Verificar se a sigla contém apenas letras (incluindo acentuação e cê cedilha)

	ELSEIF pNOME NOT REGEXP '^[A-Za-zÂ-ÿ]+$' THEN
		SET textoResultado = 'Erro: O nome deve conter apenas letras (incluindo acentuação e cê cedilha)';


	ELSE

		-- verificar se já existe um estado com a mesma SIGLA, mas com ID diferente

		IF (SELECT COUNT(*) FROM estado WHERE SIGLA= pSIGLA AND IDESTADO !=pIDESTADO) > 0 THEN
			SET textoResultado = 'Erro: Já existe um estado cadastrado com essa sigla.';

		-- verificar se já existe um estado com o mesmo NOME, mas com ID diferente

		ELSEIF (SELECT COUNT(*) FROM estado WHERE NOME= pNOME AND IDESTADO !=pIDESTADO) > 0 THEN
			SET textoResultado = 'Erro: Já existe um estado cadastrado com esse nome.';
        
		ELSE
			-- Tentar atualizar o estado existente

			UPDATE estado
			SET SIGLA = pSIGLA, NOME = pNOME WHERE IDESTADO = pIDESTADO;
			SET textoResultado= 'Sucesso: O estado foi atualizado corretamente.';
		END IF;
    END IF;

	RETURN textoResultado; -- Retorna a mensagem com o resultado da operação
END$$
DELIMITER ;

-- Função excluirEstado
DROP FUNCTION IF EXISTS excluirEstado;
DELIMITER $$
CREATE FUNCTION excluirEstado (pIDESTADO INT) RETURNS TEXT DETERMINISTIC

BEGIN
	DECLARE textoResultado TEXT;

	-- verificar se o estado com o ID informado existe
	IF (SELECT COUNT(*) FROM estado WHERE IDESTADO = pIDESTADO) = 0 THEN
		SET textoResultado = 'Erro: O estado com o ID informado não existe.';

    -- Verificar se há cidades cadastradas para o estado

	ELSEIF (SELECT COUNT(*) FROM cidade WHERE IDESTADO = pIDESTADO) > 0 THEN
		SET textoResultado = 'Erro: Existem cidades cadastradas para esse estado. Não é possível exclui-lo.';

	ELSE
		-- Tentar excluir o estado
		DELETE FROM estado WHERE IDESTADO = pIDESTADO;


		SET textoResultado = 'Sucesso: o estado foi excluído corretamente.';

	END IF;

RETURN textoResultado; 

END$$
DELIMITER ;

-- inserirCidade
DROP FUNCTION IF EXISTS inserirEstado;
DELIMITER $$
CREATE FUNCTION inserirEstado (pSIGLA VARCHAR(2),pNOME VARCHAR(50)) RETURNS TEXT DETERMINISTIC
BEGIN
	DECLARE vRETORNO TEXT;

	-- Vericar se a sigla tem exatamente 2 caracteres
	IF CHAR_LENGTH(pSIGLA) != 2 THEN
		SET vRETORNO = 'Erro: A sigla deve ter exatamente 2 caracteres.';
		
	-- Verificar se o nome tem pelo menos 4 caracteres
	ELSEIF CHAR_LENGTH(pNOME) < 4 THEN
		SET vRETORNO = 'Erro: O nome do estado deve ter no mínimo 4 caracteres.';
		
	-- Verificar se o nome tem no máximo 50 caracteres
	ELSEIF CHAR_LENGTH(pNOME) > 50 THEN
		SET vRETORNO = 'Erro: O nome do estado deve ter no máximo 50 caracteres';		
		
	-- Verificar se a sigla tem caracteres diferes de letras e acentuação
	ELSEIF pSIGLA NOT REGEXP '^[A-Za-zÀ-ÿ]+$' THEN
		SET vRETORNO = 'Erro: A sigla deve conter apenas letras (incluindo acentuação e cedilha).';
		
	-- Verificar se o nome tem caracteres diferes de letras e acentuação
	ELSEIF pNOME NOT REGEXP '^[A-Za-zÀ-ÿ ]+$' THEN
		SET vRETORNO = 'Erro: O nome deve conter apenas letras (incluindo acentuação e cedilha).';
		
	-- Verificar se a sigla já está cadastrada
	ELSEIF (SELECT COUNT(*) FROM estado WHERE SIGLA = pSIGLA) > 0 THEN
		SET vRETORNO = 'Erro: Já existe um estado cadastrado com essa sigla.';
		
	-- Verificar se o nome já está cadastrado
	ELSEIF (SELECT COUNT(*) FROM estado WHERE NOME = pNOME) > 0 THEN
		SET vRETORNO = 'Erro: Já existe um estado cadastrado com esse nome.';
		
	-- Executar o comando INSERT
	ELSE
		INSERT INTO estado (SIGLA,NOME) VALUES (pSIGLA,pNOME);
		SET vRETORNO="Sucesso: o estado foi inserido corretamente";
	END IF;
	
	RETURN vRETORNO;
END $$
DELIMITER ;

CREATE VIEW viewEstados AS
SELECT IDESTADO,SIGLA,NOME,CIDADES FROM estado ORDER BY NOME;


SELECT * FROM viewEstados;

marca(IDMARCA,NOME,PRODUTOS,DTINSERT,HRINSERT,DTUPDATE,RHUPDATE)
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


bkpmarca(IDBKPMARCA,IDMARCA,NOME,PRODUTOS,,HRINSERT,DTUPDATE,RHUPDATE,DTBKP,HRBKP)
CREATE TABLE bkpmarca
(
	IDBKPMARCA INT PRIMARY KEY AUTO_INCREMENT,
	IDMARCA INT NOT NULL,
	NOME VARCHAR(50) NOT NULL UNIQUE,
	PRODUTOS INT DEFAULT 0,
	DTINSERT DATE,
	HRINSERT TIME,
	DTUPDATE DATE,
	HRUPDATE TIME,
	DTBKP,
	HRBKP
) ENGINE=INNODB DEFAULT CHARSET=LATIN1;

-- unidade(IDUNIDADE, NOME, PRODUTOS, DTINSERT, HRINSERT, DTUPDATE, RHUPDATE)
CREATE TABLE unidade
(
    IDUNIDADE INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(20) NOT NULL UNIQUE,
    PRODUTOS INT DEFAULT 0,
    DTINSERT DATE,
    HRINSERT TIME,
    DTUPDATE DATE,
    RHUPDATE TIME
) ENGINE=INNODB DEFAULT CHARSET=LATIN1;

-- bkpunidade(IDBKPUNIDADE, IDUNIDADE, NOME, PRODUTOS, HRINSERT, DTUPDATE, RHUPDATE, DTBKP, HRBKP)
CREATE TABLE bkpunidade
(
    IDBKPUNIDADE INT PRIMARY KEY AUTO_INCREMENT,
    IDUNIDADE INT NOT NULL,
    NOME VARCHAR(20) NOT NULL,
    PRODUTOS INT DEFAULT 0,
    DTINSERT DATE,
    HRINSERT TIME,
    DTUPDATE DATE,
    RHUPDATE TIME,
    DTBKP DATE,
    HRBKP TIME
) ENGINE=INNODB DEFAULT CHARSET=LATIN1;

-- bkpcidade(IDBKPCIDADE, IDCIDADE, NOME, IDESTADO, CLIENTES, DTINSERT, HRINSERT, DTUPDATE, HRUPDATE, DTBKP, HRBKP)
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

-- antesInserirCidade
DROP TRIGGER IF EXISTS antesInserirCidade;
DELIMITER $$ 
CREATE TRIGGER antesInserirCidade BEFORE INSERT ON cidade FOR EACH ROW
BEGIN
    SET NEW.NOME = UPPER(NEW.NOME);
    SET NEW.DTINSERT = CURRENT_DATE();
    SET NEW.HRINSERT = CURRENT_TIME();
END $$ 
DELIMITER ;

-- antesAlterarCidade
DROP TRIGGER IF EXISTS antesAlterarCidade;
DELIMITER $$ 
CREATE TRIGGER antesAlterarCidade BEFORE INSERT ON cidade FOR EACH ROW
BEGIN
    SET NEW.NOME = UPPER(NEW.NOME);
    SET NEW.DTINSERT = CURRENT_DATE();
    SET NEW.HRINSERT = CURRENT_TIME();
END $$ 
DELIMITER ;

-- depoisAlterarCidade
DROP TRIGGER IF EXISTS depoisAlterarCidade;
DELIMITER $$ 
CREATE TRIGGER depoisAlterarCidade AFTER UPDATE ON cidade FOR EACH ROW
BEGIN
    -- Alimentar a tabela bkpcidade
    INSERT INTO bkpcidade (IDCIDADE, NOME, IDESTADO, DTINSERT, HRINSERT, DTUPDATE, HRUPDATE)
    VALUES (NEW.IDCIDADE, NEW.NOME, NEW.IDESTADO, NEW.DTINSERT, NEW.HRINSERT, NEW.DTUPDATE, NEW.HRUPDATE);

    -- Alimentar a tabela historico
    INSERT INTO historico (ACAO, TABELA, ID)
    VALUES ('UPDATE', 'cidade', NEW.IDCIDADE);

    -- Calcular e atualizar o número de CIDADES do estado
    IF (NEW.IDESTADO <> OLD.IDESTADO) THEN
        CALL calcularCidades(NEW.IDESTADO);
        CALL calcularCidades(OLD.IDESTADO);
    END IF;
END $$ 
DELIMITER ;

-- depoisExcluirCidade
DROP TRIGGER IF EXISTS depoisExcluirCidade;
DELIMITER $$ 
CREATE TRIGGER depoisExcluirCidade AFTER DELETE ON cidade FOR EACH ROW
BEGIN
    -- Alimentar a tabela bkpcidade
    INSERT INTO bkpcidade (IDCIDADE, NOME, IDESTADO, DTINSERT, HRINSERT, DTUPDATE, HRUPDATE)
    VALUES (OLD.IDCIDADE, OLD.NOME, OLD.IDESTADO, OLD.DTINSERT, OLD.HRINSERT, OLD.DTUPDATE, OLD.HRUPDATE);

    -- Alimentar a tabela historico
    INSERT INTO historico (ACAO, TABELA, ID)
    VALUES ('DELETE', 'cidade', OLD.IDCIDADE);

    -- Calcular e atualizar o número de CIDADES do estado
    CALL calcularCidades(OLD.IDESTADO);
END $$ 
DELIMITER ;

-- inserirCidade
DROP FUNCTION IF EXISTS inserirCidade;
DELIMITER $$ 
CREATE FUNCTION inserirCidade (PNOME VARCHAR(50), PIDESTADO INT) RETURNS TEXT DETERMINISTIC
BEGIN
    DECLARE VRETORNO TEXT;

    -- Verificar se o NOME da cidade tem pelo menos 3 caracteres
    IF CHAR_LENGTH(PNOME) < 3 THEN
        SET VRETORNO = 'Erro: O nome deve ter pelo menos 3 caracteres.';

    -- Verificar se o NOME tem mais do que 50 caracteres
    ELSEIF CHAR_LENGTH(PNOME) > 50 THEN
        SET VRETORNO = 'Erro: O nome deve ter no máximo 50 caracteres.';

    -- Verificar se o nome tem caracteres diferentes de letras e acentuação
    ELSEIF PNOME NOT REGEXP '^[A-Za-zÀ-ÿ\s]+$' THEN
        SET VRETORNO = 'Erro: O nome deve conter apenas letras (incluindo acentuação e cedilha).';

    -- Verificar se o IDESTADO existe
    ELSEIF (SELECT COUNT(*) FROM estado WHERE IDESTADO = PIDESTADO) = 0 THEN
        SET VRETORNO = 'Erro: O estado indicado não existe.';

    -- Verificar se NOME e IDESTADO já estão cadastrados
    ELSEIF (SELECT COUNT(*) FROM cidade WHERE NOME = PNOME AND IDESTADO = PIDESTADO) > 0 THEN
        SET VRETORNO = 'Erro: A cidade já está cadastrada nesse estado.';

    -- Inserir a cidade
    ELSE
        INSERT INTO cidade (NOME, IDESTADO) VALUES (PNOME, PIDESTADO);
        SET VRETORNO = 'Sucesso: A cidade foi inserida corretamente.';
    END IF;

    RETURN VRETORNO;
END $$ 
DELIMITER ;

-- alterarCidade
DROP FUNCTION IF EXISTS alterarCidade;
DELIMITER $$ 
CREATE FUNCTION alterarCidade (PIDCIDADE INT, PNOME VARCHAR(50), PIDESTADO INT) RETURNS TEXT DETERMINISTIC
BEGIN
    DECLARE VRETORNO TEXT;

    -- Verificar se o NOME da cidade tem pelo menos 3 caracteres
    IF CHAR_LENGTH(PNOME) < 3 THEN
        SET VRETORNO = 'Erro: O nome deve ter pelo menos 3 caracteres.';

    -- Verificar se o NOME tem mais do que 50 caracteres
    ELSEIF CHAR_LENGTH(PNOME) > 50 THEN
        SET VRETORNO = 'Erro: O nome deve ter no máximo 50 caracteres.';

    -- Verificar se o nome tem caracteres diferentes de letras e acentuação
    ELSEIF PNOME NOT REGEXP '^[A-Za-zÀ-ÿ\s]+$' THEN
        SET VRETORNO = 'Erro: O nome deve conter apenas letras (incluindo acentuação e cedilha).';

    -- Verificar se o IDESTADO existe
    ELSEIF (SELECT COUNT(*) FROM estado WHERE IDESTADO = PIDESTADO) = 0 THEN
        SET VRETORNO = 'Erro: O estado indicado não existe.';

    -- Verificar se NOME e IDESTADO já estão cadastrados com um IDCIDADE diferente
    ELSEIF (SELECT COUNT(*) FROM cidade WHERE NOME = PNOME AND IDESTADO = PIDESTADO AND IDCIDADE <> PIDCIDADE) > 0 THEN
        SET VRETORNO = 'Erro: A cidade já está cadastrada nesse estado.';

    -- Alterar a cidade
    ELSE
        UPDATE cidade SET NOME = PNOME, IDESTADO = PIDESTADO WHERE IDCIDADE = PIDCIDADE;
        SET VRETORNO = 'Sucesso: A cidade foi alterada corretamente.';
    END IF;

    RETURN VRETORNO;
END $$ 
DELIMITER ;

-- excluirCidade
DROP FUNCTION IF EXISTS excluirCidade;
DELIMITER $$ 
CREATE FUNCTION excluirCidade (PIDCIDADE INT) RETURNS TEXT DETERMINISTIC
BEGIN
    DECLARE VRETORNO TEXT;

    -- Verificar se há CLIENTES na cidade
    IF (SELECT CLIENTES FROM cidade WHERE IDCIDADE = PIDCIDADE) > 0 THEN
        SET VRETORNO = 'Erro: Há clientes cadastrados na cidade.';

    -- Excluir a cidade
    ELSE
        DELETE FROM cidade WHERE IDCIDADE = PIDCIDADE;
        SET VRETORNO = 'Sucesso: A cidade foi excluída corretamente.';
    END IF;

    RETURN VRETORNO;
END $$ 
DELIMITER ;

-- calcularCidades
DROP PROCEDURE IF EXISTS calcularCidades;
DELIMITER $$ 
CREATE PROCEDURE calcularCidades (IN PIDESTADO INT)
BEGIN
    DECLARE VCIDADES INT;

    -- Contar o número de cidades no estado especificado
    SELECT COUNT(*) INTO VCIDADES FROM cidade WHERE IDESTADO = PIDESTADO;

    -- Atualizar o número de cidades no estado
    UPDATE estado SET CIDADES = VCIDADES WHERE IDESTADO = PIDESTADO;
END $$ 
DELIMITER ;
