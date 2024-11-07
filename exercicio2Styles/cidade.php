<?php
/* Capturar o valor enviado pelo método GET */
$idCidade = htmlspecialchars($_GET["idCidade"]);
$nome = "";
$idEstado = 0;
/* Se $idCidade != 0, consultarCidade */
if ($idCidade != 0) {
    /* Importar o arquivo ClasseCidade.php */
    require("ClasseCidade.php");
    /* Instanciar o $objetoCidade */
    $objetoCidade = new ClasseCidade();
    /* Executar o método consultarCidade */
    $objetoCidade->consultarCidade($idCidade);
    $nome = $objetoCidade->getNome();
    $idEstado = $objetoCidade->getIdEstado();
}
?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Etec Commerce</title>
    <!-- Folha de estilos -->
    <link rel="stylesheet" href="./css/stylesestado.css">
    <!-- Ícone da aba do navegador -->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <!-- link fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
    <?php require("header.php"); ?>
    <main>
        <section class="formulario">
            <h1>Cidade</h1>
            <form action="salvarcidade.php" method="POST" class="formulario-form">

                <input type="hidden"
                    id="campoIdCidade"
                    name="campoIdCidade"
                    value="<?php echo $idCidade; ?>">

                <label for="campoNome">Nome da Cidade *</label>
                <input type="text"
                    id="campoNome"
                    name="campoNome"
                    maxlength="50"
                    placeholder="Nome da Cidade"
                    oninput="validarNome(event)"
                    value="<?php echo $nome; ?>"
                    required>

                <label for="campoIdEstado">UF</label>
                <select id="campoIdEstado" name="campoIdEstado">
                    <?php
                    /* Importar o arquivo ClasseEstado.php */
                    require("ClasseEstado.php");
                    /* Instanciar o $objetoEstado */
                    $objetoEstado = new ClasseEstado();
                    /* Executar o método listarEstados() */
                    $listagem = $objetoEstado->listarEstados();
                    foreach ($listagem as $registro) {
                        $idEstadoOption = $registro["IDESTADO"];
                        $nomeOption = $registro["NOME"];
                        $selecionado = ($idEstado == $idEstadoOption) ? "SELECTED" : "";
                    ?>
                        <option value="<?php echo $idEstadoOption; ?>" <?php echo $selecionado; ?>>
                            <?php echo $nomeOption; ?>
                        </option>
                    <?php
                    }
                    ?>
                </select>
                <br>
                <input type="submit"
                    value="Salvar"
                    id="botaoSalvar"
                    name="botaoSalvar"
                    class="submit-button">

            </form>
        </section>
    </main>

    <?php require("footer.php"); ?>
</body>

</html>

<script>
    // Função para validar o campoNome
    function validarNome(event) {

        const inputNome = event.target;
        // Expressão regular que permite letras (maiúsculas e minúsculas), incluindo acentuação, e espaço

        const regex = /^[A-Za-zÀ-ÿ\s]{3,}$/;

        // Converter o valor para maiúsculas
        inputNome.value = inputNome.value.toUpperCase();

        // Validar se tem no mínimo 3 caracteres e apenas letras e acentuação
        if (!regex.test(inputNome.value)) {
            inputNome.setCustomValidity("O nome deve conter no mínimo 3 caracteres e apenas letras de A a Z com acentuação.");
        } else {
            inputNome.setCustomValidity(""); // Limpar mensagem de erro se estiver válido
        }
    }
</script>