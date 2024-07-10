-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: mariadb-178069-db.mariadb-178069:10120
-- Tempo de geração: 10-Jul-2024 às 15:43
-- Versão do servidor: 11.1.2-MariaDB-1:11.1.2+maria~ubu2004
-- versão do PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `Viagens`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `destinos`
--

CREATE TABLE `destinos` (
  `id` int(11) DEFAULT NULL,
  `nome` varchar(255) NOT NULL COMMENT 'nome do destino',
  `descricao` varchar(255) NOT NULL COMMENT 'DEscricao destino'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `destinos`
--

INSERT INTO `destinos` (`id`, `nome`, `descricao`) VALUES
(3, 'Cachoeira do Vale Verde', 'Uma cachoeira exuberante cercada por natureza'),
(4, 'Cidade Histórica de Pedra Alta', 'Uma cidade rica em história e arquitetura'),
(2, 'Praia das Tartarugas', 'Uma bela praia com areias brancas e mar cristalino'),
(1, 'Praia Grande', 'Praia do Povo');

-- --------------------------------------------------------

--
-- Estrutura da tabela `reservas`
--

CREATE TABLE `reservas` (
  `id` int(11) DEFAULT NULL COMMENT 'identificador unico de reserva',
  `id_usuario` int(11) DEFAULT NULL COMMENT 'referencia do id do usuario que fez a reserva',
  `id_destino` int(11) DEFAULT NULL COMMENT 'referencia do id do destino da reserva',
  `data` date DEFAULT NULL COMMENT 'data da reserva',
  `status` varchar(255) DEFAULT 'pendente' COMMENT 'satatus da reserva (confirmada, pendente,cancelada, etc)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `reservas`
--

INSERT INTO `reservas` (`id`, `id_usuario`, `id_destino`, `data`, `status`) VALUES
(1, 1, 1, '2023-11-11', 'pendente'),
(2, 3, 2, '2023-07-10', 'confirmada'),
(2, 2, 1, '2023-08-05', 'pendente'),
(3, 3, 3, '2023-09-20', 'cancelada');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) DEFAULT NULL,
  `nome` varchar(255) NOT NULL COMMENT 'nome do usuario',
  `email` varchar(100) NOT NULL COMMENT 'email do usuario',
  `endereco` varchar(150) DEFAULT NULL,
  `data_nascimento` date NOT NULL COMMENT 'Data Nascimento do usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `endereco`, `data_nascimento`) VALUES
(2, 'João Silva', 'joao@example.com', 'Rua A, 123, Cidade X, Estado Y', '1990-05-15'),
(3, 'Maria Santos', 'maria@example.com', 'Rua B, 456, Cidade Y, Estado Z', '1985-08-22'),
(4, 'Pedro Souza', 'pedro@example.com', 'Avenida C, 789, Cidade X, Estado Y', '1998-02-10'),
(1, 'Bruno Santos', 'teste@teste.com', 'Av Novo Horizonte, 406 - Sacadura Santo André/SP', '1992-10-09');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `destinos`
--
ALTER TABLE `destinos`
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD UNIQUE KEY `email` (`email`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
