-- phpMyAdmin SQL Dump
-- version 3.3.10.4
-- http://www.phpmyadmin.net
--
-- Servidor: mysql.oqueusar.com.br
-- Tempo de Geração: Dez 21, 2012 as 01:40 PM
-- Versão do Servidor: 5.1.39
-- Versão do PHP: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `oqueusar`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `adm_pagamentos`
--

DROP TABLE IF EXISTS `adm_pagamentos`;
CREATE TABLE IF NOT EXISTS `adm_pagamentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `descricao` varchar(60) NOT NULL,
  `valor_unitario` decimal(13,2) NOT NULL,
  `dt_inicio` datetime NOT NULL,
  `dt_fim` datetime DEFAULT NULL,
  `tipo_pagamento` int(11) NOT NULL,
  `ativo` varchar(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `amigos`
--

DROP TABLE IF EXISTS `amigos`;
CREATE TABLE IF NOT EXISTS `amigos` (
  `usuario_id` int(11) NOT NULL,
  `amigo_id` int(11) NOT NULL,
  `aceito` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`usuario_id`,`amigo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `badges`
--

DROP TABLE IF EXISTS `badges`;
CREATE TABLE IF NOT EXISTS `badges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(60) DEFAULT NULL,
  `descricao` varchar(500) NOT NULL,
  `imagem` varchar(250) NOT NULL,
  `grupo_id` int(11) NOT NULL,
  `promocao_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=81 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `badge_grupos`
--

DROP TABLE IF EXISTS `badge_grupos`;
CREATE TABLE IF NOT EXISTS `badge_grupos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(60) NOT NULL,
  `pasta` varchar(50) NOT NULL COMMENT 'pasta dos arquivos do grupo',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `badge_usuarios`
--

DROP TABLE IF EXISTS `badge_usuarios`;
CREATE TABLE IF NOT EXISTS `badge_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `badge_id` int(11) NOT NULL,
  `data` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1043 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `blogs`
--

DROP TABLE IF EXISTS `blogs`;
CREATE TABLE IF NOT EXISTS `blogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) NOT NULL,
  `url` varchar(255) NOT NULL,
  `imagem` varchar(255) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `responsavel` varchar(60) NOT NULL,
  `inclusao` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cabelos`
--

DROP TABLE IF EXISTS `cabelos`;
CREATE TABLE IF NOT EXISTS `cabelos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cabelo_caracteristicas`
--

DROP TABLE IF EXISTS `cabelo_caracteristicas`;
CREATE TABLE IF NOT EXISTS `cabelo_caracteristicas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cabelo_cor`
--

DROP TABLE IF EXISTS `cabelo_cor`;
CREATE TABLE IF NOT EXISTS `cabelo_cor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cabelo_tamanhos`
--

DROP TABLE IF EXISTS `cabelo_tamanhos`;
CREATE TABLE IF NOT EXISTS `cabelo_tamanhos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cabelo_tipos`
--

DROP TABLE IF EXISTS `cabelo_tipos`;
CREATE TABLE IF NOT EXISTS `cabelo_tipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadastros_controles`
--

DROP TABLE IF EXISTS `cadastros_controles`;
CREATE TABLE IF NOT EXISTS `cadastros_controles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `dt_bloqueio` datetime DEFAULT NULL,
  `ativo` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(60) NOT NULL,
  `grupo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cidades`
--

DROP TABLE IF EXISTS `cidades`;
CREATE TABLE IF NOT EXISTS `cidades` (
  `id` int(11) NOT NULL,
  `descricao` varchar(65) NOT NULL,
  `estado_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_TB_Cidade_TB_Estado1` (`estado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentarios`
--

DROP TABLE IF EXISTS `comentarios`;
CREATE TABLE IF NOT EXISTS `comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(2000) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `positivo` int(11) NOT NULL DEFAULT '0',
  `negativo` int(11) NOT NULL DEFAULT '0',
  `inclusao` datetime NOT NULL,
  `dica` varchar(1) NOT NULL DEFAULT 'N' COMMENT 'S ou N',
  `tipo` varchar(1) NOT NULL DEFAULT '0' COMMENT '1 - positiva, 2 - negativa, 0 - neutra',
  PRIMARY KEY (`id`,`usuario_id`,`produto_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9994 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentarios_log`
--

DROP TABLE IF EXISTS `comentarios_log`;
CREATE TABLE IF NOT EXISTS `comentarios_log` (
  `id` int(11) NOT NULL,
  `descricao` varchar(245) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `positivo` int(11) NOT NULL DEFAULT '0',
  `negativo` int(11) NOT NULL DEFAULT '0',
  `inclusao` datetime NOT NULL,
  `dica` varchar(1) NOT NULL DEFAULT 'N' COMMENT 'S ou N',
  `tipo` varchar(1) NOT NULL DEFAULT '0' COMMENT '1 - positiva, 2 - negativa, 0 - neutra',
  `inclusao_log` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentarios_old`
--

DROP TABLE IF EXISTS `comentarios_old`;
CREATE TABLE IF NOT EXISTS `comentarios_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` text NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `positivo` int(11) NOT NULL DEFAULT '0',
  `negativo` int(11) NOT NULL DEFAULT '0',
  `inclusao` datetime NOT NULL,
  `dica` varchar(1) NOT NULL DEFAULT 'N',
  `tipo` varchar(1) NOT NULL DEFAULT '0' COMMENT '1 - positiva, 2 - negativa, 0 - neutra',
  PRIMARY KEY (`id`,`usuario_id`,`produto_id`),
  KEY `fk_TB_Comentario_TB_Usuario1` (`usuario_id`),
  KEY `fk_TB_Comentario_TB_Produto1` (`produto_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=476 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentarios_usuarios`
--

DROP TABLE IF EXISTS `comentarios_usuarios`;
CREATE TABLE IF NOT EXISTS `comentarios_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comentario_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `gostei` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `contario_id` (`comentario_id`,`usuario_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1403 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `config_twitters`
--

DROP TABLE IF EXISTS `config_twitters`;
CREATE TABLE IF NOT EXISTS `config_twitters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `info` varchar(1) NOT NULL DEFAULT '0',
  `foto` varchar(1) NOT NULL DEFAULT '0',
  `seguir_usuario` varchar(1) NOT NULL DEFAULT '0',
  `editar_produto` varchar(1) NOT NULL DEFAULT '0',
  `comentar_produto` varchar(1) NOT NULL DEFAULT '0',
  `gostar_comentario_prod` varchar(1) NOT NULL DEFAULT '0',
  `avaliar_produto` varchar(1) NOT NULL DEFAULT '0',
  `uso` varchar(1) NOT NULL DEFAULT '0',
  `favorito` varchar(1) NOT NULL DEFAULT '0',
  `deixar` varchar(1) NOT NULL DEFAULT '0',
  `vendo` varchar(1) NOT NULL DEFAULT '0',
  `remover` varchar(1) NOT NULL DEFAULT '0',
  `desejo` varchar(1) NOT NULL DEFAULT '0',
  `necessaire` varchar(1) NOT NULL DEFAULT '0',
  `promo` varchar(1) NOT NULL DEFAULT '0',
  `gostar_necessaire` varchar(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `contatos`
--

DROP TABLE IF EXISTS `contatos`;
CREATE TABLE IF NOT EXISTS `contatos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `assunto` varchar(60) DEFAULT NULL,
  `mensagem` varchar(2000) DEFAULT NULL,
  `lido` varchar(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `convites`
--

DROP TABLE IF EXISTS `convites`;
CREATE TABLE IF NOT EXISTS `convites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `data` datetime NOT NULL,
  `confirmado` char(1) NOT NULL DEFAULT 'N',
  `textoConvite` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1254 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cor_cabelos`
--

DROP TABLE IF EXISTS `cor_cabelos`;
CREATE TABLE IF NOT EXISTS `cor_cabelos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cupom`
--

DROP TABLE IF EXISTS `cupom`;
CREATE TABLE IF NOT EXISTS `cupom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loja_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `cupom` varchar(9) NOT NULL,
  `data_imp` datetime NOT NULL,
  `data_limite` datetime NOT NULL,
  `data_uso` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cupom` (`cupom`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `denuncias`
--

DROP TABLE IF EXISTS `denuncias`;
CREATE TABLE IF NOT EXISTS `denuncias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL,
  `tipo` int(11) NOT NULL COMMENT '1 - Produto, 2 - Comentario',
  `denuncia` varchar(500) NOT NULL,
  `data` datetime NOT NULL,
  `resolvido` char(1) NOT NULL DEFAULT 'N',
  `solucao` varchar(500) DEFAULT NULL,
  `data_solucao` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=501 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `desejos`
--

DROP TABLE IF EXISTS `desejos`;
CREATE TABLE IF NOT EXISTS `desejos` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`usuario_id`,`produto_id`),
  KEY `fk_TB_Lista_Desejos_TB_Usuario1` (`usuario_id`),
  KEY `fk_TB_Lista_Desejos_TB_Produto1` (`produto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `enderecos`
--

DROP TABLE IF EXISTS `enderecos`;
CREATE TABLE IF NOT EXISTS `enderecos` (
  `id` int(11) NOT NULL,
  `pais_id` int(11) NOT NULL,
  `estado_id` int(11) NOT NULL,
  `cidade` varchar(150) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `numero` varchar(5) DEFAULT NULL,
  `complemento` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_TB_Usuario_Complemento_TB_Usuario1` (`id`),
  KEY `fk_TB_Usuario_Complemento_TB_Pais1` (`pais_id`),
  KEY `fk_TB_Usuario_Complemento_TB_Estado1` (`estado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `endereco_lojas`
--

DROP TABLE IF EXISTS `endereco_lojas`;
CREATE TABLE IF NOT EXISTS `endereco_lojas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loja_id` int(11) NOT NULL,
  `pais_id` int(11) NOT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `cidade` varchar(65) NOT NULL,
  `logradouro` varchar(250) NOT NULL,
  `numero` varchar(5) NOT NULL DEFAULT '0',
  `complemento` varchar(10) DEFAULT NULL,
  `bairro` varchar(35) DEFAULT NULL,
  `cep` int(8) NOT NULL,
  `inclusao` datetime NOT NULL,
  `rotulo` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estados`
--

DROP TABLE IF EXISTS `estados`;
CREATE TABLE IF NOT EXISTS `estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pais_id` int(11) NOT NULL,
  `descricao` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_TB_Estado_TB_Pais1` (`pais_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=28 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `etnias`
--

DROP TABLE IF EXISTS `etnias`;
CREATE TABLE IF NOT EXISTS `etnias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `feeds`
--

DROP TABLE IF EXISTS `feeds`;
CREATE TABLE IF NOT EXISTS `feeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `url` varchar(500) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `blog` varchar(1) NOT NULL DEFAULT 'N',
  `ativo` varchar(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `indicacao`
--

DROP TABLE IF EXISTS `indicacao`;
CREATE TABLE IF NOT EXISTS `indicacao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `promocao_id` int(11) DEFAULT NULL,
  `email_indicacao` varchar(145) DEFAULT NULL,
  `nome_indicacao` varchar(145) DEFAULT NULL,
  `data_indicacao` datetime DEFAULT NULL,
  `aceitou` varchar(1) NOT NULL DEFAULT 'N' COMMENT 'S ou N',
  `data_aceite` datetime DEFAULT NULL,
  `tipo_indicacao` char(2) NOT NULL COMMENT 'PI - produto interno (seguidores), PE - produto externo (amigos) ou S - site',
  `produto_id` int(11) DEFAULT NULL,
  `texto` varchar(300) DEFAULT NULL,
  `usuario_id_indicacao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=930 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_acao`
--

DROP TABLE IF EXISTS `log_acao`;
CREATE TABLE IF NOT EXISTS `log_acao` (
  `usuario_id` int(11) NOT NULL,
  `texto` varchar(350) NOT NULL,
  `inclusao` datetime NOT NULL,
  `rel_id` int(11) DEFAULT NULL,
  `controller` varchar(25) DEFAULT NULL,
  `nome` varchar(250) DEFAULT NULL,
  KEY `id` (`usuario_id`,`inclusao`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_emails`
--

DROP TABLE IF EXISTS `log_emails`;
CREATE TABLE IF NOT EXISTS `log_emails` (
  `usuario_id` int(11) NOT NULL,
  `log_email` text NOT NULL,
  `envio` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `log_produtos`
--

DROP TABLE IF EXISTS `log_produtos`;
CREATE TABLE IF NOT EXISTS `log_produtos` (
  `usuario_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `campos` varchar(1100) NOT NULL,
  `tipo` varchar(1) NOT NULL COMMENT '1 - inclusao, 2 - alteração, 3 - alteração de foto',
  `marca_id` int(11) DEFAULT NULL,
  `nome` varchar(60) DEFAULT NULL,
  `descricao` varchar(250) DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  `foto` varchar(250) DEFAULT NULL,
  `tag` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lojas`
--

DROP TABLE IF EXISTS `lojas`;
CREATE TABLE IF NOT EXISTS `lojas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `imagem` varchar(60) NOT NULL,
  `link` varchar(250) NOT NULL,
  `inclusao` datetime NOT NULL,
  `descricao` varchar(200) DEFAULT NULL,
  `tipo_loja_id` int(11) NOT NULL,
  `login` varchar(20) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `email` varchar(60) DEFAULT NULL,
  `tem_perfil` char(1) NOT NULL,
  `nickname` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lojas_acessos`
--

DROP TABLE IF EXISTS `lojas_acessos`;
CREATE TABLE IF NOT EXISTS `lojas_acessos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_id` int(11) NOT NULL,
  `loja_id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `data` datetime NOT NULL,
  `ip_click` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `lojas_produtos`
--

DROP TABLE IF EXISTS `lojas_produtos`;
CREATE TABLE IF NOT EXISTS `lojas_produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_id` int(11) NOT NULL,
  `loja_id` int(11) NOT NULL,
  `link` varchar(250) NOT NULL,
  `banner` varchar(100) NOT NULL,
  `inclusao` datetime NOT NULL,
  `nome_produto` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `loja_log`
--

DROP TABLE IF EXISTS `loja_log`;
CREATE TABLE IF NOT EXISTS `loja_log` (
  `loja_id` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `valor_antigo` varchar(150) NOT NULL,
  `data` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `marcas`
--

DROP TABLE IF EXISTS `marcas`;
CREATE TABLE IF NOT EXISTS `marcas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  `imagem` varchar(150) NOT NULL DEFAULT 'default.jpg',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=799 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `marcas_old`
--

DROP TABLE IF EXISTS `marcas_old`;
CREATE TABLE IF NOT EXISTS `marcas_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=489 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `marca_usuarios`
--

DROP TABLE IF EXISTS `marca_usuarios`;
CREATE TABLE IF NOT EXISTS `marca_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marca_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `inclusao` datetime NOT NULL,
  `removeu` datetime DEFAULT NULL,
  `fa` char(1) NOT NULL DEFAULT 'S',
  `info` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `necessaire_comentarios`
--

DROP TABLE IF EXISTS `necessaire_comentarios`;
CREATE TABLE IF NOT EXISTS `necessaire_comentarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `necessaire_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `comentario` text NOT NULL,
  `comentario_id` int(11) DEFAULT NULL,
  `inclusao` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `comentario_id` (`comentario_id`),
  KEY `necessaire_id` (`necessaire_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `necessaire_comentarios_gostar`
--

DROP TABLE IF EXISTS `necessaire_comentarios_gostar`;
CREATE TABLE IF NOT EXISTS `necessaire_comentarios_gostar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `necessaire_id` int(11) NOT NULL,
  `comentario_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `gostei` varchar(1) NOT NULL COMMENT 'S - N',
  `inclusao` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `comentario_id` (`comentario_id`,`usuario_id`),
  KEY `necessaire_id` (`necessaire_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `necessaire_produtos`
--

DROP TABLE IF EXISTS `necessaire_produtos`;
CREATE TABLE IF NOT EXISTS `necessaire_produtos` (
  `necessaire_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  UNIQUE KEY `necessaire_id` (`necessaire_id`,`produto_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `necessaire_tipos`
--

DROP TABLE IF EXISTS `necessaire_tipos`;
CREATE TABLE IF NOT EXISTS `necessaire_tipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `necessaire_usuarios`
--

DROP TABLE IF EXISTS `necessaire_usuarios`;
CREATE TABLE IF NOT EXISTS `necessaire_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `necessaire_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `gostei` varchar(1) NOT NULL COMMENT 'S - N',
  `inclusao` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `necessaire_id` (`necessaire_id`,`gostei`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `necessaries`
--

DROP TABLE IF EXISTS `necessaries`;
CREATE TABLE IF NOT EXISTS `necessaries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `necessaire_tipo_id` int(11) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `imagem_necessaire` varchar(40) NOT NULL,
  `imagem_produtos` varchar(40) NOT NULL,
  `legenda_necessaire` varchar(255) DEFAULT NULL,
  `legenda_produtos` varchar(255) DEFAULT NULL,
  `descricao` text,
  `inclusao` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=38 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `olhos`
--

DROP TABLE IF EXISTS `olhos`;
CREATE TABLE IF NOT EXISTS `olhos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `paises`
--

DROP TABLE IF EXISTS `paises`;
CREATE TABLE IF NOT EXISTS `paises` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pele_caracteristicas`
--

DROP TABLE IF EXISTS `pele_caracteristicas`;
CREATE TABLE IF NOT EXISTS `pele_caracteristicas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pele_tipos`
--

DROP TABLE IF EXISTS `pele_tipos`;
CREATE TABLE IF NOT EXISTS `pele_tipos` (
  `id` varchar(1) NOT NULL DEFAULT 'Z',
  `descricao` varchar(10) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

DROP TABLE IF EXISTS `perfil`;
CREATE TABLE IF NOT EXISTS `perfil` (
  `id` int(11) NOT NULL,
  `cor_cabelo_id` int(11) DEFAULT NULL,
  `etnia_id` int(11) DEFAULT NULL,
  `tipo_cabelo_id` int(11) DEFAULT NULL,
  `olho_id` int(11) DEFAULT NULL,
  `profissao` varchar(45) DEFAULT NULL,
  `especializacao` varchar(60) DEFAULT NULL,
  `altura` varchar(4) DEFAULT NULL COMMENT 'Sempre em cm',
  `peso` int(11) DEFAULT NULL COMMENT 'sempre em Kg',
  `pele` varchar(1) DEFAULT NULL COMMENT 'Dominio:\nB-Branca\nM-Marrom\nA-Amarela\nV-Vermelho\nN-Negra',
  `alergias` varchar(300) DEFAULT NULL,
  `mais` text,
  `rosto_id` int(11) NOT NULL,
  `cabelo_tamanho_id` int(11) NOT NULL,
  `cabelo_caracteristica_id` varchar(20) NOT NULL,
  `cabelo_id` int(11) NOT NULL,
  `pele_caracteristica_id` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_TB_Perfil_TB_Cor_Cabelo1` (`cor_cabelo_id`),
  KEY `fk_TB_Perfil_TB_Etnia1` (`etnia_id`),
  KEY `fk_TB_Perfil_TB_Tipo_Cabelo1` (`tipo_cabelo_id`),
  KEY `fk_TB_Perfil_TB_Usuario1` (`id`),
  KEY `fk_TB_Perfil_TB_Cor_Olho1` (`olho_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pontos_usuarios`
--

DROP TABLE IF EXISTS `pontos_usuarios`;
CREATE TABLE IF NOT EXISTS `pontos_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `inclusao` datetime NOT NULL,
  `promocao_id` int(11) DEFAULT NULL,
  `ponto_acao_id` int(11) NOT NULL,
  `ref_id` int(11) DEFAULT NULL,
  `ponto_extra` int(11) DEFAULT '0',
  `desc_ponto` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=68670 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pontos_usuarios_log`
--

DROP TABLE IF EXISTS `pontos_usuarios_log`;
CREATE TABLE IF NOT EXISTS `pontos_usuarios_log` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `inclusao` datetime NOT NULL,
  `promocao_id` int(11) DEFAULT NULL,
  `ponto_acao_id` int(11) NOT NULL,
  `ref_id` int(11) DEFAULT '0',
  `ponto_extra` int(11) DEFAULT '0',
  `desc_ponto` varchar(100) DEFAULT NULL,
  `inclusao_log` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ponto_acao`
--

DROP TABLE IF EXISTS `ponto_acao`;
CREATE TABLE IF NOT EXISTS `ponto_acao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ponto_grupo_id` int(11) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `ponto` int(11) NOT NULL,
  `peso` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ponto_grupos`
--

DROP TABLE IF EXISTS `ponto_grupos`;
CREATE TABLE IF NOT EXISTS `ponto_grupos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(200) NOT NULL,
  `peso` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `post_produtos`
--

DROP TABLE IF EXISTS `post_produtos`;
CREATE TABLE IF NOT EXISTS `post_produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blog_id` int(11) NOT NULL COMMENT 'id do blog',
  `titulo` varchar(250) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `url` varchar(500) NOT NULL,
  `inclusao` datetime NOT NULL,
  `imagem` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post` (`blog_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=132 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marca_id` int(11) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `nome` varchar(60) NOT NULL,
  `descricao` text NOT NULL,
  `genero` char(1) DEFAULT 'U' COMMENT 'Deve conter uma das seguintes literais:\nU-Unissex\nF-Feminino\nM-Masculino\n',
  `composicao` varchar(245) DEFAULT NULL,
  `foto` varchar(250) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `inclusao` datetime NOT NULL,
  `principio_ativo` varchar(245) NOT NULL COMMENT 'Principios ativos relevantes do Produto',
  `tag` varchar(500) DEFAULT NULL COMMENT 'facilitar a busca',
  `media` float(2,1) NOT NULL,
  `usuarios` int(11) NOT NULL,
  `comentarios` int(11) NOT NULL DEFAULT '0',
  `desejos` int(11) NOT NULL DEFAULT '0' COMMENT 'qtos usuarios desejam este produto',
  `vendas` int(11) NOT NULL DEFAULT '0' COMMENT 'qtos usuarios vendem este produto',
  `alteracao` datetime DEFAULT NULL,
  `produtos` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21021 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_log`
--

DROP TABLE IF EXISTS `produtos_log`;
CREATE TABLE IF NOT EXISTS `produtos_log` (
  `id` int(11) DEFAULT NULL,
  `marca_id` int(11) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `nome` varchar(60) NOT NULL,
  `descricao` text NOT NULL,
  `genero` char(1) DEFAULT 'U' COMMENT 'Deve conter uma das seguintes literais:\nU-Unissex\nF-Feminino\nM-Masculino\n',
  `composicao` varchar(245) DEFAULT NULL,
  `foto` varchar(250) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `inclusao` datetime NOT NULL,
  `principio_ativo` varchar(245) NOT NULL COMMENT 'Principios ativos relevantes do Produto',
  `tag` varchar(500) DEFAULT NULL COMMENT 'facilitar a busca',
  `media` float(2,1) NOT NULL,
  `usuarios` int(11) NOT NULL,
  `comentarios` int(11) NOT NULL DEFAULT '0',
  `desejos` int(11) NOT NULL DEFAULT '0' COMMENT 'qtos usuarios desejam este produto',
  `vendas` int(11) NOT NULL DEFAULT '0' COMMENT 'qtos usuarios vendem este produto',
  `alteracao` datetime DEFAULT NULL,
  `produtos` datetime DEFAULT NULL,
  `inclusao_log` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_monitorados`
--

DROP TABLE IF EXISTS `produtos_monitorados`;
CREATE TABLE IF NOT EXISTS `produtos_monitorados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `dt_cadastro` datetime NOT NULL,
  `cad_ok` varchar(1) NOT NULL DEFAULT 'N',
  `analisado` varchar(1) NOT NULL DEFAULT 'N',
  `dt_analise` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=67 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_old`
--

DROP TABLE IF EXISTS `produtos_old`;
CREATE TABLE IF NOT EXISTS `produtos_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `marca_id` int(11) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `nome` varchar(120) NOT NULL,
  `descricao` text,
  `genero` char(1) DEFAULT 'U' COMMENT 'Deve conter uma das seguintes literais:\nU-Unissex\nF-Feminino\nM-Masculino\n',
  `composicao` varchar(250) DEFAULT NULL,
  `foto` varchar(250) DEFAULT NULL,
  `usuario_id` int(11) NOT NULL,
  `inclusao` datetime NOT NULL,
  `principio_ativo` varchar(60) DEFAULT NULL COMMENT 'Principios ativos relevantes do Produto',
  `tag` varchar(500) DEFAULT NULL COMMENT 'facilitar a busca',
  `site` varchar(250) DEFAULT NULL COMMENT 'site do fabricante',
  `media` float(2,1) NOT NULL,
  `usuarios` int(11) NOT NULL,
  `comentarios` int(11) NOT NULL DEFAULT '0',
  `desejos` int(11) NOT NULL DEFAULT '0',
  `vendas` int(11) NOT NULL DEFAULT '0',
  `alteracao` datetime DEFAULT NULL,
  `produtos` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_TB_Produto_TB_Marca` (`marca_id`),
  KEY `fk_TB_Produto_TB_Usuario1` (`usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Tabela de Produto' AUTO_INCREMENT=6385 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_tags_gerais`
--

DROP TABLE IF EXISTS `produtos_tags_gerais`;
CREATE TABLE IF NOT EXISTS `produtos_tags_gerais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_id` int(11) NOT NULL,
  `tag_geral_id` int(11) NOT NULL,
  `inclusao` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=46895 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_tags_principais`
--

DROP TABLE IF EXISTS `produtos_tags_principais`;
CREATE TABLE IF NOT EXISTS `produtos_tags_principais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_id` int(11) NOT NULL,
  `tag_principal_id` int(11) NOT NULL,
  `inclusao` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51007 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_usuarios`
--

DROP TABLE IF EXISTS `produtos_usuarios`;
CREATE TABLE IF NOT EXISTS `produtos_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `Nota` int(1) unsigned zerofill DEFAULT '0' COMMENT '0-5',
  `favorito` int(1) DEFAULT '0' COMMENT '0-não 1-sim',
  `comentado` int(1) DEFAULT '0' COMMENT '0-não 1-sim',
  `usando` int(1) DEFAULT '0' COMMENT '0-não 1-sim',
  `desejo` int(1) DEFAULT '0' COMMENT '0-não 1-sim',
  `pretendo_usar` int(1) DEFAULT '0' COMMENT '0-não 1-sim',
  `abandonei` int(1) NOT NULL DEFAULT '0' COMMENT '0-não 1-sim',
  `avaliado` int(1) NOT NULL DEFAULT '0' COMMENT '0-não 1-sim',
  `revende` varchar(1) NOT NULL DEFAULT 'N',
  `preco` decimal(7,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12343 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_usuarios_old`
--

DROP TABLE IF EXISTS `produtos_usuarios_old`;
CREATE TABLE IF NOT EXISTS `produtos_usuarios_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `Nota` int(1) unsigned zerofill DEFAULT '0' COMMENT '0-5',
  `favorito` int(1) DEFAULT '0' COMMENT '0-não 1-sim',
  `comentado` int(1) DEFAULT '0' COMMENT '0-não\n1-sim\n',
  `usando` int(1) DEFAULT '0' COMMENT '0-não 1-sim',
  `desejo` int(1) DEFAULT '0' COMMENT '0-não 1-sim',
  `pretendo_usar` int(1) DEFAULT '0' COMMENT '0-não 1-sim',
  `abandonei` int(1) NOT NULL DEFAULT '0' COMMENT '0-não 1-sim',
  `avaliado` int(1) NOT NULL DEFAULT '0' COMMENT '0-não 1-sim',
  `revende` varchar(1) NOT NULL DEFAULT 'N',
  `preco` decimal(7,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `fk_TB_Produto_has_TB_Usuario_TB_Produto1` (`produto_id`),
  KEY `fk_TB_Produto_has_TB_Usuario_TB_Usuario1` (`usuario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1463 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_busca`
--

DROP TABLE IF EXISTS `produto_busca`;
CREATE TABLE IF NOT EXISTS `produto_busca` (
  `ref_id` int(11) NOT NULL,
  `nome_produto` varchar(60) NOT NULL,
  `inclusao` datetime NOT NULL,
  `nome_marca` varchar(45) NOT NULL,
  `marca_id` int(11) NOT NULL,
  `nome_usuario` varchar(145) NOT NULL,
  `foto_usuario` varchar(250) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `foto_produto` varchar(250) NOT NULL,
  `tag` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`ref_id`),
  KEY `ref_id` (`ref_id`),
  FULLTEXT KEY `nome_busca_fast` (`nome_produto`),
  FULLTEXT KEY `nome_produto` (`nome_produto`,`nome_marca`),
  FULLTEXT KEY `idx_tag` (`tag`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `promocao`
--

DROP TABLE IF EXISTS `promocao`;
CREATE TABLE IF NOT EXISTS `promocao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(150) NOT NULL,
  `inicio` datetime NOT NULL,
  `fim` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `recados`
--

DROP TABLE IF EXISTS `recados`;
CREATE TABLE IF NOT EXISTS `recados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `remetente_id` int(11) NOT NULL,
  `destinatario_id` int(11) NOT NULL,
  `recado` varchar(3000) NOT NULL,
  `inclusao` datetime NOT NULL,
  `privado` varchar(1) NOT NULL DEFAULT 'N',
  `lido` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `fk_TB_Recado_TB_Usuario1` (`remetente_id`),
  KEY `fk_TB_Recado_TB_Usuario2` (`destinatario_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1399 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `redes`
--

DROP TABLE IF EXISTS `redes`;
CREATE TABLE IF NOT EXISTS `redes` (
  `id` int(11) NOT NULL,
  `msn` varchar(150) DEFAULT NULL,
  `myspace` varchar(150) DEFAULT NULL,
  `facebook` varchar(150) DEFAULT NULL,
  `icq` varchar(150) DEFAULT NULL,
  `orkut` varchar(150) DEFAULT NULL,
  `twitter` varchar(150) DEFAULT NULL,
  `gtalk` varchar(150) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_redes_usuarios1` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `rostos`
--

DROP TABLE IF EXISTS `rostos`;
CREATE TABLE IF NOT EXISTS `rostos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `seguir_produtos`
--

DROP TABLE IF EXISTS `seguir_produtos`;
CREATE TABLE IF NOT EXISTS `seguir_produtos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `inclusao` datetime NOT NULL,
  `exclusao` datetime DEFAULT NULL,
  `seguir` char(1) NOT NULL DEFAULT 'S',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=316 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tags_gerais`
--

DROP TABLE IF EXISTS `tags_gerais`;
CREATE TABLE IF NOT EXISTS `tags_gerais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(150) NOT NULL,
  `inclusao` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5138 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tags_principais`
--

DROP TABLE IF EXISTS `tags_principais`;
CREATE TABLE IF NOT EXISTS `tags_principais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(25) NOT NULL,
  `tag_grupo_id` int(11) DEFAULT NULL COMMENT 'Pode ser usado para criar grupos de tags (mesmo segmento)',
  `ordem` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_cabelos`
--

DROP TABLE IF EXISTS `tipo_cabelos`;
CREATE TABLE IF NOT EXISTS `tipo_cabelos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tipo_lojas`
--

DROP TABLE IF EXISTS `tipo_lojas`;
CREATE TABLE IF NOT EXISTS `tipo_lojas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(35) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `twitters`
--

DROP TABLE IF EXISTS `twitters`;
CREATE TABLE IF NOT EXISTS `twitters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `twitt` varchar(140) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3818 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `twitter_acessos`
--

DROP TABLE IF EXISTS `twitter_acessos`;
CREATE TABLE IF NOT EXISTS `twitter_acessos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `key` varchar(60) NOT NULL,
  `secret` varchar(60) NOT NULL,
  `inclusao` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(145) NOT NULL,
  `nascimento` datetime NOT NULL,
  `apelido` varchar(17) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `foto` varchar(250) DEFAULT NULL,
  `nome` varchar(145) NOT NULL,
  `nivel` int(2) unsigned zerofill DEFAULT '00',
  `genero` varchar(1) DEFAULT NULL COMMENT 'Feminino, Masculino',
  `inclusao` datetime DEFAULT NULL,
  `sabendo` varchar(45) DEFAULT NULL,
  `news` varchar(1) NOT NULL DEFAULT 'N',
  `ultimo_acesso` datetime DEFAULT NULL,
  `revendedor` varchar(1) NOT NULL DEFAULT 'N',
  `confirmado` varchar(1) NOT NULL DEFAULT 'N',
  `admin` char(1) NOT NULL DEFAULT 'N',
  `bloqueado` varchar(1) NOT NULL DEFAULT 'N',
  `cadastro_bloqueado` varchar(1) NOT NULL DEFAULT 'N' COMMENT 'Bloqueia o cadastro de produtos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE_EMAIL` (`email`),
  UNIQUE KEY `UNIQUE_APELIDO` (`apelido`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1070 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_promocao`
--

DROP TABLE IF EXISTS `usuario_promocao`;
CREATE TABLE IF NOT EXISTS `usuario_promocao` (
  `usuario_id` int(11) NOT NULL,
  `promocao_id` int(11) NOT NULL,
  `aceito` varchar(1) NOT NULL,
  `inclusao` datetime NOT NULL,
  `id_promocional` int(11) NOT NULL AUTO_INCREMENT,
  KEY `id_promocional` (`id_promocional`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=143 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_status`
--

DROP TABLE IF EXISTS `usuario_status`;
CREATE TABLE IF NOT EXISTS `usuario_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagem` varchar(250) NOT NULL,
  `pontos` int(11) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `widgets`
--

DROP TABLE IF EXISTS `widgets`;
CREATE TABLE IF NOT EXISTS `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `tipo` varchar(3) NOT NULL,
  `linhas` int(11) NOT NULL,
  `colunas` int(11) NOT NULL,
  `estilo` varchar(15) DEFAULT NULL,
  `path` varchar(150) DEFAULT NULL,
  `inclusao` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=60 ;

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `cidades`
--
ALTER TABLE `cidades`
  ADD CONSTRAINT `fk_TB_Cidade_TB_Estado1` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `comentarios_old`
--
ALTER TABLE `comentarios_old`
  ADD CONSTRAINT `fk_TB_Comentario_TB_Produto1` FOREIGN KEY (`produto_id`) REFERENCES `produtos_old` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TB_Comentario_TB_Usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `desejos`
--
ALTER TABLE `desejos`
  ADD CONSTRAINT `fk_TB_Lista_Desejos_TB_Produto1` FOREIGN KEY (`produto_id`) REFERENCES `produtos_old` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TB_Lista_Desejos_TB_Usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `enderecos`
--
ALTER TABLE `enderecos`
  ADD CONSTRAINT `fk_TB_Usuario_Complemento_TB_Estado1` FOREIGN KEY (`estado_id`) REFERENCES `estados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TB_Usuario_Complemento_TB_Pais1` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TB_Usuario_Complemento_TB_Usuario1` FOREIGN KEY (`id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `estados`
--
ALTER TABLE `estados`
  ADD CONSTRAINT `fk_TB_Estado_TB_Pais1` FOREIGN KEY (`pais_id`) REFERENCES `paises` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `perfil`
--
ALTER TABLE `perfil`
  ADD CONSTRAINT `fk_TB_Perfil_TB_Cor_Cabelo1` FOREIGN KEY (`cor_cabelo_id`) REFERENCES `cor_cabelos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TB_Perfil_TB_Cor_Olho1` FOREIGN KEY (`olho_id`) REFERENCES `olhos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TB_Perfil_TB_Etnia1` FOREIGN KEY (`etnia_id`) REFERENCES `etnias` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TB_Perfil_TB_Tipo_Cabelo1` FOREIGN KEY (`tipo_cabelo_id`) REFERENCES `tipo_cabelos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TB_Perfil_TB_Usuario1` FOREIGN KEY (`id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `produtos_old`
--
ALTER TABLE `produtos_old`
  ADD CONSTRAINT `fk_TB_Produto_TB_Marca` FOREIGN KEY (`marca_id`) REFERENCES `marcas_old` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TB_Produto_TB_Usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `produtos_usuarios_old`
--
ALTER TABLE `produtos_usuarios_old`
  ADD CONSTRAINT `fk_TB_Produto_has_TB_Usuario_TB_Produto1` FOREIGN KEY (`produto_id`) REFERENCES `produtos_old` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TB_Produto_has_TB_Usuario_TB_Usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `recados`
--
ALTER TABLE `recados`
  ADD CONSTRAINT `fk_TB_Recado_TB_Usuario1` FOREIGN KEY (`remetente_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TB_Recado_TB_Usuario2` FOREIGN KEY (`destinatario_id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para a tabela `redes`
--
ALTER TABLE `redes`
  ADD CONSTRAINT `fk_redes_usuarios1` FOREIGN KEY (`id`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
