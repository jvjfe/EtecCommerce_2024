<?php

class Classeunidade
{
    /* Atributos */
    private $idUnidade; // Armazena o ID do unidade
    private $nome;     // Armazena o nome do unidade
    private $produtos;  // Armazena as produtos associadas ao unidade

    /* Getters */
    // Método que retorna o ID do unidade
    public function getidUnidade()
    {
        return $this->idUnidade;
    }

    // Método que retorna o nome do unidade
    public function getNome()
    {
        return $this->nome;
    }


    // Método que retorna as produtos associadas ao unidade
    public function getprodutos()
    {
        return $this->produtos;
    }

    /* Setters */
    // Método que define o valor do ID do unidade
    public function setidUnidade($idUnidade)
    {
        $this->idUnidade = $idUnidade;
    }

    // Método que define o valor do nome do unidade
    public function setNome($nome)
    {
        $this->nome = $nome;
    }

     // Método que define as produtos associadas ao unidade
    public function setprodutos($produtos)
    {
        $this->produtos = $produtos;
    }

    /* Método Construtor */
    // Método construtor que pode ser utilizado para inicializar o objeto (neste caso, está vazio)
    public function __construct() {}

    /* 
    Implementar os métodos do CRUD
    C - CREATE - Insert - inserirUnidade
    R - READ - Select 
    U - UPDATE - alterarUnidade
    D - DELETE - excluirUnidade
    */

    /* Método inserirUnidade */
    public function inserirUnidade($nome)
    {
        // Requer o arquivo de conexão com o banco de dados
        require("conexaobd.php");

        // Comando SQL para chamar a função armazenada "inserirUnidade" no banco de dados
        $comando = "SELECT inserirUnidade(:nome) AS Resultado;";

        // Prepara a consulta SQL
        $stmt  = $pdo->prepare($comando);

        // Vincula os parâmetros "" e "nome" com os valores recebidos como argumento
        $stmt->bindParam(":nome", $nome);

        // Executa a consulta
        $stmt->execute();

        // Inicializa a variável $resultado como null
        $resultado = null;

        // Itera sobre o resultado da consulta, obtendo o valor retornado pela função armazenada
        foreach ($stmt as $linha) {
            $resultado =  $linha["Resultado"];
        }

        // Retorna o resultado da função armazenada
        return $resultado;
    }

    /* Método alterarUnidade */
    public function alterarUnidade($idUnidade, $nome)
    {
        // Requer o arquivo de conexão com o banco de dados
        require("conexaobd.php");

        // Comando SQL para chamar a função armazenada "alterarUnidade" no banco de dados
        $comando = "SELECT alterarUnidade(:idUnidade,:nome) AS Resultado;";

        // Prepara a consulta SQL
        $stmt = $pdo->prepare($comando);

        // Vincula os parâmetros "idUnidade", "" e "nome" com os valores recebidos como argumento
        $stmt->bindParam(":idUnidade", $idUnidade);
        $stmt->bindParam(":nome", $nome);

        // Executa a consulta
        $stmt->execute();

        // Inicializa a variável $resultado como null
        $resultado = null;

        // Itera sobre o resultado da consulta, obtendo o valor retornado pela função armazenada
        foreach ($stmt as $linha) {
            $resultado =  $linha["Resultado"];
        }

        // Retorna o resultado da função armazenada
        return $resultado;
    }

    /* Método excluirUnidade */
    public function excluirUnidade($idUnidade)
    {
        // Requer o arquivo de conexão com o banco de dados
        require("conexaobd.php");

        // Comando SQL para chamar a função armazenada "excluirUnidade" no banco de dados
        $comando = "SELECT excluirUnidade(:idUnidade) AS Resultado;";

        // Prepara a consulta SQL
        $stmt = $pdo->prepare($comando);

        // Vincula o parâmetro "idUnidade" com o valor recebido como argumento
        $stmt->bindParam(":idUnidade", $idUnidade);

        // Executa a consulta
        $stmt->execute();

        // Inicializa a variável $resultado como null
        $resultado = null;

        // Itera sobre o resultado da consulta, obtendo o valor retornado pela função armazenada
        foreach ($stmt as $linha) {
            $resultado =  $linha["Resultado"];
        }

        // Retorna o resultado da função armazenada
        return $resultado;
    }

    /* Método consultarUnidade */
    public function consultarUnidade($idUnidade)
    {
        // Requer o arquivo de conexão com o banco de dados
        require("conexaobd.php");
        // Variável $consulta o select a ser executado
        $consulta="SELECT * FROM viewUnidades WHERE idUnidade=:idUnidade";
        // Preparar para executar a consulta
        $stmt = $pdo->prepare($consulta);
        // Definir o parâmetro
        $stmt->bindParam(":idUnidade",$idUnidade);
        // Executar o comando
        $stmt->execute();
        foreach($stmt as $linha){
            $this->idUnidade = $linha["IDUNIDADE"];
            $this->nome = $linha["NOME"];
			$this->produtos = $linha["PRODUTOS"];
        }
    }

    /* Método listarUnidades */
    public function listarUnidades()
    {
        // Requer o arquivo de conexão com o banco de dados
        require("conexaobd.php");
        // Variável $consulta o select a ser executado
        $consulta="SELECT * FROM viewUnidades";
        // Preparar para executar a consulta
        $stmt = $pdo->prepare($consulta);
        // Executar o comando
        $stmt->execute();
        // Retornar o resultado da consulta
        return $stmt;
    }
}
