-- Anonimização de dados sensíveis
UPDATE paciente SET
  nome = CONCAT('Paciente_', id),
  cpf = NULL,
  telefone = NULL,
  endereco = NULL;

UPDATE visita SET
  latitude = NULL,
  longitude = NULL,
  obs_visita = 'Observação removida por segurança';

UPDATE familia SET
  responsavel = CONCAT('Resp_', id),
  coordenada_gps = NULL;
