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
            <h1>Estado</h1>
            <form action="salvarestado.php" class="formulario-form" method="GET">

                <input type="text"
                    id="campoIdEstado"
                    name="campoIdEstado">

                <label for="campoSigla">
                    Sigla
                </label>

                <input type="text"
                    id="campoSigla"
                    name="campoSigla"
                    maxlength="2"
                    placeholder="Sigla do Estado"
                    oninput="validarSigla(event)"
                    required>

                <label for="campoNome">
                    Nome do Estado
                </label>

                <input type="text"
                    id="campoNome"
                    name="campoNome"
                    maxlength="50"
                    placeholder="Nome do Estado"
                    oninput="validarNome(event)"
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
    // Função para validar o campoSigla
    function validarSigla(event){

        const inputSigla = event.target;
        // Armazena a referência ao elemento de entrada que 
		// gerou o evento (campo de texto da sigla) na variável 'inputSigla'.
    
        const regex = /^[A-Za-z]{2}$/;
        // Define uma expressão regular (regex) que só permite dois caracteres 
		// alfabéticos (de 'A' a 'Z', tanto maiúsculas quanto minúsculas).  

        // Converter para maiúsculas
        inputSigla.value = inputSigla.value.toUpperCase();
        // Converte o valor digitado no campo 'inputSigla' 
		//para letras maiúsculas e o atribui de volta ao campo. 
        
        // Validar se tem apenas duas letras
        if (!regex.test(inputSigla.value)) {
            // Verifica se o valor do campo não corresponde ao padrão da regex. 
            // Se não for exatamente duas letras alfabéticas, a validação falha.

            inputSigla.setCustomValidity("A sigla deve conter exatamente 2 letras de A a Z.");
            // Define uma mensagem personalizada de erro, que será exibida ao usuário.
        } else {
            inputSigla.setCustomValidity("");
            // Se o valor estiver correto, limpa qualquer mensagem de 
			//erro anterior, permitindo a submissão do formulário.
        }        
    }

    // Função para validar o campoNome
    function validarNome(event){

        const inputNome = event.target;
        // Expressão regular que permite letras (maiúsculas e minúsculas), incluindo acentuação, e espaço

        const regex = /^[A-Za-zÀ-ÿ\s]{4,}$/;

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