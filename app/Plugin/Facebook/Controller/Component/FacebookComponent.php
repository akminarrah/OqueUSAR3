<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

class FacebookComponent extends Component {

    protected $fb;
    protected $faceConfig = array('appId' => '156316307761037', 'secret' => '85ba1426222cf30fe2bb707e7923346f', 'fileUpload' => false);

    public function init() {
        $this->fb = new Facebook($this->faceConfig);
    }

}

?>