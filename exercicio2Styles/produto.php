<?php
/* Capturar o valor enviado pelo método GET */
$idProduto = htmlspecialchars($_GET["idProduto"]);
$nome = "";
$precoCompra = 0.0;
$margemLucro = 0.0;
$idMarca = 0;
$idUnidade = 0;

if ($idProduto != 0) {
    require("ClasseProduto.php");
    $objetoProduto = new ClasseProduto();
    $objetoProduto->consultarProduto($idProduto);
    $nome = $objetoProduto->getNome();
    $precoCompra = $objetoProduto->getPrecoCompra();
    $margemLucro = $objetoProduto->getMargemLucro();
    $idMarca = $objetoProduto->getIdMarca();
    $idUnidade = $objetoProduto->getIdUnidade();
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
        <div class="alinhamento2">
            <section class="formulario">
                <h1>Produto</h1>
                <form action="salvarproduto.php" method="POST" class="formulario-form" style="padding: 20px 40px 5px;">

                    <input type="hidden"
                        id="campoIdProduto"
                        name="campoIdProduto"
                        value="<?php echo $idProduto; ?>">

                    <label for="campoNome" style="margin-top: 15px;">Nome do Produto *</label>
                    <input type="text"
                        id="campoNome"
                        name="campoNome"
                        maxlength="50"
                        placeholder="Nome da Produto"
                        oninput="validarNome(event)"
                        value="<?php echo $nome; ?>"
                        required>

                    <label for="campoPrecoCompra">Preço de Compra *</label>
                    <input type="number"
                        id="campoPrecoCompra"
                        name="campoPrecoCompra"
                        min="0"
                        step="0.01"
                        placeholder="Preço de Compra"
                        value="<?php echo $precoCompra; ?>"
                        required>

                    <label for="campoMargemLucro">Margem de Lucro *</label>
                    <input type="number"
                        id="campoMargemLucro"
                        name="campoMargemLucro"
                        min="0"
                        step="0.01"
                        placeholder="Margem de Lucro"
                        value="<?php echo $margemLucro; ?>"
                        required>

                    <label for="campoIdMarca">Marca</label>
                    <select id="campoIdMarca" name="campoIdMarca">
                        <?php
                        require("ClasseMarca.php");
                        $objetoMarca = new ClasseMarca();
                        $listagem = $objetoMarca->listarMarcas();
                        foreach ($listagem as $registro) {
                            $idMarcaOption = $registro["IDMARCA"];
                            $nomeOption = $registro["NOME"];
                            $selecionado = ($idMarca == $idMarcaOption) ? "SELECTED" : "";
                        ?>
                            <option value="<?php echo $idMarcaOption; ?>" <?php echo $selecionado; ?>>
                                <?php echo $nomeOption; ?>
                            </option>
                        <?php
                        }
                        ?>
                    </select>

                    <label for="campoIdUnidade">Unidade</label>
                    <select id="campoIdUnidade" name="campoIdUnidade">
                        <?php
                        require("ClasseUnidade.php");
                        $objetoUnidade = new ClasseUnidade();
                        $listagem = $objetoUnidade->listarUnidades();
                        foreach ($listagem as $registro) {
                            $idUnidadeOption = $registro["IDUNIDADE"];
                            $nomeOption = $registro["NOME"];
                            $selecionado = ($idUnidade == $idUnidadeOption) ? "SELECTED" : "";
                        ?>
                            <option value="<?php echo $idUnidadeOption; ?>" <?php echo $selecionado; ?>>
                                <?php echo $nomeOption; ?>
                            </option>
                        <?php
                        }
                        ?>
                    </select>

                    <input type="submit"
                        value="Salvar"
                        id="botaoSalvar"
                        name="botaoSalvar"
                        style="height: 150px;">

                </form>
            </section>
        </div>
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