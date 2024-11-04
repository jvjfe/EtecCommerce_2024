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
        <div style="text-align: center; margin: 20px;">
            <h1 style="color: #000; font-size: 24px; margin-bottom: 20px;">Estado</h1>
            <a href="estado.php?idEstado=0" style="display: none;">
                <button style="width: 100px; padding: 10px; background-color: #4F4F4F; color: #fff; border: none; border-radius: 5px; cursor: pointer; transition: background-color 0.3s;">
                    NOVO
                </button>
            </a>
        </div>

        <table style="border-collapse: collapse; width: 80%; margin: 20px auto; background-color: #fff; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);">
            <thead>
                <tr>
                    <th style="border: 1px solid #000; padding: 12px; background-color: #000; color: #fff;">#</th>
                    <th style="border: 1px solid #000; padding: 12px; background-color: #000; color: #fff;">SIGLA</th>
                    <th style="border: 1px solid #000; padding: 12px; background-color: #000; color: #fff;">NOME</th>
                    <th style="border: 1px solid #000; padding: 12px; background-color: #000; color: #fff;">CIDADES</th>
                    <th style="border: 1px solid #000; padding: 12px;">AÇÕES</th>
                </tr>
            </thead>
            <tbody>
                <?php
                require("ClasseEstado.php");
                $objetoEstado = new ClasseEstado();
                $listagem = $objetoEstado->listarEstados();
                foreach ($listagem as $linha) {
                    $idEstado = $linha["IDESTADO"];
                    $nome = $linha["NOME"];
                    $sigla = $linha["SIGLA"];
                    $cidades = $linha["CIDADES"];
                ?>
                    <tr style="background-color: <?= $linha['IDESTADO'] % 2 == 0 ? '#f2f2f2' : '#fff'; ?>;">
                        <td style="border: 1px solid #000; padding: 12px;"><?= $idEstado; ?></td>
                        <td style="border: 1px solid #000; padding: 12px;"><?= $sigla; ?></td>
                        <td style="border: 1px solid #000; padding: 12px;"><?= $nome; ?></td>
                        <td style="border: 1px solid #000; padding: 12px;"><?= $cidades; ?></td>
                        <td style="border: 1px solid #000; padding: 12px; text-align: center;">
                            <div style="text-align: center;">
                                <a href="estado.php?idEstado=<?= $idEstado; ?>">
                                    <button style="margin: 2px; background-color: #4F4F4F; color: #fff; border: none; border-radius: 5px; cursor: pointer; padding: 5px 10px;">ALTERAR</button>
                                </a>
                                <a href="excluirestado.php?idEstado=<?= $idEstado; ?>">
                                    <button style="margin: 2px; background-color: #4F4F4F; color: #fff; border: none; border-radius: 5px; cursor: pointer; padding: 5px 10px;">EXCLUIR</button>
                                </a>
                                <a href="bkpestado.php?idEstado=<?= $idEstado; ?>">
                                    <button style="margin: 2px; background-color: #4F4F4F; color: #fff; border: none; border-radius: 5px; cursor: pointer; padding: 5px 10px;">LOG</button>
                                </a>
                            </div>
                        </td>
                    </tr>
                <?php
                }
                ?>
            </tbody>
        </table>

        <div style="text-align: center; margin-top: 20px;">
            <a href="estado.php?idEstado=0">
                <button style="width: 100px; padding: 10px; background-color: #4F4F4F; color: #fff; border: none; border-radius: 5px; cursor: pointer; transition: background-color 0.3s;">
                    NOVO
                </button>
            </a>
        </div>



        </section>
    </main>
    <?php require("footer.php"); ?>
</body>

</html>