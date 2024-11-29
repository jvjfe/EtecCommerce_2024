TYPE=VIEW
query=select `eteccommerce`.`cidade`.`IDCIDADE` AS `idCidade`,`eteccommerce`.`cidade`.`NOME` AS `nomeCidade`,`eteccommerce`.`cidade`.`IDESTADO` AS `idEstado`,`eteccommerce`.`estado`.`SIGLA` AS `siglaEstado`,`eteccommerce`.`estado`.`NOME` AS `nomeEstado`,`eteccommerce`.`cidade`.`CLIENTES` AS `clientesCidade` from (`eteccommerce`.`cidade` join `eteccommerce`.`estado` on((`eteccommerce`.`estado`.`IDESTADO` = `eteccommerce`.`cidade`.`IDESTADO`))) order by `eteccommerce`.`cidade`.`NOME`
md5=f34635e07117019b023b8d4cf97dccdb
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=2024-11-26 00:12:15
create-version=2
source=SELECT \ncidade.IDCIDADE AS idCidade,\ncidade.NOME AS nomeCidade,\ncidade.IDESTADO AS idEstado,\nestado.SIGLA AS siglaEstado,\nestado.NOME AS nomeEstado,\ncidade.CLIENTES AS clientesCidade\nFROM cidade\nINNER JOIN estado ON estado.IDESTADO=cidade.IDESTADO\nORDER BY nomeCidade
client_cs_name=cp850
connection_cl_name=cp850_general_ci
view_body_utf8=select `eteccommerce`.`cidade`.`IDCIDADE` AS `idCidade`,`eteccommerce`.`cidade`.`NOME` AS `nomeCidade`,`eteccommerce`.`cidade`.`IDESTADO` AS `idEstado`,`eteccommerce`.`estado`.`SIGLA` AS `siglaEstado`,`eteccommerce`.`estado`.`NOME` AS `nomeEstado`,`eteccommerce`.`cidade`.`CLIENTES` AS `clientesCidade` from (`eteccommerce`.`cidade` join `eteccommerce`.`estado` on((`eteccommerce`.`estado`.`IDESTADO` = `eteccommerce`.`cidade`.`IDESTADO`))) order by `eteccommerce`.`cidade`.`NOME`
mariadb-version=100125
