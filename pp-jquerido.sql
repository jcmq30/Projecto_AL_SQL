-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: database
-- Tempo de geração: 25-Fev-2026
-- Versão do servidor: 12.2.2-MariaDB-ubu2404
-- versão do PHP: 8.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de dados: `pp-jquerido`
--
CREATE DATABASE IF NOT EXISTS `pp-jquerido` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `pp-jquerido`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Clientes`
--

CREATE TABLE `Clientes` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `Clientes`
--

INSERT INTO `Clientes` (`id_cliente`, `nome`, `email`, `telefone`) VALUES
(1, 'João Silva', 'joao.silva@email.com', '912345678'),
(2, 'Maria Costa', 'maria.costa@email.com', '913456789'),
(3, 'Pedro Martins', 'pedro.martins@email.com', '914567890'),
(4, 'Ana Ferreira', 'ana.ferreira@email.com', '915678901');

-- --------------------------------------------------------

--
-- Estrutura da tabela `Quartos`
--

CREATE TABLE `Quartos` (
  `id_quarto` int(11) NOT NULL,
  `numero` int(11) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `preco_noite` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `Quartos`
--

INSERT INTO `Quartos` (`id_quarto`, `numero`, `tipo`, `preco_noite`) VALUES
(1, 101, 'Individual', 60.00),
(2, 102, 'Duplo', 90.00),
(3, 201, 'Suite', 150.00);

-- --------------------------------------------------------

--
-- Estrutura da tabela `Reservas`
--

CREATE TABLE `Reservas` (
  `id_reserva` int(11) NOT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `id_quarto` int(11) DEFAULT NULL,
  `data_checkin` date DEFAULT NULL,
  `data_checkout` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `Reservas`
--

INSERT INTO `Reservas` (`id_reserva`, `id_cliente`, `id_quarto`, `data_checkin`, `data_checkout`) VALUES
(1, 1, 1, '2026-03-10', '2026-03-12'),
(2, 2, 2, '2026-03-11', '2026-03-14'),
(3, 3, 3, '2026-03-15', '2026-03-18'),
(4, 4, 1, '2026-03-20', '2026-03-22');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `Clientes`
--
ALTER TABLE `Clientes`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Índices para tabela `Quartos`
--
ALTER TABLE `Quartos`
  ADD PRIMARY KEY (`id_quarto`);

--
-- Índices para tabela `Reservas`
--
ALTER TABLE `Reservas`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_quarto` (`id_quarto`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `Clientes`
--
ALTER TABLE `Clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `Quartos`
--
ALTER TABLE `Quartos`
  MODIFY `id_quarto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `Reservas`
--
ALTER TABLE `Reservas`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `Reservas`
--
ALTER TABLE `Reservas`
  ADD CONSTRAINT `1` FOREIGN KEY (`id_cliente`) REFERENCES `Clientes` (`id_cliente`),
  ADD CONSTRAINT `2` FOREIGN KEY (`id_quarto`) REFERENCES `Quartos` (`id_quarto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
