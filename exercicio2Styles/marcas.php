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
        <div class="alinhamento">
            <section class="listagem">
                <h1>Marcas</h1>
                <a href="marca.php?idMarca=0">
                    <button class="botao">
                        NOVO
                    </button>
                </a>

                <table border="1">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>NOME</th>
                            <th>PRODUTOS</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        // Requer o arquivo
                        require("ClasseMarca.php");
                        // Instanciar o $objetoMarca a partir da ClasseMarca
                        $objetoMarca = new ClasseMarca();
                        // Executar o método listarMarcas() armazenando na variável $listagem
                        $listagem = $objetoMarca->listarMarcas();
                        foreach ($listagem as $linha) {
                            $idMarca = $linha["IDMARCA"];
                            $nome = $linha["NOME"];
                            $produtos = $linha["PRODUTOS"];
                        ?>
                            <tr>
                                <td><?php echo $idMarca; ?></td>
                                <td><?php echo $nome; ?></td>
                                <td><?php echo $produtos; ?></td>
                                <td>
                                    <a href="marca.php?idMarca=<?php echo $idMarca; ?>"><button>ALTERAR</button></a>
                                    <a href="excluirmarca.php?idMarca=<?php echo $idMarca; ?>"><button>EXCLUIR</button></a>
                                    <a href="bkpmarca.php?idMarca=<?php echo $idMarca; ?>"><button>LOG</button></a>
                                </td>
                            </tr>
                        <?php
                        }
                        ?>
                    </tbody>
                </table>

                <a href="marca.php?idMarca=0">
                    <button class="botao">
                        NOVO
                    </button>
                </a>

            </section>
        </div>
    </main>
    <?php require("footer.php"); ?>
</body>

</html>