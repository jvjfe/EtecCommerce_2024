<?php
// Capturar os valores enviados pelo método POST
$idCidade = htmlspecialchars($_POST["campoIdCidade"]);
$nome = htmlspecialchars($_POST["campoNome"]);
$idEstado = htmlspecialchars($_POST["campoIdEstado"]);
// Importar o conteúdo do arquivo ClasseCidade.php
require("ClasseCidade.php");
// Instanciar o objetoCidade
$objetoCidade = new ClasseCidade();
// Executar inserirCidade ou  alterarCidade
if ($idCidade == 0) {
    $resultado = $objetoCidade->inserirCidade($nome, $idEstado);
} else {
    $resultado = $objetoCidade->alterarCidade($idCidade, $nome, $idEstado);
}
echo "<script>
    alert('$resultado');
    window.location.href='Cidades.php'; 
    </script>";
