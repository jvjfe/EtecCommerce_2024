<?php
/* Variáveis com os parâmetros para conexão com MySQL */

$hostName = "localhost";
$userName = "root";
$dbName = "eteccommerce";
$password = "";

try {
    $pdo = new PDO("mysql:host=$hostName;dbname=$dbName;charset=utf8",$userName,$password);
    $pdo->exec("SET NAMES utf8");
    $pdo->exec("SET CHARACTER SET utf8");
    /* Verificar se a conexão foi realizada com sucesso */
    $connection_status = $pdo->getAttribute(PDO::ATTR_CONNECTION_STATUS);
    // echo "Sucesso na conexão MySQL";
} catch (PDOException $erro){
    echo "Erro na conexão MySQL: " . $erro->getMessage();
}
?>

