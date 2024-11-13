<?php
    // Capturar o valor do parâmetro idUnidade
    $idUnidade = htmlspecialchars($_GET["idUnidade"]);
    // Inicialiar as variáveis
    $sigla = "";
    $nome = "";
    // Se necessário, consultarUnidade para obter os valores das variáveis
    if($idUnidade!=0){
        // Requer ClasseUnidade.php
        require("ClasseUnidade.php");
        // Instanciar o $objetoUnidade a partir da ClasseUnidade
        $objetoUnidade =  new ClasseUnidade();
        // Executar o método consultarUnidade
        $objetoUnidade->consultarUnidade($idUnidade);
        // As variáveis recebem os valores dos atributos do $objetoUnidade
        $nome = $objetoUnidade->getNome();
    }
?>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Etec Commerce</title>
    <!-- Folha de estilos -->
    <link rel="stylesheet" href="./css/style.css">
    <!-- Ícone da aba do navegador -->
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <!-- link fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
    <?php require("header.php"); ?>
    <main>
        <section class="formulario">
            <h1>Unidade</h1>
            <form action="salvarunidade.php" class="formulario-form" method="POST">

                <input type="hidden"
                    id="campoIdUnidade"
                    name="campoIdUnidade"
                    value="<?php echo $idUnidade; ?>">

                <label for="campoNome">
                    Nome do Unidade
                </label>

                <input type="text"
                    id="campoNome"
                    name="campoNome"
                    maxlength="20"
                    placeholder="Nome do Unidade"
                    oninput="validarNome(event)"
                    value="<?php echo $nome;?>"
                    required>

                <input type="submit"
                    value="Salvar"
                    id="botaoSalvar"
                    name="botaoSalvar">

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

        const regex = /^[A-Za-zÀ-ÿ0-9\s]{4,}$/;

        // Converter o valor para maiúsculas
        inputNome.value = inputNome.value.toUpperCase();

        // Validar se tem no mínimo 4 caracteres e apenas letras e acentuação
        if (!regex.test(inputNome.value)) {
            inputNome.setCustomValidity("O nome deve conter no mínimo 4 caracteres e apenas letras de A a Z com acentuação.");
        } else {
            inputNome.setCustomValidity(""); // Limpar mensagem de erro se estiver válido
        }
    }
</script>