<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
class InicioController extends AppController{
    
    public $uses = array('Usuario');
    
    public function index(){
        $this->log('InicioController::index');
        $email = 'ops.rio@gmail.com';
        $senha = 'alex0901';
        $this->retorno = $this->Usuario->autenticar($email, $senha);
        $this->log('InicioController::index - retorno');
        $this->log($this->retorno);
    }
}
?>