<?php
/* IDCIDADE,NOME,IDESTADO,CLIENTES */
class ClasseCidade{
    /* Atributos */
    private $idCidade;
    private $nome;
    private $idEstado;
    private $clientes;
    /* Getters */
    public function getIdCidade(){
        return $this->idCidade;
    }
    public function getNome(){
        return $this->nome;
    }
    public function getIdEstado(){
        return $this->idEstado;
    }
    public function getClientes(){
        return $this->clientes;
    }
    /* Setters */
    public function setIdCidade($idCidade){
        $this->idCidade =  $idCidade;
    }
    public function setNome($nome){
        $this->nome = $nome;
    }
    public function setIdEstado($idEstado){
        $this->idEstado = $idEstado;
    }
    public function setClientes($clientes){
        $this->clientes = $clientes;
    }
    /* 
    Métodos do CRUD 
    C-CREATE-INSERT -> inserirCidade()
    R-READ-SELECT -> consultarCidade() e listarCidades()
    U-UPDATE -> alterarCidade()
    D-DELETE -> excluirCidade()
    */
    public function inserirCidade($nome,$idEstado){
        /* Importar o arquivo conexaobd.php */
        require("conexaobd.php");
        /* Elaborar a variável $comando com a ação a ser executada */
        $comando = "SELECT inserirCidade(:nome,:idEstado) AS Resultado;";
        /* Preparar para executar o comando */
        $stmt = $pdo->prepare($comando);
        /* Definir os parâmetros */
        $stmt->bindParam(":nome",$nome);
        $stmt->bindParam(":idEstado",$idEstado);
        /* Executar o comando */
        $stmt->execute();
        /* Capturar o retorno do Banco de Dados */
        foreach($stmt as $registro){
            $resultado = $registro["Resultado"];
        }
        /* Retornar o resultado do método */
        return $resultado;
    }
    public function alterarCidade($idCidade,$nome,$idEstado){
        /* Importar o arquivo conexaobd.php */
        require("conexaobd.php");
        /* Elaborar a variável $comando com a ação a ser executada */
        $comando="SELECT alterarCidade(:idCidade,:nome,:idEstado) AS Resultado;";
        /* Preparar para executar o comando */
        $stmt = $pdo->prepare($comando);
        /* Definir os parâmetros */
        $stmt->bindParam("idCidade",$idCidade);
        $stmt->bindParam(":nome",$nome);
        $stmt->bindParam("idEstado",$idEstado);
        /* Executar o comando */
        $stmt->execute();
        /* Capturar o retorno do Banco de Dados */
        foreach($stmt as $registro){
            $resultado = $registro["Resultado"];
        }
        /* Retornar o resultado do método */
        return $resultado;
    }
    public function excluirCidade($idCidade){
        /* Importar o arquivo conexaobd.php */
        require("conexaobd.php");
        /* Elaborar a variável $comando com a ação a ser executada */
        $comando="SELECT excluirCidade(:idCidade) AS Resultado";
        /* Preparar para executar o comando */
        $stmt = $pdo->prepare($comando);
        /* Definir o parâmetro */
        $stmt->bindParam("idCidade",$idCidade);
        /* Executar o comando */
        $stmt->execute();
        /* Capturar o retorno do Banco de Dados */
        foreach($stmt as $registro){
            $resultado = $registro["Resultado"];
        }
        /* Retornar o resultado do método */
        return $resultado;
    }
    public function consultarCidade($idCidade){
        /* Importar o arquivo conexaobd.php */
        require("conexaobd.php");
        /* Elaborar a variável $comando com a ação a ser executada */
        $comando="SELECT * FROM viewCidades WHERE IDCIDADE=:idCidade;";
        /* Preparar para executar o comando */
        $stmt = $pdo->prepare($comando);
        /* Definir o parâmetro */
        $stmt->bindParam("idCidade",$idCidade);
        /* Executar o comando */
        $stmt->execute();
        /* Setar os atributos da ClasseCidade com o retorno do BD */
        foreach($stmt as $registro){
            $this->idCidade = $registro["idCidade"];
            $this->nome = $registro["nomeCidade"];
            $this->idEstado = $registro["idEstado"];
            $this->clientes = $registro["clientesCidade"];
        }
    }
    public function listarCidades(){
        /* Importar o arquivo conexaobd.php */
        require("conexaobd.php");
        /* Elaborar a variável $comando com a ação a ser executada */
        $comando="SELECT * FROM viewCidades;";
        /* Preparar para executar o comando */
        $stmt = $pdo->prepare($comando);
        /* Executar o comando */
        $stmt->execute();
        /* Retonar o $stmt - resultado do select */
        return $stmt;
    }











}
?>