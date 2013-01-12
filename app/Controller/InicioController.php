<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
class InicioController extends AppController{
    
    public $uses = array('Usuario');
    
    public function index(){
//        $this->log($this->Usuario->autenticar('ops.rio@gmail.com', 'alex0901'));
//        pr($this->Usuario->autenticar('ops.rio@gmail.com', 'alex0901'));
    }
}
?>