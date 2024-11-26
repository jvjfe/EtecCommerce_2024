<?php
// Capturar os valores enviados pelo método POST
$idProduto = htmlspecialchars($_POST["campoIdProduto"]);
$nome = htmlspecialchars($_POST["campoNome"]);
$precoCompra = htmlspecialchars($_POST["campoPrecoCompra"]);
$MargemLucro = htmlspecialchars($_POST["campoMargemLucro"]);
$idMarca = htmlspecialchars($_POST["campoIdMarca"]);
$idUnidade = htmlspecialchars($_POST["campoIdUnidade"]);

// Importar o conteúdo do arquivo ClasseProduto.php
require("ClasseProduto.php");
// Instanciar o objetoProduto
$objetoProduto = new ClasseProduto();
// Executar inserirProduto ou  alterarProduto
if ($idProduto == 0) {
    $resultado = $objetoProduto->inserirProduto($nome,$precoCompra,$MargemLucro,$idMarca,$idUnidade);
} else {
    $resultado = $objetoProduto->alterarProduto($idProduto,$nome,$precoCompra,$MargemLucro,$idMarca,$idUnidade);
}
echo "<script>
    alert('$resultado');
    window.location.href='Produtos.php'; 
    </script>";
