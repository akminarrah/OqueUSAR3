<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 * 
 */
App::uses('FacebookAppController', 'Facebook.Controller');

class AutenticarController extends FacebookAppController {

    var $uses = array();

    /**
     * Este método é o callback do login do face 
     */
    public function check() {
        $this->log('Facebook.Autenticar::check');
        if (isset($this->request->query['code'])) {
            $this->log('Facebook.Autenticar::check - code: ' . $this->request->query['code']);

            //Verificar se já as contas já estão associadas
            //Armazenar o token
            
            
            /*
             * Verifica se já está logado.
             * Neste caso o usuário estará associando a conta do facebook dele
             * à conta do QL
             */
            $this->log('Facebook.Autenticar::check - recuperando os do FB');
            $data = $this->getFacebookData();
            $this->log($data);
            /*if (parent::logado()) {
                $this->retorno = $this->associaContaFacebook($data);
            } else {
                try{
                //$this->retorno = $this->login();
                $this->retorno = $this->getFacebookData();
                }catch(Exception $e){
                    pr($e->getMessage());
                }
                if ($this->retorno->tipo == Constantes::$TIPO_SUCESSO) {
                    $this->log('Facebook.Autenticar::check - Dados do facebook');
                    $this->log($this->retorno);
                    //parent::criarSessao($this->retorno->mensagem, 1);
                }
            }*/
            
//            if (isset($this->request->query['origem'])) {
//                if ($this->request->query['origem'] == 'amigos') {
//                    $this->redirect('/amigos');
//                }
//            }
//            parent::redirectHome();
        } else {
            $this->Session->setFlash("Erro na autenticação com o facebook!", Constantes::$TIPO_ERRO);
            parent::redirectHome();
        }
    }

    //Usuário já está logado no facebook e vai efetuar login no QL
    public function autenticar() {
        $this->log('Facebook.Autenticar::autenticar');

        $user = $this->Fb->getUser();
        if (!empty($user)) {
            $this->log($user);
            $this->log('Facebook.Autenticar::autenticar');
            $dados = $this->getFacebookData();
            //parent::criarSessao($usuario, 1);
            //parent::redirectHome();
            $data['img']['square'] = 'http://graph.facebook.com/'.$dados['username'].'/picture?type=square';
            $data['img']['large'] = 'http://graph.facebook.com/'.$dados['username'].'/picture?type=large';
            $this->set('dados', $data);
        } else {
            $params = array(
                'scope' => 'user_about_me, email, read_stream, user_birthday',
                'redirect_uri' => 'http://ec2-54-232-98-26.sa-east-1.compute.amazonaws.com/facebook/autenticar/check?' . (isset($this->request->query['origem']) ? 'origem=' . $this->request->query['origem'] : '')
            );
            $urlLogin = $this->Fb->getLoginUrl($params);
            $this->set('redirect', $urlLogin);
            $this->render('redirect');
        }
    }

    public function amigos() {
        if (parent::logado()) {

            $result = parent::recuperarAmigosFacebook();
            $facebook['logado'] = $result['Facebook']['logado'];

            if ($result['Facebook']['logado']) {
                $facebook['Facebook']['amigos'] = $result['Facebook']['amigos']['data'];
            }

            $this->set('facebook', $facebook);
        } else {
            $this->Session->setFlash("A sua sessão expirou, por favor tente novamente!", Constantes::$TIPO_ERRO);
            parent::redirectHome();
        }
    }

    public function salvarConvite() {
        if (!parent::logado()) {
            $this->Session->setFlash("Sua sessão expirou, faça login novamente!", Constantes::$TIPO_ERRO);
            parent::redirectIndex();
        }
        if ($this->request['data']['amigos']) {
            $dados = array();
            $dados = $this->request['data'];
            $temp = parent::recuperaSessao();
            //pr($temp);
            $dados['Usuario']['id'] = $temp['Usuario']['id'];

            

            //pr($listaConvites);

            foreach ($dados['amigos'] as $amigo) {
                $this->convidar();
            }
            if ($this->retorno->tipo == Constantes::$TIPO_SUCESSO) {
                $this->Session->setFlash("Seus convites foram enviados com sucesso!", Constantes::$TIPO_SUCESSO);
            } else {
                $this->Session->setFlash($this->retorno->mensagem, Constantes::$TIPO_ERRO);
            }
            parent::redirectHome();
        } else {
            $this->Session->setFlash("Nenhum amigo foi selecionado!", Constantes::$TIPO_ERRO);
        }
        $this->redirect('amigos');
    }

    public function logout() {
        $this->Fb->api($this->Fb->getLogoutUrl());
        setcookie('fbs_' . $this->Fb->getAppId(), '', time() - 100, '/', 'http://www.facebook.com');
        session_destroy();
        $this->Fb->destroySession();
        parent::removerSessao();
        parent::redirectIndex();
    }

    public function enviarConvite(){
        $usuario = parent::recuperaSessao();
        $dados = array();
        if (parent::check($this->request->query, 'uid')) {
            $dados = $this->request->query;
            $dados['Usuario']['id'] = $usuario['Usuario']['id'];
            $dados['uid_convidado'] = $this->request->query['uid'];
            
            if($this->ConviteUsuarioFacebook->verificarConviteExistente($dados['Usuario']['id'], $dados['uid_convidado']) == 0){
                $this->retorno = $this->ConviteUsuarioFacebook->salvarConvite($dados);
                //enviando convite para o facebook
                $ret_obj = $this->Fb->api('/' . $dados['uid_convidado'] . '/feed', 'POST', array('message' => Constantes::$TEXTO_CONVITE_FACEBOOK));
            }else{
                $this->retorno->tipo = Constantes::$TIPO_ERRO;
                $this->retorno->mensagem = "Você já convidou esta pessoa!";
            }
        } else {
            $this->retorno->tipo = Constantes::$TIPO_ERRO;
            $this->retorno->mensagem = "Erro na transferência dos dados!";
        }
        $this->redirect('/amigos');
    }
    
    private function convidar($dados) {
        //Verificando se o amigo já recebeu convite
        if (!array_key_exists($amigo, $listaConvites)) {
            $dados['uid_convidado'] = $amigo;

            //pr($dados);
            $this->retorno = $this->ConviteUsuarioFacebook->salvarConvite($dados);
            if ($this->retorno->tipo == Constantes::$TIPO_SUCESSO) {
                $this->ConviteUsuarioFacebook->create();
            } else {
                $this->retorno->tipo = Constantes::$TIPO_ERRO;
                $this->retorno->mensagem = "Erro ao registrar o convite!";
            }
            try {
                $ret_obj = $this->Fb->api('/' . $amigo . '/feed', 'POST', array('message' => Constantes::$TEXTO_CONVITE_FACEBOOK));
                //$ret_obj = $this->Fb->api('/'.$arAmigo[0].'/feed', 'POST', array('message' => 'Boa noite pessoal! Testando facebook :D'));
                //pr($ret_obj);
            } catch (FacebookApiException $e) {
                //pr($e->getMessage());
                $this->retorno->tipo = Constantes::$TIPO_ERRO;
                $this->retorno->mensagem = "Erro ao enviar o convite para o Facebook: " . $e->getMessage();
            }
        } else {
            $this->retorno->tipo = Constantes::$TIPO_ERRO;
            $this->retorno->mensagem = "Você já enviu um convite para este amigo!";
        }
    }

    private function login() {
        $data = $this->getFacebookData();

        if ($data) {
            /*
             * salvando dados do usuario
             * Esta parte tenta efetuar o cadastro, porém, neste momento, 
             * internamente é realizada a verificação de existêrncia deste cadastro
             * caso já exista ele retorna os dados do usuário e continua o fluxo 
             * sem realizar um novo cadastro
             */
            $this->retorno = $this->Usuario->cadastrar($data);
            /*
             * Associando a conta do face com o cadastro do QL
             */
            if ($this->retorno->tipo == Constantes::$TIPO_SUCESSO) {//Salvando dados do aplicativo caso seja o primeiro cadastro
                $this->retorno = $this->associaContaFacebook($this->retorno->mensagem['Usuario']);
            } else if (($this->retorno->tipo == Constantes::$TIPO_ERRO && $this->retorno->mensagem == html_entity_decode('Email cadastrado!'))) {//Salvando dados do aplicativo caso usuario ja exista
                $this->retorno = $this->associaContaFacebook($data);
            } else {
                $this->Session->setFlash("Erro ao cadastro o usuário! [" . $this->retorno->mensagem . "]", Constantes::$TIPO_ERRO);
            }
            /*
             * Depois de tudo, verifica se o retorno está ok 
             */
            if ($this->retorno->tipo == Constantes::$TIPO_SUCESSO) {
                $usuario = $this->Usuario->getUsuarioByUid($this->retorno->mensagem['UsuariosAplicativo']['uid']);
                /*
                 * Recuperando as estatísticas do usuário
                 */
                $usuario['Usuario']['estatisticas'] = $this->UsuarioEstatisticas->recuperarDados($usuario['Usuario']['id']);
                //preparando o retorno
                $this->retorno->tipo = Constantes::$TIPO_SUCESSO;
                $this->retorno->mensagem = $usuario;
            }
        } else {
            $this->retorno->tipo = Constantes::$TIPO_ERRO;
            $this->retorno->mensagem = "Erro na transmissão dos dados!";
        }
        return $this->retorno;
    }

    /**
     * Recebe os dados da tabela de usuário
     * data['Usuario']
     * 
     * @param type $data
     */
    private function associaContaFacebook($data) {
        $usuario = array();

        if (parent::logado()) {
            $usuario = parent::recuperaSessao();
        } else {
            $usuario = $this->Usuario->getUsuarioByEmail($data['email']);
        }

        if (!empty($usuario)) {
            //já possui conta e email é igual
            $this->retorno = $this->salvarDadosAplicativo($data, $usuario['Usuario']['id']);
        } else {
            $this->retorno->tipo = Constantes::$TIPO_ERRO;
            $this->retorno->mensagem = "Erro ao associar a conta do usuário com a conta do facebook!";
        }
        return $this->retorno;
    }

    private function salvarDadosAplicativo($data, $usuarioId) {
        //salvando o token
        $this->retorno = $this->UsuariosAplicativo->salvarDados($data, $usuarioId);

        if ($this->retorno->tipo == Constantes::$TIPO_ERRO) {
            $this->Session->setFlash("Erro ao salvar o aplicativo! [" . $this->retorno->mensagem . "]", Constantes::$TIPO_ERRO);
        }
        return $this->retorno;
    }

    /**
     * Extrai as informações retornadas do FB
     * @return array
     */
    private function getFacebookData() {
        $this->log('Facebook.AutenticarController::getFacebookData');
        $user = $this->Fb->getUser();
        $data = array();
        $this->log('Facebook.AutenticarController::getFacebookData - usuario do FB');
        $this->log($user);
        //pr($user);
        if ($user) {
            $this->log('Facebook.AutenticarController::getFacebookData - recuperando dados do FB');
            //recuperando as informações do usuário
            $user_info = $this->Fb->api('/me');

            $this->log('Facebook.AutenticarController::getFacebookData - dados do FB');
            $this->log($user_info);
            //dados de cadstro do usuario
            //$data['appID'] = Constantes::$FACEBOOK_APP_ID;
            $data['email'] = $user_info['email'];
            $data['nome'] = $user_info['name'];
            //dados de cadastro do aplicativo
            $data['access_token'] = $this->Fb->getAccessToken();
            $data['fbid'] = $user_info['id'];
            $data['username'] = $user_info['username'];
        }
        return $data;
    }

}

?>