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
                <h1>Estados</h1>
                <a href="estado.php?idEstado=0">
                    <button class="botao">
                        NOVO
                    </button>
                </a>

                <table border="1">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>SIGLA</th>
                            <th>NOME</th>
                            <th>CIDADES</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        // Requer o arquivo
                        require("ClasseEstado.php");
                        // Instanciar o $objetoEstado a partir da ClasseEstado
                        $objetoEstado = new ClasseEstado();
                        // Executar o método listarEstados() armazenando na variável $listagem
                        $listagem = $objetoEstado->listarEstados();
                        foreach ($listagem as $linha) {
                            $idEstado = $linha["IDESTADO"];
                            $nome = $linha["NOME"];
                            $sigla = $linha["SIGLA"];
                            $cidades = $linha["CIDADE"];
                        ?>
                            <tr>
                                <td><?php echo $idEstado; ?></td>
                                <td><?php echo $sigla; ?></td>
                                <td><?php echo $nome; ?></td>
                                <td><?php echo $cidades; ?></td>
                                <td>
                                    <a href="estado.php?idEstado=<?php echo $idEstado; ?>"><button>ALTERAR</button></a>
                                    <a href="excluirestado.php?idEstado=<?php echo $idEstado; ?>"><button>EXCLUIR</button></a>
                                    <a href="bkpestado.php?idEstado=<?php echo $idEstado; ?>"><button>LOG</button></a>
                                </td>
                            </tr>
                        <?php
                        }
                        ?>
                    </tbody>
                </table>

                <a href="estado.php?idEstado=0">
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