TYPE=VIEW
query=select `eteccommerce`.`produto`.`IDPRODUTO` AS `idProduto`,`eteccommerce`.`produto`.`NOME` AS `nomeProduto`,`eteccommerce`.`produto`.`PRECOCOMPRA` AS `precoCompra`,`eteccommerce`.`produto`.`MARGEMLUCRO` AS `margemLucro`,`eteccommerce`.`produto`.`PRECOVENDA` AS `precoVenda`,`eteccommerce`.`produto`.`IDMARCA` AS `idMarca`,`eteccommerce`.`marca`.`NOME` AS `nomeMarca`,`eteccommerce`.`produto`.`IDUNIDADE` AS `idUnidade`,`eteccommerce`.`unidade`.`NOME` AS `nomeUnidade` from ((`eteccommerce`.`produto` join `eteccommerce`.`marca` on((`eteccommerce`.`marca`.`IDMARCA` = `eteccommerce`.`produto`.`IDMARCA`))) join `eteccommerce`.`unidade` on((`eteccommerce`.`unidade`.`IDUNIDADE` = `eteccommerce`.`produto`.`IDUNIDADE`))) order by `eteccommerce`.`produto`.`NOME`,`eteccommerce`.`marca`.`NOME`,`eteccommerce`.`unidade`.`NOME`
md5=a9e48d40c870e613fc2b112cc25ba74a
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=2024-11-26 00:12:17
create-version=2
source=SELECT\nproduto.IDPRODUTO AS idProduto,\nproduto.NOME AS nomeProduto,\nproduto.PRECOCOMPRA AS precoCompra,\nproduto.MARGEMLUCRO AS margemLucro,\nproduto.PRECOVENDA AS precoVenda,\nproduto.IDMARCA AS idMarca,\nmarca.NOME AS nomeMarca,\nproduto.IDUNIDADE AS idUnidade,\nunidade.NOME AS nomeUnidade\nFROM produto\nINNER JOIN marca ON marca.IDMARCA=produto.IDMARCA\nINNER JOIN unidade ON unidade.IDUNIDADE=produto.IDUNIDADE\nORDER BY nomeProduto,nomeMarca,nomeUnidade
client_cs_name=cp850
connection_cl_name=cp850_general_ci
view_body_utf8=select `eteccommerce`.`produto`.`IDPRODUTO` AS `idProduto`,`eteccommerce`.`produto`.`NOME` AS `nomeProduto`,`eteccommerce`.`produto`.`PRECOCOMPRA` AS `precoCompra`,`eteccommerce`.`produto`.`MARGEMLUCRO` AS `margemLucro`,`eteccommerce`.`produto`.`PRECOVENDA` AS `precoVenda`,`eteccommerce`.`produto`.`IDMARCA` AS `idMarca`,`eteccommerce`.`marca`.`NOME` AS `nomeMarca`,`eteccommerce`.`produto`.`IDUNIDADE` AS `idUnidade`,`eteccommerce`.`unidade`.`NOME` AS `nomeUnidade` from ((`eteccommerce`.`produto` join `eteccommerce`.`marca` on((`eteccommerce`.`marca`.`IDMARCA` = `eteccommerce`.`produto`.`IDMARCA`))) join `eteccommerce`.`unidade` on((`eteccommerce`.`unidade`.`IDUNIDADE` = `eteccommerce`.`produto`.`IDUNIDADE`))) order by `eteccommerce`.`produto`.`NOME`,`eteccommerce`.`marca`.`NOME`,`eteccommerce`.`unidade`.`NOME`
mariadb-version=100125
