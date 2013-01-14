<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

App::uses('FacebookAppModel', 'Facebook.Model');

class Facebook extends FacebookAppModel{
    
    public $useTable = 'facebook';
    
    public function pesquisarAccessToken($token){
        if(!empty($token)){
            $dados = $this->findByAcessToken($token);
            $this->retorno->tipo = Constantes::$TIPO_SUCESSO;
            $this->retorno->mensagem = $dados;
        }else{
            $this->retorno->tipo = Constantes::$TIPO_ERRO;
            $this->retorno->mensagem = Constantes::$MSG_ERRO_DADOS_RECEBIDOS;
        }
        return $dados;
    }
    
    public function salvar($dados){
        if(isset($dados['access_token']) && !empty($dados['access_token']) && 
                isset($dados['fb_id']) && !empty($dados['fb_id']) && 
                isset($dados['username']) && !empty($dados['username']) && 
                isset($dados['link']) && !empty($dados['link']) &&
                isset($dados['usuario_id']) && !empty($dados['usuario_id']) &&
                isset($dados['locale']) && !empty($dados['locale'])){
            $temp['Fecabook'] = $dados;
            
            if($this->save($temp)){
                $this->retorno->tipo = Constantes::$TIPO_SUCESSO;
                $this->retorno->mensagem = $this->findById($this->id);
            }else{
                $this->retorno->tipo = Constantes::$TIPO_ERRO;
                $this->retorno->mensagem = 'Erro ao salvar o seu cadastro, tente mais tarde!';
            }
        }else{
            $this->retorno->tipo = Constantes::$TIPO_ERRO;
            $this->retorno->mensagem = Constantes::$MSG_ERRO_DADOS_RECEBIDOS;
        }
        return $this->retorno;
    }
}
?>