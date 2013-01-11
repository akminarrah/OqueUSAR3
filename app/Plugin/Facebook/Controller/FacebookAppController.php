<?php
/**
 * Application level Controller
 *
 * This file is application-wide controller file. You can put all
 * application-wide controller-related methods here.
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
 * @package       app.Controller
 * @since         CakePHP(tm) v 0.2.9
 * @license       MIT License (http://www.opensource.org/licenses/mit-license.php)
 */

/**
 * Application Controller
 *
 * Add your application-wide methods in the class below, your controllers
 * will inherit them.
 *
 * @package       app.Controller
 * @link http://book.cakephp.org/2.0/en/controllers.html#the-app-controller
 */

App::uses('Controller', 'Controller');
App::uses('AppController', 'Controller');
App::uses('Facebook', 'Facebook.Lib');

class FacebookAppController extends AppController {

    protected $Fb;
    protected $faceConfig = array('appId' => '156316307761037', 'secret' => '85ba1426222cf30fe2bb707e7923346f', 'fileUpload' => false);
    //public $components = array('DebugKit.Toolbar');
    
    public function beforeFilter() {
        parent::beforeFilter();
        $this->log('FacebookAppController::constructor');
        //$this->Components->unload('DebugKit.Toolbar');
        $this->log('Facebook version: ');
        $this->log(Facebook::VERSION);
        $this->log('FacebookAppController::contructor');
        if (!$this->Fb) {
            $this->Fb = new Facebook($this->faceConfig);
        }
        $this->log('FacebookAppController::contructor - ok');
    }
    
    
}
