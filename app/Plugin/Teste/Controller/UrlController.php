<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
App::uses('TesteAppController', 'Teste.Controller');

class UrlController extends TesteAppController{
    
    public function testar(){
        $this->log('Teste.UrlController::testar');
        $this->log($this->request);
    }
}
?>