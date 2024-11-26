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
        <section class="listagem">
            <h1>Produtos</h1>
            <a href="produto.php?idProduto=0">
                <button>
                    NOVO
                </button>
            </a>

            <table border="1">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>NOME</th>
                        <th>PREÇO<br>DE<br>COMPRA</th>
                        <th>MARGEM<br>DE<br>LUCRO</th>
                        <th>PREÇO<br>DE<br>VENDA</th>
                        <th>MARCA</th>
                        <th>UNIDADE</th>
                        <th>COMPRADOS</th>
                        <th>VENDIDOS</th>
                        <th>ESTOQUE</th>

                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    // Requer o arquivo
                    require("ClasseProduto.php");
                    // Instanciar o $objetoProduto a partir da ClasseProduto
                    $objetoProduto = new ClasseProduto();
                    // Executar o método listarProdutos() armazenando na variável $listagem
                    $listagem = $objetoProduto->listarProdutos();
                    foreach ($listagem as $linha) {
                        $idProduto = $linha["idProduto"];
                        $nome = $linha["nomeProduto"];
                        $precoCompra = $linha["precoCompra"];
                        $margemLucro = $linha["margemLucro"] . "%";
                        $precoVenda = $linha["precoVenda"];
                        $nomeMarca = $linha["nomeMarca"];
                        $nomeUnidade = $linha["nomeUnidade"];
                        $comprados = isset($linha["comprados"]) && !empty($linha["comprados"]) ? $linha["comprados"] : 0;
                        $vendidos = isset($linha["vendidos"]) && !empty($linha["vendidos"]) ? $linha["vendidos"] : 0;
                        $estoque = isset($linha["estoque"]) && !empty($linha["estoque"]) ? $linha["estoque"] : 0;
                    ?>
                        <tr>
                            <td><?php echo $idProduto; ?></td>
                            <td><?php echo $nome; ?></td>
                            <td><?php echo $precoCompra; ?></td>
                            <td><?php echo $margemLucro; ?></td>
                            <td><?php echo $precoVenda; ?></td>
                            <td><?php echo $nomeMarca; ?></td>
                            <td><?php echo $nomeUnidade; ?></td>
                            <td><?php echo $comprados; ?></td>
                            <td><?php echo $vendidos; ?></td>
                            <td><?php echo $estoque; ?></td>
                            <td>
                                <a href="produto.php?idProduto=<?php echo $idProduto; ?>"><button>ALTERAR</button></a>
                                <a href="excluirproduto.php?idProduto=<?php echo $idProduto; ?>"><button>EXCLUIR</button></a>
                                <a href="bkpproduto.php?idProduto=<?php echo $idProduto; ?>"><button>LOG</button></a>
                            </td>
                        </tr>
                    <?php
                    }
                    ?>
                </tbody>
            </table>

            <a href="produto.php?idProduto=0">
                <button>
                    NOVO
                </button>
            </a>

        </section>
    </main>
    <?php require("footer.php"); ?>
</body>

</html>