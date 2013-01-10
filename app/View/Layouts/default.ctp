<?php
/**
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
 * @package       Cake.View.Layouts
 * @since         CakePHP(tm) v 0.10.0.1076
 * @license       MIT License (http://www.opensource.org/licenses/mit-license.php)
 */
$cakeDescription = __d('OqueUsar uma nova maneira de ficar por dentro do mundo dos cosméticos');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <?php echo $this->Html->charset(); ?>
        <title>
            <?php echo $cakeDescription ?>:
            <?php echo $title_for_layout; ?>
        </title>
        <?php
        echo $this->Html->meta('icon', $this->Html->url('base/favicon.ico'));

        echo $this->Html->css('geral');
        echo $this->Html->css('fontes');

        echo $this->fetch('meta');
        echo $this->fetch('css');
        echo $this->fetch('script');
        ?>
    </head>
    <body>
        <div id="total">

            <div id="header">
                <div id="contem_topo" class="meio">
                    <div id="busca">
                        <form id="form1" name="form1" method="post" action="">

                            <span class="L">
                                <input name="produtos" type="radio" value="" />produtos
                                <input name="usuários" type="radio" value="" />usu&aacute;rios
                                <input name="parceiros" type="radio" value="" />parceiros
                            </span>

                            <input type="text" name="busca_geral" id="busca_geral" class="busca_campo" value="faça sua busca e clique ENTER" />

                        </form>
                        <div id="lupa"><?php echo $this->Html->image('base/lupa.png', array('alt'=>'lupa', 'title'=>'Buscar')); ?></div>
                    </div>

                    <div id="menuUsu">
                        <div id="mU_avatar"><img src="http://www.oqueusar.com.br/img/avatar/icon/31012011075202_3.jpg" /></div>
                        <div id="mU_nome" class="txt_12_verdeEscuro">nome do usuário ▼</div>
                    </div>

                    <div id="logo"><div class="meio"><?php echo $this->Html->image('base/logo_OqueUSAR.png', array('alt'=>'logotipo', 'title'=>'OqueUsar')); ?></div></div>

                </div><!--fecha contem_topo-->

                <div id="menuSite" class="L text">
                    <strong><a>
                            cadastrar produto| quem vende | descontos | sorteios
                        </a></strong>
                </div>
                <div id="tagsSite" class="L txt_11_FFF">Cabelos | Face | Olhos | Corpo| Mãos | Pés| Boca | Acessório| Banho| Tratamento | Saúde | Desodorante | Esmalte | Hidratante | Maquiagem | Perfume | Shampoo | Condicionador</div>

            </div><!--fecha header-->
            <div id="contem_secao">
                <!-- CORPO DO SITE AQUI -->
                <?php echo $this->fetch('content'); ?>
            </div>
            </div><!--fecha meio-->

            </div><!--fecha contem_secao-->

                <div id="rodape" class="linhas">
                    <div id="logo_rodape" class="rodape_colunas">
                        <?php echo $this->Html->image('base/logo_OqueUSAR_pqnoPB.png', array('alt'=>'logotpo', 'title'=>'OqueUsar')); ?>
                        <div id="copyright" class="txt_12_666" style="margin:15px 0 0 0;">2010 - <?php echo date('Y') ?> <br/> OqueUSAR&copy; cosm&eacute;ticos</div>
                    </div>
                    <div id="info_cosmeticos" class="rodape_colunas txt_12_999">
                        <h4><strong> Veja tamb&eacute;m:</strong></h4>
                        <h4>noticias</h4>
                        <h4>quem somos</h4>
                        <h4>contato</h4>
                        <h4>cdastras produto</h4>
                        <h4>regras de uso</h4>
                    </div>

                    <div id="redes_acompanhe" class="rodape_colunas txt_12_999">
                        <h4><strong>Conhe&ccedil;a tamb&eacute;m nossos perfis:</strong></h4>

                        <a href="http://twitter.com/o_que_usar" target="_blank" title="siga @o_que_usar" alt="siga @o_que_usar">
                            <?php echo $this->Html->image('base/ico_twitter.png', array('alt'=>'logotpo', 'title'=>'OqueUsar')); ?> Twitter 
                        </a><br />

                        <a href="http://www.orkut.com.br/Main#Community?cmm=107186737" target="_blank" title="Participe da comunidade oficial no Orkut" alt="Participe da comunidade oficial no Orkut">
                            <?php echo $this->Html->image('base/ico_orkut.png', array('alt'=>'logotpo', 'title'=>'OqueUsar')); ?> Orkut
                        </a><br />

                        <a href="http://www.facebook.com/OqueUsar" target="_blank" title="Veja nosso perfil no Facebook" alt="Veja nosso perfil no Facebook">
                            <?php echo $this->Html->image('base/ico_facebook.png', array('alt'=>'logotpo', 'title'=>'OqueUsar')); ?> Facebook
                        </a><br />

                        <a href="http://a10maos.posterous.com/" target="_blank" title="Por tr&aacute;s dos bastidores: Blog a10m&atilde;os" alt="Por tr&aacute;s dos bastidores: Blog a10m&atilde;os">
                            <?php echo $this->Html->image('base/ico_a10maos.png', array('alt'=>'logotpo', 'title'=>'OqueUsar')); ?> a10m&atilde;os blog 
                        </a><br />

                        <a href="http://oqueusar-cosmeticos.blogspot.com/" target="_blank" title="Blog OqueUSAR cosm&eacute;ticos" alt="Blog OqueUSAR cosm&eacute;ticos">
                            <?php echo $this->Html->image('base/ico_blogger.png', array('alt'=>'logotpo', 'title'=>'OqueUsar')); ?> OqueUSAR cosm&eacute;ticos blog
                        </a>
                    </div>

                    <div id="info_cosmeticos" class="rodape_colunas txt_12_999" >
                        <h4><strong>Parceiros:</strong></h4>
                        <h4>área restrita</h4>
                    </div>
                </div>


        </div><!--fecha total-->
            
    </body>
</html>