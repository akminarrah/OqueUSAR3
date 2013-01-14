<?php
/**
 * Application model for Cake.
 *
 * This file is application-wide model file. You can put all
 * application-wide model-related methods here.
 *
 * PHP 5
 *
 * CakePHP(tm) : Rapid Development Framework (http://cakephp.org)
 * Copyright 2005-2012, Cake Software Foundation, Inc. (http://cakefoundation.org)
 *
 * Licensed under The MIT License
 * Redistributions of files must retain the above copyright notice.
 *
 * @copyright     Copyright 2005-2012, Cake Software Foundation, Inc. (http://cakefoundation.org)
 * @link          http://cakephp.org CakePHP(tm) Project
 * @package       app.Model
 * @since         CakePHP(tm) v 0.2.9
 * @license       MIT License (http://www.opensource.org/licenses/mit-license.php)
 */

App::uses('Model', 'Model');

/**
 * Application model for Cake.
 *
 * Add your application-wide methods in the class below, your models
 * will inherit them.
 *
 * @package       app.Model
 */

App::uses('Constantes', 'Common');

class AppModel extends Model {

    protected $retorno;
    
    /**
     * Este método encripta utilizando sha1 do cakephp
     * @param type $str
     */
    public function encriptar($str){
        return sha1($str);
    }
    
    public function formatDataSql($data){
        return date(Constantes::$DATETIME_FORMAT_TO_DATABASE, strtotime($data));
    }
    
    public function formatData($data, $format){
        return date($format, strtotime($data));
    }
    
    public function dataSqlFormat(){
        return date(Constantes::$DATETIME_FORMAT_TO_DATABASE);
    }

    public function validarFormatoDataBr($data){
        // VALIDAR DATA NO FORMATO DD/MM/AAAA
        return eregi("^[0-9]{2}/[0-9]{2}/[0-9]{4}$", $data);
    }
    
    public function validarDataMenorAtual($data){
        $atual = date(Constantes::$SIMPLE_DATE_FORMAT_TO_VIEW);
        $dtAtual = strtotime($atual);
        $compData = strtotime($data);
        if(($dtAtual - $compData) < 0){
            return false;
        }
        return true;
    }
    
    public function queryDataFormatToView($nomeCampo, $formato = ""){
        $formato = (empty($formato) ? "'%d/%m/%Y %H:%i'" : $formato);
        return "DATE_FORMAT(".$nomeCampo . ", ".$formato.")";
    }
    
    public function executarConsultaExterna($query, $model) {
        $defCon = ConnectionManager::getDataSource('default');
        $con = mysql_connect($defCon->config['host'], $defCon->config['login'], $defCon->config['password']);
        mysql_set_charset('utf8', $con);
        mysql_select_db($defCon->config['database']);
        $result = mysql_query($query);
        $return = array();
        while ($row = mysql_fetch_object($result)) {
            $return[] = array($model => $row);
        }
        mysql_close();
        return $return;
    }
}
