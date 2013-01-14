<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

class Usuario extends AppModel {

    var $VALORES_SABENDO = array('' => 'escolha uma opção',
        1 => 'Internet',
        2 => 'Jornal',
        3 => 'Revista',
        4 => 'Amigos',
        5 => 'Televisão',
        6 => 'Twitter',
        7 => 'Blog',
        8 => 'Orkut',
        9 => 'Facebook',
        10 => 'Sites de busca');

    var $USUARIO_FOTO_NOME_ARQUIVO_DEFAULT = 'avatar_';
    var $USUARIO_FOTO_EXTENSAO_ARQUIVO_DEFAULT = '.png';
    
    var $hasOne = array('Perfil' => array('className' => 'Perfil', 'foreignKey' => 'id'));

    public function afterSave($created){
        if($created){
            $Perfil = ClassRegistry::init('Perfil');
            $Perfil->criar($this->id);
        }
    }
    
    public function salvar($dados, $cadastroFacebook = false) {
        $dados['Usuario']['foto'] = $this->Usuario->USUARIO_FOTO_NOME_ARQUIVO_DEFAULT . $dados['Usuario']['genero'] . $this->Usuario->USUARIO_FOTO_EXTENSAO_ARQUIVO_DEFAULT;
        $dados['Usuario']['nascimento'] = parent::formatDataSql($dados['Usuario']['nascimento']);
        $dados['Usuario']['inclusao'] = parent::dataSqlFormat();
        
        if(!$cadastroFacebook){
            $dados['Usuario']['senha'] = Security::hash($dados['Usuario']['senha']);
        }

        if (isset($dados['Usuario']['news'])) {
            if ($dados['Usuario']['news'] != 'S') {
                $dados['Usuario']['news'] = 'N';
            }
        } else {
            $dados['Usuario']['news'] = 'N';
        }

        if ($this->save($this->data)) {
            $this->return->tipo = Constantes::$TIPO_SUCESSO;
            $this->return->mensagem = $this->findById($this->id);
        }else{
            $this->retorno->tipo = Constantes::$TIPO_ERRO;
            $this->retorno->mensagem = Constantes::$MSG_ERRO_DADOS_RECEBIDOS;
        }
        return $this->retorno;
    }

    public function autenticar($email, $senha) {
        $this->log('Usuario::autenticar');
        if (!empty($email) && !empty($senha)) {

            $usuario = $this->findByEmail($email);

            if (!empty($usuario)) {

                $novaSenha = parent::encriptar($senha);

                if ($usuario['Usuario']['senha'] == $novaSenha) {
                    unset($usuario['Usuario']['senha']);
                    $this->retorno->tipo = Constantes::$TIPO_SUCESSO;
                    $this->retorno->mensagem = $usuario;
                }
            } else {
                $this->retorno->tipo = Constantes::$TIPO_ERRO;
                $this->retorno->mensagem = 'Usuário não encontrado!';
            }
        } else {
            $this->retorno->tipo = Constantes::$TIPO_ERRO;
            $this->retorno->mensagem = Constantes::$MSG_ERRO_DADOS_RECEBIDOS;
        }
        return $this->retorno;
    }

    
    public function validarDadosCadastro($data, $cadastroFacebook = false) {
        $valido = true;

        $dtAtual = date('d-m-Y');
        $dtNiver = $data['Usuario']['nascimento'];
        if (empty($data['Usuario']['nome'])) {
            $this->invalidate('nome', 'O campo nome é obrigatório!');
            $valido = false;
        } elseif (empty($data['Usuario']['apelido'])) {
            $this->invalidate('apelido', 'O campo apelido é obrigatório!');
            $valido = false;
        } elseif (empty($data['Usuario']['nascimento'])) {
            $this->invalidate('data de nascimento', 'O campo data de nascimento é obrigatório!');
            $valido = false;
        } elseif (empty($data['Usuario']['sabendo'])) {
            $this->invalidate('como ficou sabendo', 'O campo como ficou sabendo é obrigatório!');
            $valido = false;
        } elseif (empty($data['Usuario']['email'])) {
            $this->invalidate('email', 'O campo email é obrigatório!');
            $valido = false;
        } elseif (!$this->validarEmail($data['Usuario']['email'])) {
            $valido = false;
        } elseif (!$this->compararEmail($data)) {
            $valido = false;
        } elseif ((strtotime($dtAtual) < strtotime($dtNiver))) {
            $this->invalidate('data de nascimento', 'O campo data denascimento não é uma data válida!');
            $valido = false;
        } elseif (!$this->validarDataNascimento($dtNiver, $dtAtual)) {
            $this->invalidate('data de nascimento', 'O campo data denascimento não é uma data válida!');
            $valido = false;
        }

        if (!$cadastroFacebook) {
            if (empty($data['Usuario']['senha'])) {
                $valido = false;
            } elseif (!$this->compararSenha($data)) {
                $this->invalidate('senha', 'O campo senha é obrigatório!');
                $valido = false;
            }
        }

        if ($valido) {
            $emailCheck = $this->verificarEmail($data['Usuario']['email']);
            if (!empty($emailCheck)) {
                $this->invalidate('email', 'Este email já está cadastrado em nossa base de dados!');
                $valido = false;
            }
        }
        return $valido;
    }

    public function validarDataNascimento($data, $dataAtual) {
        //Verificando se a data de aniversário é uma data futura
        $valido = true;
        $this->log($data);
        $this->log($dataAtual);
        $this->log(date('Y', strtotime($data)));
        $this->log(date('Y', strtotime($dataAtual)));
        if (date('Y', strtotime($data)) > date('Y', strtotime($dataAtual))) {
            $valido = false;
        }
        return $valido;
    }

    public function validarEmail($email) {
        if (eregi("^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$", $email)) {
            $valido = true;
        } else {
            $this->invalidate('email', 'Verifique se digitou o email corretamente.');
            $valido = false;
        }
        return $valido;
    }

    public function compararEmail($data) {
        $valido = true;
        if ($data['Usuario']['email'] != $data['Usuario']['confEmail']) {
            $this->invalidate('email', 'Verifique se você digitou o email corretamente!');
            $valido = false;
        }
        return $valido;
    }

    public function compararSenha($data) {
        $valido = true;
        if ($data['Usuario']['senha'] != $data['Usuario']['confSenha']) {
            $this->invalidate('senha', 'Verifique se você digitou a senha corretamente!');
            $valido = false;
        }
        return $valido;
    }

    public function verificarEmail($email) {
        return $this->find('count', array('conditions' => array('Usuario.email' => $email)));
    }

    public function verificarApelido($apelido) {
        return $this->find('count', array('conditions' => array('Usuario.apelido' => $apelido)));
    }

    public function atualizarDataAcesso($id) {
        $data = date('Y-m-d H:i');
        //pr($data);
        $usuario['ultimo_acesso'] = $this->ultimo_acesso = $data;
        $usuario['id'] = $id;

        $this->read(null, $id);
        $this->set($usuario);

        $this->save();
    }

    public function selecionarUsuario($id) {
        return $this->findById($id);
    }

    public function selecionarUsuarioPorEmail($email) {
        return $this->findByEmail($email);
    }

}

?>