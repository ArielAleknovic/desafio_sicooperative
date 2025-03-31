INSERT INTO sicoperative.associado (nome, sobrenome, idade, email)
VALUES
    ('João', 'Silva', 30, 'joao.silva@gmail.com'),
    ('Maria', 'Oliveira', 28, 'maria.oliveira@gmail.com'),
    ('Pedro', 'Santos', 35, 'pedro.santos@gmail.com'),
    ('Ana', 'Souza', 32, 'ana.souza@gmail.com'),
    ('Carlos', 'Mendes', 40, 'carlos.mendes@gmail.com'),
    ('Fernanda', 'Costa', 25, 'fernanda.costa@gmail.com'),
    ('Ricardo', 'Pereira', 50, 'ricardo.pereira@gmail.com'),
    ('Patricia', 'Martins', 38, 'patricia.martins@gmail.com'),
    ('Lucas', 'Almeida', 27, 'lucas.almeida@gmail.com'),
    ('Juliana', 'Ferreira', 33, 'juliana.ferreira@gmail.com');

INSERT INTO sicoperative.conta (tipo, data_criacao, id_associado)
VALUES
    ('corrente', '2021-01-15', 1),
    ('poupanca', '2019-03-22', 2),
    ('corrente', '2020-05-10', 3),
    ('poupanca', '2018-11-25', 4),
    ('corrente', '2022-02-28', 5),
    ('poupanca', '2017-07-18', 6),
    ('corrente', '2021-08-09', 7),
    ('poupanca', '2016-09-14', 8),
    ('corrente', '2019-12-04', 9),
    ('poupanca', '2020-06-13', 10);

INSERT INTO sicoperative.cartao (num_cartao, nome_impresso, id_conta, id_associado)
VALUES
    (12345678, 'João Silva', 1, 1),
    (23456789, 'Maria Oliveira', 2, 2),
    (34567890, 'Pedro Santos', 3, 3),
    (45678901, 'Ana Souza', 4, 4),
    (56789012, 'Carlos Mendes', 5, 5),
    (67890123, 'Fernanda Costa', 6, 6),
    (78901234, 'Ricardo Pereira', 7, 7),
    (89012345, 'Patricia Martins', 8, 8),
    (90123456, 'Lucas Almeida', 9, 9),
    (12345678, 'Juliana Ferreira', 10, 10);

INSERT INTO sicoperative.movimento (vlr_transacao, desc_transacao, data_movimento, id_cartao)
VALUES
    (200.50, 'Compra no supermercado', '2025-02-10', 1),
    (150.75, 'Pagamento de serviços', '2025-01-23', 2),
    (500.00, 'Compra de eletrônicos', '2024-03-15', 3),
    (320.10, 'Pagamento de contas', '2024-02-28', 4),
    (120.00, 'Compra de roupas', '2023-04-05', 5),
    (230.25, 'Compra no restaurante', '2023-03-20', 6),
    (800.00, 'Pagamento de aluguel', '2023-02-18', 7),
    (150.90, 'Compra de medicamentos', '2023-01-30', 8),
    (450.00, 'Compra online', '2023-03-08', 9),
    (350.60, 'Pagamento de serviços', '2023-04-01', 10),
    (100.00, 'Pagamento de contas', '2023-03-25', 1),
    (220.00, 'Compra no supermercado', '2023-01-10', 2),
    (300.00, 'Pagamento de eletrônicos', '2023-02-20', 3),
    (150.00, 'Compra de roupas', '2023-04-01', 4),
    (500.50, 'Pagamento de contas', '2023-03-30', 5),
    (400.00, 'Compra de brinquedos', '2023-02-15', 6),
    (600.00, 'Compra de móveis', '2023-03-12', 7),
    (180.90, 'Compra no restaurante', '2023-01-28', 8),
    (250.50, 'Compra de roupas', '2023-04-10', 9),
    (300.00, 'Compra online', '2023-02-05', 10);
