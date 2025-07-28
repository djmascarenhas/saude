-- Tabela de log de acessos
CREATE TABLE IF NOT EXISTS log_consultas (
  id SERIAL PRIMARY KEY,
  usuario TEXT,
  tabela TEXT,
  data_acesso TIMESTAMP DEFAULT now()
);

-- Exemplo de trigger para log de leitura
CREATE OR REPLACE FUNCTION registrar_acesso()
RETURNS event_trigger AS $$
BEGIN
  INSERT INTO log_consultas (usuario, tabela)
  VALUES (SESSION_USER, TG_TABLE_NAME);
END;
$$ LANGUAGE plpgsql;
