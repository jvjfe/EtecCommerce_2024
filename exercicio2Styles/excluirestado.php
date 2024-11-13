<?php
// Capturar os valores enviados pelo método GET
$idEstado = htmlspecialchars($_GET["idEstado"]);
// Importar o conteúdo do arquivo ClasseEstado.php
require("ClasseEstado.php");
// Instanciar o objetoEstado
$objetoEstado = new ClasseEstado();
// Executar excluirEstado
$resultado = $objetoEstado->excluirEstado($idEstado);
echo "<script>
    alert('$resultado');
    window.location.href='estados.php'; 
    </script>";