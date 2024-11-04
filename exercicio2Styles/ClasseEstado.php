<?php

class ClasseEstado
{
    /* Atributos */
    private $idEstado; // Armazena o ID do estado
    private $nome;     // Armazena o nome do estado
    private $sigla;    // Armazena a sigla do estado
    private $cidades;  // Armazena as cidades associadas ao estado

    /* Getters */
    // Método que retorna o ID do estado
    public function getIdEstado()
    {
        return $this->idEstado;
    }

    // Método que retorna o nome do estado
    public function getNome()
    {
        return $this->nome;
    }

    // Método que retorna a sigla do estado
    public function getSigla()
    {
        return $this->sigla;
    }

    // Método que retorna as cidades associadas ao estado
    public function getCidades()
    {
        return $this->cidades;
    }

    /* Setters */
    // Método que define o valor do ID do estado
    public function setIdEstado($idEstado)
    {
        $this->idEstado = $idEstado;
    }

    // Método que define o valor do nome do estado
    public function setNome($nome)
    {
        $this->nome = $nome;
    }

    // Método que define o valor da sigla do estado
    public function setSigla($sigla)
    {
        $this->sigla = $sigla;
    }

    // Método que define as cidades associadas ao estado
    public function setCidades($cidades)
    {
        $this->cidades = $cidades;
    }

    /* Método Construtor */
    // Método construtor que pode ser utilizado para inicializar o objeto (neste caso, está vazio)
    public function __construct() {}

    /* 
    Implementar os métodos do CRUD
    C - CREATE - Insert - inserirEstado
    R - READ - Select 
    U - UPDATE - alterarEstado
    D - DELETE - excluirEstado
    */

    /* Método inserirEstado */
    public function inserirEstado($sigla, $nome)
    {
        // Requer o arquivo de conexão com o banco de dados
        require("conexaobd.php");

        // Comando SQL para chamar a função armazenada "inserirEstado" no banco de dados
        $comando = "SELECT inserirEstado(:sigla,:nome) AS Resultado;";

        // Prepara a consulta SQL
        $stmt  = $pdo->prepare($comando);

        // Vincula os parâmetros "sigla" e "nome" com os valores recebidos como argumento
        $stmt->bindParam(":sigla", $sigla);
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

    /* Método alterarEstado */
    public function alterarEstado($idEstado, $sigla, $nome)
    {
        // Requer o arquivo de conexão com o banco de dados
        require("conexaobd.php");

        // Comando SQL para chamar a função armazenada "alterarEstado" no banco de dados
        $comando = "SELECT alterarEstado(:idEstado,:sigla,:nome) AS Resultado;";

        // Prepara a consulta SQL
        $stmt = $pdo->prepare($comando);

        // Vincula os parâmetros "idEstado", "sigla" e "nome" com os valores recebidos como argumento
        $stmt->bindParam(":idEstado", $idEstado);
        $stmt->bindParam(":sigla", $sigla);
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

    /* Método excluirEstado */
    public function excluirEstado($idEstado)
    {
        // Requer o arquivo de conexão com o banco de dados
        require("conexaobd.php");

        // Comando SQL para chamar a função armazenada "excluirEstado" no banco de dados
        $comando = "SELECT excluirEstado(:idEstado) AS Resultado;";

        // Prepara a consulta SQL
        $stmt = $pdo->prepare($comando);

        // Vincula o parâmetro "idEstado" com o valor recebido como argumento
        $stmt->bindParam(":idEstado", $idEstado);

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

    /* Método consultarEstado */
    public function consultarEstado($idEstado)
    {
        require("conexaobd.php");

        $consulta = "SELECT * FROM viewEstados WHERE IDESTADO=:idEstado";

        $stmt = $pdo->prepare($consulta);

        $stmt->bindParam("idEstado", $idEstado);

        $stmt->execute();
        foreach ($stmt as $linha) {
            $this->idEstado = $linha["IDESTADO"];
            $this->nome = $linha["NOME"];
            $this->sigla = $linha["SIGLA"];
        }
    }

    /* Método listarEstados */
    public function listarEstados()
    {
        require("conexaobd.php");
        $consulta = "SELECT * FROM viewEstados";
        $stmt = $pdo->prepare($consulta);
        $stmt->execute();
        return  $stmt;
    }
}
