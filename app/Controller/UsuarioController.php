<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
class UsuarioController extends AppController{
    
    public function autenticar(){
        $this->log('UsuarioController::index');
        $email = 'ops.rio@gmail.com';
        $senha = '';
        $this->retorno = $this->Usuario->autenticar($email, $senha);
        $this->log('UsuarioController::index - retorno');
        $this->log($this->retorno);
    }
}
?>