<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
class Usuario extends AppModel{

    public function autenticar($email, $senha){
        $this->log('Usuario::autenticar');
        if(!empty($email) && !empty($senha)){

            $usuario = $this->findByEmail($email);

            if(!empty($usuario)){

                $novaSenha = parent::encriptar($senha);

                if($usuario['Usuario']['senha'] == $novaSenha){
                    unset($usuario['Usuario']['senha']);
                    $this->retorno->tipo = Constantes::$TIPO_SUCESSO;
                    $this->retorno->mensagem = $usuario;
                }
            }else{
                $this->retorno->tipo = Constantes::$TIPO_ERRO;
                $this->retorno->mensagem = 'Usuário não encontrado!';
            }
        }else{
            $this->retorno->tipo = Constantes::$TIPO_ERRO;
            $this->retorno->mensagem = Constantes::$MSG_ERRO_DADOS_RECEBIDOS;
        }
        return $this->retorno;
    }
}
?>