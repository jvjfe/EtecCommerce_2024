<?php
// Capturar os valores enviados pelo método GET
$idCidade = htmlspecialchars($_POST["campoIdCidade"]);
$campoNome = htmlspecialchars($_POST["campoNome"]);
$idEstado = htmlspecialchars($_POST["campoIdEstado"]);
require("ClasseCidade.php");
// Instanciar o objetoCidade
$objetoEstado = new ClasseCidade();
if ($idEstado == 0) {
    $resultado = $objetoEstado->inserirCidade($nome, $idEstado);
} else {
    $resultado = $objetoEstado->alterarCidade($idCidade, $nome, $idEstado);
}
echo "<script>
    alert('$resultado');
    window.location.href='cidades.php'; 
    </script>";
?>