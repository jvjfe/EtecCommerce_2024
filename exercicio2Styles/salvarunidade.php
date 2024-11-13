<?php
// Capturar os valores enviados pelo método POST
$idUnidade = htmlspecialchars($_POST["campoIdUnidade"]);
$nome = htmlspecialchars($_POST["campoNome"]);
// Importar o conteúdo do arquivo ClasseUnidade.php
require("ClasseUnidade.php");
// Instanciar o objetoUnidade
$objetoUnidade = new ClasseUnidade();
// Executar inserirUnidade ou  alterarUnidade
if ($idUnidade == 0) {
    $resultado = $objetoUnidade->inserirUnidade($nome);
} else {
    $resultado = $objetoUnidade->alterarUnidade($idUnidade, $nome);
}
echo "<script>
    alert('$resultado');
    window.location.href='unidades.php'; 
    </script>";
