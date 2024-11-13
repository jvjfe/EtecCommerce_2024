<?php
// Capturar os valores enviados pelo método GET
$idMarca = htmlspecialchars($_GET["idMarca"]);
// Importar o conteúdo do arquivo ClasseMarca.php
require("ClasseMarca.php");
// Instanciar o objetoMarca
$objetoMarca = new ClasseMarca();
// Executar excluirMarca
$resultado = $objetoMarca->excluirMarca($idMarca);
echo "<script>
    alert('$resultado');
    window.location.href='marcas.php'; 
    </script>";