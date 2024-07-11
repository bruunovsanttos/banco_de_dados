-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: mariadb-178069-db.mariadb-178069:10120
-- Tempo de geração: 11-Jul-2024 às 15:46
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
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL COMMENT 'nome do destino',
  `descricao` varchar(255) NOT NULL COMMENT 'DEscricao destino'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `destinos`
--

INSERT INTO `destinos` (`id`, `nome`, `descricao`) VALUES
(1, 'Praia Grande', 'Praia do Povo'),
(2, 'Praia das Tartarugas', 'Uma bela praia com areias brancas e mar cristalino'),
(3, 'Cachoeira do Vale Verde', 'Uma cachoeira exuberante cercada por natureza'),
(4, 'Cidade Histórica de Pedra Alta', 'Uma cidade rica em história e arquitetura');

-- --------------------------------------------------------

--
-- Estrutura da tabela `reservas`
--

CREATE TABLE `reservas` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL COMMENT 'referencia do id do usuario que fez a reserva',
  `id_destino` int(11) DEFAULT NULL COMMENT 'referencia do id do destino da reserva',
  `data` date DEFAULT NULL COMMENT 'data da reserva',
  `status` varchar(255) DEFAULT 'pendente' COMMENT 'satatus da reserva (confirmada, pendente,cancelada, etc)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `reservas`
--

INSERT INTO `reservas` (`id`, `id_usuario`, `id_destino`, `data`, `status`) VALUES
(1, 3, NULL, '2024-11-11', 'pendente'),
(2, 1, NULL, '2024-11-11', 'pendente'),
(3, 3, NULL, '2024-11-11', 'pendente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL COMMENT 'nome do usuario',
  `email` varchar(100) NOT NULL COMMENT 'email do usuario',
  `endereco` varchar(150) DEFAULT NULL,
  `data_nascimento` date NOT NULL COMMENT 'Data Nascimento do usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `endereco`, `data_nascimento`) VALUES
(1, 'Bruno Santos', 'teste@teste.com', 'Av Novo Horizonte, 406 - Sacadura Santo André/SP', '1992-10-09'),
(2, 'João Silva', 'joao@example.com', 'Rua A, 123, Cidade X, Estado Y', '1990-05-15'),
(3, 'Maria Santos', 'maria@example.com', 'Rua B, 456, Cidade Y, Estado Z', '1985-08-22'),
(4, 'Pedro Souza', 'pedro@example.com', 'Avenida C, 789, Cidade X, Estado Y', '1998-02-10');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `destinos`
--
ALTER TABLE `destinos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Índices para tabela `reservas`
--
ALTER TABLE `reservas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_reservas_usuarios` (`id_usuario`),
  ADD KEY `fk_reservas_destinos` (`id_destino`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `destinos`
--
ALTER TABLE `destinos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `reservas`
--
ALTER TABLE `reservas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `fk_reservas_destinos` FOREIGN KEY (`id_destino`) REFERENCES `destinos` (`id`),
  ADD CONSTRAINT `fk_reservas_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
