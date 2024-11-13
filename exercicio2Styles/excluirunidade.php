<?php
// Capturar os valores enviados pelo método GET
$idUnidade = htmlspecialchars($_GET["idUnidade"]);
// Importar o conteúdo do arquivo ClasseUnidade.php
require("ClasseUnidade.php");
// Instanciar o objetoUnidade
$objetoUnidade = new ClasseUnidade();
// Executar excluirUnidade
$resultado = $objetoUnidade->excluirUnidade($idUnidade);
echo "<script>
    alert('$resultado');
    window.location.href='unidades.php'; 
    </script>";