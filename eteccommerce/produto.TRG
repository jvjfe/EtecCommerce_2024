TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER antesInserirProduto BEFORE INSERT ON produto FOR EACH ROW\nBEGIN\nSET NEW.NOME = UPPER(NEW.NOME);\nSET NEW.PRECOVENDA = ROUND(NEW.PRECOCOMPRA*(1+NEW.MARGEMLUCRO/100),2);\nSET NEW.DTINSERT = CURRENT_DATE();\nSET NEW.HRINSERT = CURRENT_TIME();\nEND'
sql_modes=1342177280
definers='root@localhost'
client_cs_names='cp850'
connection_cl_names='cp850_general_ci'
db_cl_names='latin1_swedish_ci'
