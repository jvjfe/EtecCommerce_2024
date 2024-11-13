<?php
// Capturar os valores enviados pelo método POST
$idMarca = htmlspecialchars($_POST["campoIdMarca"]);
$nome = htmlspecialchars($_POST["campoNome"]);
// Importar o conteúdo do arquivo ClasseMarca.php
require("ClasseMarca.php");
// Instanciar o objetoMarca
$objetoMarca = new ClasseMarca();
// Executar inserirMarca ou  alterarMarca
if ($idMarca == 0) {
    $resultado = $objetoMarca->inserirMarca($nome);
} else {
    $resultado = $objetoMarca->alterarMarca($idMarca, $nome);
}
echo "<script>
    alert('$resultado');
    window.location.href='marcas.php'; 
    </script>";
