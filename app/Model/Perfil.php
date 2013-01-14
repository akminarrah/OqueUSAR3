<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
class Perfil extends AppModel{
    
    public $useTable = 'perfil';
    
    /**
     * Cria um registro de perfil em branco, somente com o id do usuário
     * @param int $usuario
     */
    public function criar($usuario){
        if(!empty($usuario)){
            $temp['Perfil']['id'] = $usuario;
            return $this->save($temp);
        }
        return false;
    }
}
?>