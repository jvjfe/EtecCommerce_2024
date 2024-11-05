<?php
/* Capturar o valor enviado pelo método GET */
$idCidade = htmlspecialchars($_GET["idCidade"]);
/* Importar o arquivo ClasseCidade.php */
require("ClasseCidade.php");
/* Instanciar o $objetoCidade a partir da ClasseCidade */
$objetoCidade =  new ClasseCidade();
/* Executar o método excluirCidade() */
$resultado = $objetoCidade->excluirCidade($idCidade);
echo "
<script>
    alert('$resultado');
    window.location.href='cidades.php';
</script>";
?>