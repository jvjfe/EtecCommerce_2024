<?php
// Capturar os valores enviados pelo método GET
$idEstado = htmlspecialchars($_POST["campoIdEstado"]);
$sigla = htmlspecialchars($_POST["campoSigla"]);
$nome = htmlspecialchars($_POST["campoNome"]);
// Importar o conteúdo do arquivo ClasseEstado.php
require("ClasseEstado.php");
// Instanciar o objetoEstado
$objetoEstado = new ClasseEstado();
// Executar inserirEstado ou  alterarEstado
if ($idEstado == 0) {
    $resultado = $objetoEstado->inserirEstado($sigla, $nome);
} else {
    $resultado = $objetoEstado->alterarEstado($idEstado, $sigla, $nome);
}
echo "<script>
    alert('$resultado');
    window.location.href='estados.php'; 
    </script>";
?>