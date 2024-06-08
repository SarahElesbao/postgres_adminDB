INSERT INTO contrato (tipo, dataCriacao, infoAdicionais, valor, prazoPagamento, obrigacoes, cnpj, executor)
VALUES
('fornecedora', '2024-05-17', 'Contrato de fornecimento de materiais', 10000.00, '2024-06-17', 'Entrega dentro do prazo', '12.345.678/0001-00', true),
('prestadora', '2024-05-18', 'Contrato de prestação de serviços', 5000.00, '2024-06-18', 'Manutenção mensal', '23.456.789/0001-00', false),
('contratacao', '2024-05-19', 'Contrato de contratação de pessoal', 8000.00, '2024-06-19', 'Treinamento incluso', NULL, true),
('fornecedora', '2024-05-20', 'Contrato de fornecimento de equipamentos', 15000.00, '2024-06-20', 'Entrega em perfeito estado', '45.678.901/0001-00', true),
('prestadora', '2024-05-21', 'Contrato de consultoria', 7000.00, '2024-06-21', 'Consultoria mensal', '56.789.012/0001-00', false),
('contratacao', '2024-05-22', 'Contrato de contratação de serviços temporários', 9000.00, '2024-06-22', 'Serviços de limpeza', NULL, true),
('contratacao', '2024-05-23', 'Contrato de contratação de pessoal', 12000.00, '2024-06-23', 'Serviços de segurança', NULL, false),
('contratacao', '2024-05-24', 'Contrato de contratação adicional', 11000.00, '2024-06-24', 'Serviços administrativos', NULL, true),
('contratacao', '2024-05-25', 'Contrato de contratação adicional', 11500.00, '2024-06-25', 'Serviços financeiros', NULL, true);


INSERT INTO funcionario (cargo, cpf, departamento, dataContratacao, endereco, ctps, oab, contratoId)
VALUES
('Gerente', '123.456.789-00', 'Administração', '2024-01-01', 'Barra da Tijuca, Avenida das Américas', '22795-007', NULL, 3),
('Advogado', '234.567.890-00', 'Jurídico', '2024-02-01', 'Centro, 21456-369, 3, Presidente Vargas', '234567', 'OAB123456', 6),
('Assistente', '345.678.901-00', 'Financeiro', '2024-03-01', 'Tijuca, 13489-500, 49, Rua das Flores', '345678', NULL, 7),
('Advogado', '456.789.012-34', 'Jurídico', '2024-03-01', 'Leblon, 22450-200, 32, Rua General San Martin', '456789', 'OAB234567', 8),
('Advogado', '567.890.123-45', 'Jurídico', '2024-04-01', 'Ipanema, 22430-020, 12, Rua Vinicius de Moraes', '567890', 'OAB345678', 9);


INSERT INTO processo (dataAbertura, numero, tipo, descricao, autor)
VALUES
('2024-04-01', '2024TR0001', 'trabalhista', 'Processo trabalhista de demissão', true),
('2024-04-02', '2024CV0002', 'civil', 'Ação civil de danos materiais', false),
('2024-04-03', '2024CN0003', 'consumerista', 'Reclamação de consumidor', true),
('2024-04-04', '2024TR0004', 'trabalhista', 'Processo de rescisão de contrato', true),
('2024-04-05', '2024CV0005', 'civil', 'Ação de cobrança', false),
('2024-04-06', '2024CN0006', 'consumerista', 'Reclamação de produto defeituoso', true),
('2024-04-07', '2024CO0007', 'cobrança', 'Cobrança de dívida', false),
('2024-04-08', '2024TR0008', 'tributário', 'Contestação de tributo', true);


INSERT INTO advogado_processo (advogadoId, processoId)
VALUES
(2, 1),
(2, 2),
(2, 3),
(3, 4),
(3, 5),
(4, 6),
(4, 7),
(4, 8);

INSERT INTO historico_honorario (dataDefinicao, valor, observacao, processoId)
VALUES
('2024-05-01', 3000.00, 'Honorário inicial', 1),
('2024-05-02', 2000.00, 'Honorário adicional', 2),
('2024-05-03', 2500.00, 'Honorário final', 3),
('2024-05-04', 3500.00, 'Honorário adicional', 4),
('2024-05-05', 2200.00, 'Honorário inicial', 5),
('2024-05-06', 2700.00, 'Honorário final', 6),
('2024-05-07', 3100.00, 'Honorário especial', 7),
('2024-05-08', 2900.00, 'Honorário regular', 8);


INSERT INTO movimento_processual (dataHora, fase, processoId)
VALUES
('2024-05-01', 'citação', 1),
('2024-05-02', 'resposta do réu', 2),
('2024-05-03', 'instrução', 3),
('2024-05-04', 'citação', 4),
('2024-05-05', 'resposta do réu', 5),
('2024-05-06', 'instrução', 6),
('2024-05-07', 'sentença', 7),
('2024-05-08', 'cumprimento sentença', 8),
('2024-05-09', 'cumprimento sentença', 1),
('2024-05-10', 'cumprimento sentença', 2);


INSERT INTO parte_envolvida (cpf, cnpj, email, endereco, processoId)
VALUES
('456.789.012-34', NULL, 'juristorres@gmail.com', 'Recreio dos Bandeirantes, 22795-185, 45, Rua Santa Bárbara', 1),
(NULL, '23.456.789/0002-00', 'amandiejuris@gmail.com', 'Campo Grande, 23061-586, 178, Praça Geraldo José Rodrigues', 2),
('678.901.234-56', NULL, 'anasahjuri@gmail.com', 'Taquara, 22723-613, 67, Praça Sagitário', 3),
('789.012.345-67', NULL, 'fernandolegal@gmail.com', 'Botafogo, 22290-030, 123, Rua Voluntários da Pátria', 4),
(NULL, '45.678.901/0002-00', 'jurisfreitas@gmail.com', 'Flamengo, 22230-030, 456, Rua Senador Vergueiro', 5),
('890.123.456-78', NULL, 'marialegal@gmail.com', 'Leme, 22010-030, 789, Avenida Atlântica', 6),
(NULL, '56.789.012/0002-00', 'jurisrodrigues@gmail.com', 'Urca, 22290-030, 101, Avenida Portugal', 7),
('901.234.567-89', NULL, 'legalsergio@gmail.com', 'Gávea, 22451-000, 202, Rua Marquês de São Vicente', 8);


INSERT INTO documento (numero, dataEmissao, tipo, responsavel, departamento, cliente, processoId)
VALUES
(1, '2024-05-10', 'Relatório', 'Ana Paula', 'Financeiro', 'Carlos Silva', 1),
(2, '2024-05-11', 'Parecer', 'João Carlos', 'Jurídico', 'Fernando Lima', 2),
(3, '2024-05-12', 'Laudo', 'Mariana Santos', 'Administração', 'Rita Oliveira', 3),
(4, '2024-05-13', 'Certidão', 'Roberto Souza', 'Jurídico', 'Lucas Andrade', 4),
(5, '2024-05-14', 'Relatório', 'Patrícia Gomes', 'Financeiro', 'João Pereira', 5),
(6, '2024-05-15', 'Parecer', 'Clara Nunes', 'Jurídico', 'Carlos Silva', 6),
(7, '2024-05-16', 'Laudo', 'Lucas Andrade', 'Financeiro', 'Paula Santos', 7),
(8, '2024-05-17', 'Relatório', 'João Pereira', 'Administração', 'Rita Oliveira', 8);


INSERT INTO audiencia (data, hora, observacoes, resultado, endereco, processoId)
VALUES
('2024-06-01', '10:00', 'Primeira audiência', 'Favorável', 'Fórum Lírio da Justiça', 1),
('2024-06-02', '11:00', 'Segunda audiência', 'Desfavorável', 'Fórum Legalidade Certa', 2),
('2024-06-03', '12:00', 'Terceira audiência', 'Adiada', 'Fórum Sol da Liberdade', 3),
('2024-06-04', '13:00', 'Quarta audiência', 'Favorável', 'Fórum Justiça Plena', 4),
('2024-06-05', '14:00', 'Quinta audiência', 'Desfavorável', 'Fórum Paz e Justiça', 5),
('2024-06-06', '15:00', 'Sexta audiência', 'Adiada', 'Fórum Luz da Esperança', 6),
('2024-06-07', '16:00', 'Sétima audiência', 'Favorável', 'Fórum Justiça Real', 7),
('2024-06-08', '17:00', 'Oitava audiência', 'Desfavorável', 'Fórum Justiça e Ordem', 8);


INSERT INTO chamado_interno (dataAbertura, status, descricao, dataEncerramento, advogadoId, funcionarioId)
VALUES
('2024-05-01', 'aberto', 'Chamado para revisão de contrato', NULL, 2, 1),
('2024-05-02', 'em andamento', 'Chamado para consulta jurídica', NULL, 2, 3),
('2024-05-03', 'fechado', 'Chamado para análise de processo', '2024-05-10', 2, 2),
('2024-05-04', 'aberto', 'Chamado para revisão contratual', NULL, 3, 1),
('2024-05-05', 'em andamento', 'Chamado para consulta sobre tributos', NULL, 3, 2),
('2024-05-06', 'fechado', 'Chamado para análise de caso trabalhista', '2024-05-11', 4, 3),
('2024-05-07', 'aberto', 'Chamado para revisão de documento', NULL, 4, 1),
('2024-05-08', 'em andamento', 'Chamado para elaboração de petição', NULL, 4, 2);


INSERT INTO alvara (numero, dataEmissao, dataValidade, valor, audienciaId)
VALUES
(1, '2024-06-01', '2024-12-01', 1500.00, 1),
(2, '2024-06-02', '2024-12-02', 2000.00, 2),
(3, '2024-06-03', '2024-12-03', 2500.00, 3),
(4, '2024-06-04', '2024-12-04', 3000.00, 4),
(5, '2024-06-05', '2024-12-05', 3500.00, 5),
(6, '2024-06-06', '2024-12-06', 4000.00, 6),
(7, '2024-06-07', '2024-12-07', 4500.00, 7),
(8, '2024-06-08', '2024-12-08', 5000.00, 8);