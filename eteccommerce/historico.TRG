TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER antesInserirHistorico BEFORE INSERT ON historico FOR EACH ROW\nBEGIN\nSET NEW.DTHISTORICO = CURRENT_DATE();  \nSET NEW.HRHISTORICO = CURRENT_TIME();  \nEND'
sql_modes=1342177280
definers='root@localhost'
client_cs_names='cp850'
connection_cl_names='cp850_general_ci'
db_cl_names='latin1_swedish_ci'
