<?php
// Capturar os valores enviados pelo método GET
$idEstado = htmlspecialchars($_GET["campoIdEstado"]);
$sigla = htmlspecialchars($_GET["campoSigla"]);
$nome = htmlspecialchars($_GET["campoNome"]);
// Importar o conteúdo do arquivo ClasseEstado.php
require("ClasseEstado.php");
// Instanciar o objetoEstado
$objetoEstado = new ClasseEstado();
// Executar inserirEstado ou  alterarEstado
if ($idEstado == "") {
    $resultado = $objetoEstado->inserirEstado($sigla, $nome);
} else {
    $resultado = $objetoEstado->alterarEstado($idEstado, $sigla, $nome);
}
echo "<script>
    alert('$resultado');
    window.location.href='estados.php'; 
    </script>";
