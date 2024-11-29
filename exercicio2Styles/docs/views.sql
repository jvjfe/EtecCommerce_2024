-- COMANDO PRA LIGAR O BANCO DE DADOS: mysql -u root -p 
DROP VIEW IF EXISTS viewEstados;
CREATE VIEW viewEstados AS
SELECT IDESTADO,SIGLA,NOME,CIDADE FROM estado ORDER BY NOME;

DROP VIEW IF EXISTS viewMarcas;
CREATE VIEW viewMarcas AS
SELECT IDMARCA,NOME,PRODUTOS FROM marca ORDER BY NOME;

DROP VIEW IF EXISTS viewUnidades;
CREATE VIEW viewUnidades AS
SELECT IDUNIDADE,NOME,PRODUTOS FROM unidade ORDER BY NOME;

DROP VIEW IF EXISTS viewCidades;
CREATE VIEW viewCidades AS
SELECT 
cidade.IDCIDADE AS idCidade,
cidade.NOME AS nomeCidade,
cidade.IDESTADO AS idEstado,
estado.SIGLA AS siglaEstado,
estado.NOME AS nomeEstado,
cidade.CLIENTES AS clientesCidade
FROM cidade
INNER JOIN estado ON estado.IDESTADO=cidade.IDESTADO
ORDER BY nomeCidade;

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
unidade.NOME AS nomeUnidade
FROM produto
INNER JOIN marca ON marca.IDMARCA=produto.IDMARCA
INNER JOIN unidade ON unidade.IDUNIDADE=produto.IDUNIDADE
ORDER BY nomeProduto,nomeMarca,nomeUnidade;