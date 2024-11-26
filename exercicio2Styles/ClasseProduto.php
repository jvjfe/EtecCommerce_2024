<?php

class ClasseProduto
{
    /* Atributos */
    private $idProduto;
    private $nome;
    private $precoCompra;
    private $margemLucro;
    private $precoVenda;
    private $idMarca;
    private $idUnidade;
    private $comprados;
    private $vendidos;
    private $estoque;

    /* Getters */
    public function getIdProduto()
    {
        return $this->idProduto;
    }

    public function getNome()
    {
        return $this->nome;
    }

    public function getPrecoCompra()
    {
        return $this->precoCompra;
    }

    public function getMargemLucro()
    {
        return $this->margemLucro;
    }

    public function getPrecoVenda()
    {
        return $this->precoVenda;
    }

    public function getIdMarca()
    {
        return $this->idMarca;
    }

    public function getIdUnidade()
    {
        return $this->idUnidade;
    }

    public function getComprados()
    {
        return $this->comprados;
    }

    public function getVendidos()
    {
        return $this->vendidos;
    }

    public function getEstoque()
    {
        return $this->estoque;
    }

    /* Setters */
    public function setIdProduto($idProduto)
    {
        $this->idProduto = $idProduto;
    }

    public function setNome($nome)
    {
        $this->nome = $nome;
    }

    public function setPrecoCompra($precoCompra)
    {
        $this->precoCompra = $precoCompra;
    }
    
    public function setMargemLucro($margemLucro)
    {
        $this->margemLucro = $margemLucro;
    }
    
    public function setPrecoVenda($precoVenda)
    {
        $this->precoVenda = $precoVenda;
    }    

    public function setIdMarca($idMarca)
    {
        $this->idMarca = $idMarca;
    }

    public function setIdUnidade($idUnidade)
    {
        $this->idUnidade = $idUnidade;
    }

    public function setComprados($comprados)
    {
        $this->comprados = $comprados;
    }

    public function setVendidos($vendidos)
    {
        $this->vendidos = $vendidos;
    }

    public function setEstoque($estoque)
    {
        $this->estoque = $estoque;
    }

    public function __construct() {}


    public function inserirProduto($nome, $precoCompra, $margemLucro, $idMarca, $idUnidade)
    {
        require("conexaobd.php");
        $comando = "SELECT inserirProduto(:nome,:precoCompra,:margemLucro,:idMarca,:idUnidade) AS Resultado;";
        $stmt  = $pdo->prepare($comando);
        $stmt->bindParam(":nome", $nome);
        $stmt->bindParam(":precoCompra", $precoCompra);
        $stmt->bindParam(":margemLucro", $margemLucro);                
        $stmt->bindParam(":idMarca", $idMarca);
        $stmt->bindParam(":idUnidade", $idUnidade);
        $stmt->execute();
        $resultado = null;
        foreach ($stmt as $linha) {
            $resultado =  $linha["Resultado"];
        }
        return $resultado;
    }

    public function alterarProduto($idProduto,$nome, $precoCompra, $margemLucro, $idMarca, $idUnidade)
    {
        require("conexaobd.php");
        $comando = "SELECT alterarProduto(:idProduto,:nome,:precoCompra,:margemLucro,:idMarca,:idUnidade) AS Resultado;";
        $stmt = $pdo->prepare($comando);
        $stmt->bindParam(":idProduto", $idProduto);
        $stmt->bindParam(":nome", $nome);
        $stmt->bindParam(":precoCompra", $precoCompra);
        $stmt->bindParam(":margemLucro", $margemLucro);          
        $stmt->bindParam(":idMarca", $idMarca);
        $stmt->bindParam(":idUnidade", $idUnidade);
        $stmt->execute();
        $resultado = null;
        foreach ($stmt as $linha) {
            $resultado =  $linha["Resultado"];
        }
        return $resultado;
    }

    public function excluirProduto($idProduto)
    {
        require("conexaobd.php");
        $comando = "SELECT excluirProduto(:idProduto) AS Resultado;";
        $stmt = $pdo->prepare($comando);
        $stmt->bindParam(":idProduto", $idProduto);
        $stmt->execute();
        $resultado = null;
        foreach ($stmt as $linha) {
            $resultado =  $linha["Resultado"];
        }
        return $resultado;
    }

    public function consultarProduto($idProduto)
    {
        require("conexaobd.php");
        $consulta = "SELECT * FROM viewProdutos WHERE idProduto=:idProduto";
        $stmt = $pdo->prepare($consulta);
        $stmt->bindParam(":idProduto", $idProduto);
        $stmt->execute();
        foreach ($stmt as $linha) {
            $this->idProduto = $linha["idProduto"];
            $this->nome = $linha["nomeProduto"];
            $this->precoCompra = $linha["precoCompra"];
            $this->margemLucro = $linha["margemLucro"];
            $this->precoVenda = $linha["precoVenda"];                                    
            $this->idMarca = $linha["idMarca"];
            $this->idUnidade = $linha["idUnidade"];
            $this->comprados = $linha["comprados"];
            $this->vendidos = $linha["vendidos"];
            $this->estoque = $linha["estoque"];
        }
    }

    public function listarProdutos()
    {
        require("conexaobd.php");
        $consulta = "SELECT * FROM viewProdutos";
        $stmt = $pdo->prepare($consulta);
        $stmt->execute();
        return $stmt;
    }
}
