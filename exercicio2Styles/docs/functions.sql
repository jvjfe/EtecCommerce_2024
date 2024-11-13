-- COMANDO PRA LIGAR O BANCO DE DADOS: mysql -u root -p 
-- Listar as FUNCTIONS
-- SELECT ROUTINE_NAME FROM INFORMATION_SCHEMA.ROUTINES WHERE ROUTINE_TYPE = 'FUNCTION' AND ROUTINE_SCHEMA = 'eteccommerce';

-- inserirEstado
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

	-- Verificar se a sigla tem caracteres diferes de letras e acentuação
	ELSEIF pSIGLA NOT REGEXP '^[A-Za-z]+$' THEN
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

-- A função REGEXP valida se o nome (pNOME) contém apenas letras (maiúsculas e minúsculas) com acentuação, 
-- o caractere "ç" e espaços. O padrão '^[A-Za-zÀ-ÿ ]+$' pode ser interpretado assim:
--    ^: Indica o início da string.
--   [A-Za-zÀ-ÿ ]: Define um conjunto de caracteres permitidos, composto por letras do alfabeto (incluindo caracteres acentuados) e o espaço ( ).
--    +: Indica que deve haver pelo menos um caractere da sequência anterior.
--    $: Marca o fim da string.

-- alterarEstado
DROP FUNCTION IF EXISTS alterarEstado;
DELIMITER $$                             
CREATE FUNCTION alterarEstado (pIDESTADO INT, pSIGLA VARCHAR(2), pNOME VARCHAR(50)) RETURNS TEXT DETERMINISTIC
BEGIN
    DECLARE vRETORNO TEXT;

    -- Verificar se o estado com o ID informado existe
    IF (SELECT COUNT(*) FROM estado WHERE IDESTADO = pIDESTADO) = 0 THEN
        SET vRETORNO = 'Erro: O estado com o ID informado não existe.';
    
    -- Verificar se a sigla tem exatamente 2 caracteres
    ELSEIF CHAR_LENGTH(pSIGLA) != 2 THEN
        SET vRETORNO = 'Erro: A sigla deve ter exatamente 2 caracteres.';
    
    -- Verificar se a sigla contém apenas letras 
    ELSEIF pSIGLA NOT REGEXP '^[A-Za-z]+$' THEN
        SET vRETORNO = 'Erro: A sigla deve conter apenas letras.';

    -- Verificar se o nome tem, no mínimo, 4 caracteres
    ELSEIF CHAR_LENGTH(pNOME) < 4 THEN
        SET vRETORNO = 'Erro: O nome do estado deve ter no mínimo 4 caracteres.';		
  
    -- Verificar se o nome contém apenas letras, acentuação, cê cedilha e espaços
    ELSEIF pNOME NOT REGEXP '^[A-Za-zÀ-ÿ ]+$' THEN
        SET vRETORNO = 'Erro: O nome deve conter apenas letras (incluindo acentuação e cedilha) e espaços.';

	-- Verificar se já existe um estado com a mesma SIGLA, mas com ID diferente
    ELSEIF (SELECT COUNT(*) FROM estado WHERE NOME = pNOME AND IDESTADO <> pIDESTADO) > 0 THEN
            SET vRETORNO = 'Erro: Já existe um estado cadastrado com essa sigla.';

    -- Verificar se já existe um estado com o mesmo NOME, mas com ID diferente
    ELSEIF (SELECT COUNT(*) FROM estado WHERE NOME = pNOME AND IDESTADO <> pIDESTADO) > 0 THEN
            SET vRETORNO = 'Erro: Já existe um estado cadastrado com esse nome.';
        
    ELSE
        -- Tentar atualizar o estado existente
        UPDATE estado SET SIGLA = pSIGLA, NOME = pNOME WHERE IDESTADO = pIDESTADO;            
        SET vRETORNO = 'Sucesso: O estado foi atualizado corretamente.';
    END IF;

    RETURN vRETORNO;  -- Retorna a mensagem com o resultado da operação
END$$
DELIMITER ;

-- excluirEstado
DROP FUNCTION IF EXISTS excluirEstado;
DELIMITER $$                             
CREATE FUNCTION excluirEstado (pIDESTADO INT) RETURNS TEXT DETERMINISTIC
BEGIN
    DECLARE vRETORNO TEXT;

    -- Verificar se o estado com o ID informado existe
    IF (SELECT COUNT(*) FROM estado WHERE IDESTADO = pIDESTADO) = 0 THEN
        SET vRETORNO = 'Erro: O estado com o ID informado não existe.';
    
    -- Verificar se há cidades cadastradas para o estado
    ELSEIF (SELECT COUNT(*) FROM cidade WHERE IDESTADO = pIDESTADO) > 0 THEN
        SET vRETORNO = 'Erro: Existem cidades cadastradas para esse estado. Não é possível excluí-lo.';
    
    ELSE
        -- Tentar excluir o estado
        DELETE FROM estado WHERE IDESTADO = pIDESTADO;        
        SET vRETORNO = 'Sucesso: O estado foi excluído corretamente.';
    END IF;

    RETURN vRETORNO;  -- Retorna a mensagem com o resultado da operação
END$$
DELIMITER ;

-- inserirMarca
DROP FUNCTION IF EXISTS inserirMarca;
DELIMITER $$
CREATE FUNCTION inserirMarca (pNOME VARCHAR(50)) RETURNS TEXT DETERMINISTIC
BEGIN
	DECLARE vRETORNO TEXT;

	-- Verificar se o nome tem pelo menos 2 caracteres
	IF CHAR_LENGTH(pNOME) < 2 THEN
		SET vRETORNO = 'Erro: O nome da marca deve ter no mínimo 2 caracteres.';
		
	-- Verificar se o nome tem caracteres diferes de letras e acentuação
	ELSEIF pNOME NOT REGEXP '^[A-Za-zÀ-ÿ0-9 ]+$' THEN
		SET vRETORNO = 'Erro: O nome deve conter apenas letras (incluindo acentuação e cedilha). e números';
		
	-- Verificar se o nome já está cadastrado
	ELSEIF (SELECT COUNT(*) FROM marca WHERE NOME = pNOME) > 0 THEN
		SET vRETORNO = 'Erro: Já existe uma marca cadastrada com esse nome.';
		
	-- Executar o comando INSERT
	ELSE
		INSERT INTO marca (NOME) VALUES (pNOME);
		SET vRETORNO="Sucesso: a marca foi inserida corretamente";
	END IF;
	
	RETURN vRETORNO;
END $$
DELIMITER ;

-- alterarMarca
DROP FUNCTION IF EXISTS alterarMarca;
DELIMITER $$
CREATE FUNCTION alterarMarca (pIDMARCA INT, pNOME VARCHAR(50)) RETURNS TEXT DETERMINISTIC
BEGIN
	DECLARE vRETORNO TEXT;
	
	-- Verificar se o pIDMARCA existe
	IF (SELECT COUNT(*) FROM marca WHERE IDMARCA=pIDMARCA)=0 THEN
		SET vRETORNO = 'O código da marca não existe.';

	-- Verificar se o nome tem pelo menos 2 caracteres
	ELSEIF CHAR_LENGTH(pNOME) < 2 THEN
		SET vRETORNO = 'Erro: O nome da marca o deve ter no mínimo 2 caracteres.';
		
	-- Verificar se o nome tem caracteres diferes de letras e acentuação
	ELSEIF pNOME NOT REGEXP '^[A-Za-zÀ-ÿ0-9 ]+$' THEN
		SET vRETORNO = 'Erro: O nome deve conter apenas letras (incluindo acentuação e cedilha). e números';
		
	-- Verificar se o nome já está cadastrado
	ELSEIF (SELECT COUNT(*) FROM marca WHERE IDMARCA!=pIDMARCA AND NOME = pNOME) > 0 THEN
		SET vRETORNO = 'Erro: Já existe uma marca cadastrado com esse nome.';
		
	-- Executar o comando UPDATE
	ELSE
		UPDATE marca SET NOME=pNOME WHERE IDMARCA=pIDMARCA;
		SET vRETORNO="Sucesso: a marca foi alterada corretamente";
	END IF;
	
	RETURN vRETORNO;
END $$
DELIMITER ;

-- excluirMarca
DROP FUNCTION IF EXISTS excluirMarca;
DELIMITER $$
CREATE FUNCTION excluirMarca (pIDMARCA INT) RETURNS TEXT DETERMINISTIC
BEGIN
	DECLARE vRETORNO TEXT;
	
	-- Verificar se o pIDMARCA existe
	IF (SELECT COUNT(*) FROM marca WHERE IDMARCA=pIDMARCA)=0 THEN
		SET vRETORNO = 'O código da marca não existe.';

	ELSE
		DELETE FROM marca WHERE IDMARCA=pIDMARCA;
		SET vRETORNO="Sucesso: a marca foi excluída com sucesso.";
	END IF;
	
	RETURN vRETORNO;
END $$
DELIMITER ;

-- inserirUnidade
DROP FUNCTION IF EXISTS inserirUnidade;
DELIMITER $$
CREATE FUNCTION inserirUnidade (pNOME VARCHAR(20)) RETURNS TEXT DETERMINISTIC
BEGIN
	DECLARE vRETORNO TEXT;

	-- Verificar se o nome tem pelo menos 2 caracteres
	IF CHAR_LENGTH(pNOME) < 2 THEN
		SET vRETORNO = 'Erro: O nome da unidade deve ter no mínimo 2 caracteres.';
		
	-- Verificar se o nome tem caracteres diferes de letras e acentuação
	ELSEIF pNOME NOT REGEXP '^[A-Za-zÀ-ÿ0-9 ]+$' THEN
		SET vRETORNO = 'Erro: O nome deve conter apenas letras (incluindo acentuação e cedilha). e números';
		
	-- Verificar se o nome já está cadastrado
	ELSEIF (SELECT COUNT(*) FROM unidade WHERE NOME = pNOME) > 0 THEN
		SET vRETORNO = 'Erro: Já existe uma unidade cadastrada com esse nome.';
		
	-- Executar o comando INSERT
	ELSE
		INSERT INTO unidade (NOME) VALUES (pNOME);
		SET vRETORNO="Sucesso: a unidade foi inserida corretamente";
	END IF;
	
	RETURN vRETORNO;
END $$
DELIMITER ;

-- alterarUnidade
DROP FUNCTION IF EXISTS alterarUnidade;
DELIMITER $$
CREATE FUNCTION alterarUnidade (pIDUNIDADE INT, pNOME VARCHAR(20)) RETURNS TEXT DETERMINISTIC
BEGIN
	DECLARE vRETORNO TEXT;
	
	-- Verificar se o pIDUNIDADE existe
	IF (SELECT COUNT(*) FROM unidade WHERE IDUNIDADE=pIDUNIDADE)=0 THEN
		SET vRETORNO = 'O código da unidade não existe.';

	-- Verificar se o nome tem pelo menos 2 caracteres
	ELSEIF CHAR_LENGTH(pNOME) < 2 THEN
		SET vRETORNO = 'Erro: O nome da unidade o deve ter no mínimo 2 caracteres.';
		
	-- Verificar se o nome tem caracteres diferes de letras e acentuação
	ELSEIF pNOME NOT REGEXP '^[A-Za-zÀ-ÿ0-9 ]+$' THEN
		SET vRETORNO = 'Erro: O nome deve conter apenas letras (incluindo acentuação e cedilha). e números';
		
	-- Verificar se o nome já está cadastrado
	ELSEIF (SELECT COUNT(*) FROM unidade WHERE IDUNIDADE!=pIDUNIDADE AND NOME = pNOME) > 0 THEN
		SET vRETORNO = 'Erro: Já existe uma unidade cadastrado com esse nome.';
		
	-- Executar o comando UPDATE
	ELSE
		UPDATE unidade SET NOME=pNOME WHERE IDUNIDADE=pIDUNIDADE;
		SET vRETORNO="Sucesso: a unidade foi alterada corretamente";
	END IF;
	
	RETURN vRETORNO;
END $$
DELIMITER ;

-- excluirUnidade
DROP FUNCTION IF EXISTS excluirUnidade;
DELIMITER $$
CREATE FUNCTION excluirUnidade (pIDUNIDADE INT) RETURNS TEXT DETERMINISTIC
BEGIN
	DECLARE vRETORNO TEXT;
	
	-- Verificar se o pIDUNIDADE existe
	IF (SELECT COUNT(*) FROM unidade WHERE IDUNIDADE=pIDUNIDADE)=0 THEN
		SET vRETORNO = 'O código da unidade não existe.';

	ELSE
		DELETE FROM unidade WHERE IDUNIDADE=pIDUNIDADE;
		SET vRETORNO="Sucesso: a unidade foi excluída com sucesso.";
	END IF;
	
	RETURN vRETORNO;
END $$
DELIMITER ;


-- inserirCidade
DROP FUNCTION IF EXISTS inserirCidade;
DELIMITER $$
CREATE FUNCTION inserirCidade (pNOME VARCHAR(50), pIDESTADO INT) RETURNS TEXT DETERMINISTIC
BEGIN
	DECLARE vRETORNO TEXT;

	-- Verificar se o NOME da cidade tem pelo menos 3 caracteres
	IF CHAR_LENGTH(pNOME) < 3 THEN
		SET vRETORNO = 'Erro: O nome deve ter pelo menos 3 caracteres.';
		
	-- Verificar se o NOME tem mais do que 50 caracteres
	ELSEIF CHAR_LENGTH(pNOME) > 50 THEN
		SET vRETORNO = 'Erro: O nome deve ter no máximo 50 caracteres.';
		
	-- Verificar se o nome tem caracteres diferentes de letras e acentuação
	ELSEIF pNOME NOT REGEXP '^[A-Za-zÀ-ÿ ]+$' THEN
		SET vRETORNO = 'Erro: O nome deve conter apenas letras (incluindo acentuação e cedilha).';
	
	-- Verificar se o IDESTADO existe
	ELSEIF (SELECT COUNT(*) FROM estado WHERE IDESTADO = pIDESTADO) = 0 THEN
		SET vRETORNO = 'Erro: O estado indicado não existe.';

	-- Verificar se NOME + IDESTADO já está cadastrado
	ELSEIF (SELECT COUNT(*) FROM cidade WHERE (NOME = pNOME) AND (IDESTADO = pIDESTADO)) > 0 THEN
		SET vRETORNO = 'Erro: A cidade já está cadastrada nesse estado.';
		
	-- Inserir a cidade	
	ELSE 
		INSERT INTO cidade (NOME, IDESTADO) VALUES (pNOME, pIDESTADO);
		SET vRETORNO = 'Sucesso: A cidade foi inserida corretamente.';
		
	END IF;
	
	RETURN vRETORNO;
END $$	
DELIMITER ;


-- alterarCidade
DROP FUNCTION IF EXISTS alterarCidade;
DELIMITER $$
CREATE FUNCTION alterarCidade (pIDCIDADE INT, pNOME VARCHAR(50), pIDESTADO INT) RETURNS TEXT DETERMINISTIC
BEGIN
	DECLARE vRETORNO TEXT;

	-- Verificar se o NOME da cidade tem pelo menos 3 caracteres
	IF CHAR_LENGTH(pNOME) < 3 THEN
		SET vRETORNO = 'Erro: O nome deve ter pelo menos 3 caracteres.';
		
	-- Verificar se o NOME tem mais do que 50 caracteres
	ELSEIF CHAR_LENGTH(pNOME) > 50 THEN
		SET vRETORNO = 'Erro: O nome deve ter no máximo 50 caracteres.';
		
	-- Verificar se o nome tem caracteres diferentes de letras e acentuação
	ELSEIF pNOME NOT REGEXP '^[A-Za-zÀ-ÿ ]+$' THEN
		SET vRETORNO = 'Erro: O nome deve conter apenas letras (incluindo acentuação e cedilha).';
	
	-- Verificar se o IDESTADO existe
	ELSEIF (SELECT COUNT(*) FROM estado WHERE IDESTADO = pIDESTADO) = 0 THEN
		SET vRETORNO = 'Erro: O estado indicado não existe.';

	-- Verificar se NOME + IDESTADO já está cadastrado com um IDCIDADE diferente
 	ELSEIF (SELECT COUNT(*) FROM cidade WHERE (NOME = pNOME) AND (IDESTADO = pIDESTADO) and (IDCIDADE<>pIDCIDADE)) > 0 THEN
		SET vRETORNO = 'Erro: A cidade já está cadastrada nesse estado.';
		
	-- Alterar a cidade	
	ELSE 
		UPDATE cidade SET NOME=pNOME,IDESTADO=pIDESTADO WHERE IDCIDADE=pIDCIDADE;
		SET vRETORNO = 'Sucesso: A cidade foi alterada corretamente.';
		
	END IF;
	
	RETURN vRETORNO;
END $$	
DELIMITER ;


-- excluirCidade
DROP FUNCTION IF EXISTS excluirCidade;
DELIMITER $$
CREATE FUNCTION excluirCidade (pIDCIDADE INT) RETURNS TEXT DETERMINISTIC
BEGIN
	DECLARE vRETORNO TEXT;

	-- Verificar se há CLIENTES na cidade
	IF (SELECT CLIENTES FROM cidade WHERE IDCIDADE=pIDCIDADE) > 0 THEN
		SET vRETORNO = 'Erro: Há clientes cadastrados na cidade.';		
	-- Excluir a cidade	
	ELSE 
		DELETE FROM cidade WHERE IDCIDADE=pIDCIDADE;
		SET vRETORNO = 'Sucesso: A cidade excluída corretamente.';
	END IF;
	
	RETURN vRETORNO;
END $$	
DELIMITER ;


-- inserirProduto
DROP FUNCTION IF EXISTS inserirProduto;
DELIMITER $$
CREATE FUNCTION inserirProduto (pNOME VARCHAR(50),pPRECOCOMPRA DECIMAL(10,2),pMARGEMLUCRO DECIMAL(5,1),pIDMARCA INT, pIDUNIDADE INT) RETURNS TEXT DETERMINISTIC
BEGIN
	DECLARE vRETORNO TEXT;

	-- Verificar se o NOME da produto tem pelo menos 3 caracteres
	IF CHAR_LENGTH(pNOME) < 3 THEN
		SET vRETORNO = 'Erro: O nome deve ter pelo menos 3 caracteres.';
		

	-- Verificar se IDMARCA existe
	ELSEIF (SELECT COUNT(*) FROM marca WHERE IDMARCA = pIDMARCA) = 0 THEN
		SET vRETORNO = 'Erro: A marca indicada não existe.';
		
	-- Verificar se IDUNIDADE existe
	ELSEIF (SELECT COUNT(*) FROM unidade WHERE IDUNIDADE = pIDUNIDADE) = 0 THEN
		SET vRETORNO = 'Erro: A unidade indicada não existe.';		

	-- Inserir a produto	
	ELSE 
		INSERT INTO produto (NOME,PRECOCOMPRA,MARGEMLUCRO,IDMARCA,IDUNIDADE) VALUES (pNOME,pPRECOCOMPRA,pMARGEMLUCRO,pIDMARCA, pIDUNIDADE);
		SET vRETORNO = 'Sucesso: O produto foi inserido corretamente.';
		
	END IF;
	
	RETURN vRETORNO;
END $$	
DELIMITER ;


-- alterarProduto
DROP FUNCTION IF EXISTS alterarProduto;
DELIMITER $$
CREATE FUNCTION alterarProduto (pIDPRODUTO INT, pNOME VARCHAR(50),pPRECOCOMPRA DECIMAL(10,2),pMARGEMLUCRO DECIMAL(5,1),pIDMARCA INT, pIDUNIDADE INT) RETURNS TEXT DETERMINISTIC
BEGIN
	DECLARE vRETORNO TEXT;

	-- Verificar se o NOME da produto tem pelo menos 3 caracteres
	IF CHAR_LENGTH(pNOME) < 3 THEN
		SET vRETORNO = 'Erro: O nome deve ter pelo menos 3 caracteres.';
		
	-- Verificar se IDMARCA existe
	ELSEIF (SELECT COUNT(*) FROM marca WHERE IDMARCA = pIDMARCA) = 0 THEN
		SET vRETORNO = 'Erro: A marca indicada não existe.';
		
	-- Verificar se IDUNIDADE existe
	ELSEIF (SELECT COUNT(*) FROM unidade WHERE IDUNIDADE = pIDUNIDADE) = 0 THEN
		SET vRETORNO = 'Erro: A unidade indicada não existe.';	
		
	-- Alterar a produto	
	ELSE 
		UPDATE produto SET NOME=pNOME,PRECOCOMPRA=pPRECOCOMPRA,MARGEMLUCRO=pMARGEMLUCRO, IDMARCA=pIDMARCA,IDUNIDADE=pIDUNIDADE WHERE IDPRODUTO=pIDPRODUTO;
		SET vRETORNO = 'Sucesso: O produto foi alterado corretamente.';
		
	END IF;
	
	RETURN vRETORNO;
END $$	
DELIMITER ;




-- excluirProduto
DROP FUNCTION IF EXISTS excluirProduto;
DELIMITER $$
CREATE FUNCTION excluirProduto (pIDPRODUTO INT) RETURNS TEXT DETERMINISTIC
BEGIN
	DECLARE vRETORNO TEXT;
	
	-- Verificar se há itens comprados na produto
	IF (SELECT COMPRADOS FROM produto WHERE IDPRODUTO=pIDPRODUTO) > 0 THEN
		SET vRETORNO = 'Erro: Foram efetuadas compras para esse produto.';		

	-- Verificar se há itens vendidos na produto
	ELSEIF(SELECT VENDIDOS FROM produto WHERE IDPRODUTO=pIDPRODUTO) > 0 THEN
		SET vRETORNO = 'Erro: Foram efetuadas vendas para esse produto.';		
	-- Excluir a produto	
	ELSE 
		DELETE FROM produto WHERE IDPRODUTO=pIDPRODUTO;
		SET vRETORNO = 'Sucesso: A produto excluída corretamente.';
	END IF;
	
	RETURN vRETORNO;
END $$	
DELIMITER ;

--viewProduto
DROP VIEW IF EXISTS viewProdutos;

CREATE VIEW viewProdutos AS
SELECT 
    produto.IDPRODUTO AS idProduto, 
    produto.NOME AS nomeProduto, 
    produto.PRECOCOMPRA AS precoCompra, 
    produto.MARGEMLUCRO AS margemLucro, 
    produto.PRECOVENDA AS precoVenda, 
    produto.IDMARCA AS idMarca, 
    marca.NOME AS nomeMarca, 
    produto.IDUNIDADE AS idUnidade, 
    unidade.NOME AS nomeUnidade, 
    produto.COMPRADOS AS comprados, 
    produto.VENDIDOS AS vendidos, 
    produto.ESTOQUE AS estoque
FROM produto
INNER JOIN marca ON marca.IDMARCA = produto.IDMARCA
INNER JOIN unidade ON unidade.IDUNIDADE = produto.IDUNIDADE
ORDER BY nomeProduto, nomeMarca, nomeUnidade;


