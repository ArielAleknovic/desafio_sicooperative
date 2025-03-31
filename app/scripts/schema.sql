DROP SCHEMA IF EXISTS sicoperative CASCADE;
CREATE SCHEMA IF NOT EXISTS sicoperative;

CREATE TABLE IF NOT EXISTS sicoperative.associado (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100),
  sobrenome VARCHAR(100),
  idade INT,
  email VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS sicoperative.conta (
  id SERIAL PRIMARY KEY,
  tipo VARCHAR(50),
  data_criacao TIMESTAMP,
  id_associado INT,
  FOREIGN KEY (id_associado) REFERENCES sicoperative.associado (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS sicoperative.cartao (
  id SERIAL PRIMARY KEY,
  num_cartao INT,
  nome_impresso VARCHAR(255),
  id_conta INT,
  id_associado INT,
  FOREIGN KEY (id_conta) REFERENCES sicoperative.conta (id) ON DELETE CASCADE,
  FOREIGN KEY (id_associado) REFERENCES sicoperative.associado (id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS sicoperative.movimento (
  id SERIAL PRIMARY KEY,
  vlr_transacao DECIMAL(10,2),
  desc_transacao VARCHAR(255),
  data_movimento TIMESTAMP,
  id_cartao INT,
  FOREIGN KEY (id_cartao) REFERENCES sicoperative.cartao (id) ON DELETE CASCADE
);
