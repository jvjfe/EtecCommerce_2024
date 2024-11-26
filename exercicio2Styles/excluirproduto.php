<?php
/* Capturar o valor enviado pelo método GET */
$idProduto = htmlspecialchars($_GET["idProduto"]);
/* Importar o arquivo ClasseProduto.php */
require("ClasseProduto.php");
/* Instanciar o $objetoProduto a partir da ClasseProduto */
$objetoProduto =  new ClasseProduto();
/* Executar o método excluirProduto() */
$resultado = $objetoProduto->excluirProduto($idProduto);
echo "
<script>
    alert('$resultado');
    window.location.href='produtos.php';
</script>";
?>