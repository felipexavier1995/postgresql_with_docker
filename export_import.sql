-- Acessando ao servidor em questão do docker, entrar no docker com o seguinte comando:

docker exer -it meu-postgres psql -U admin -d meubanco 

-- Já acessando ao banco de dados, como teste vamos precisar criar um uma tabela e alguns dados nela.
-- Com os comandos a seguir.
CREATE TABLE clientes (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(100),
  email VARCHAR(150),
  telefone VARCHAR(20),
  cidade VARCHAR(100)
);

INSERT INTO clientes (nome, email, telefone, cidade) VALUES 
  ('João Silva', 'joao@email.com', '(21) 99999-1111', 'Rio de Janeiro'),
  ('Maria Santos', 'maria@email.com', '(11) 99999-2222', 'São Paulo'),
  ('Carlos Oliveira', 'carlos@email.com', '(31) 99999-3333', 'Belo Horizonte'),
  ('Ana Pereira', 'ana@email.com', '(41) 99999-4444', 'Curitiba'),
  ('Lucas Souza', 'lucas@email.com', '(51) 99999-5555', 'Porto Alegre'),
  ('Fernanda Lima', 'fernanda@email.com', '(71) 99999-6666', 'Salvador'),
  ('Rafael Costa', 'rafael@email.com', '(81) 99999-7777', 'Recife'),
  ('Juliana Rocha', 'juliana@email.com', '(62) 99999-8888', 'Goiânia'),
  ('Thiago Mendes', 'thiago@email.com', '(92) 99999-9999', 'Manaus'),
  ('Camila Ferreira', 'camila@email.com', '(85) 99999-0000', 'Fortaleza');

-- Para ilustrar o resultado com o comando a seguir:
select *
from clientes;

-- Agora para realizar o dump, vamos primeira o diretorio onde estamos com o comandos 
pwd
-- ou podemos acessar o seguinte comando:
cd ~/postgres-docker

-- Dentro do diretorio podemos fazer o import com comando:
docker exec meu-postgres pg_dump -U admin meubanco > backup.sql

-- No mesmo diretorio, podemos realizar o export com o comando:
docker exec -i meu-postgres psql -U admin -d meubanco < backup.sql


-- admin = usuário para entrar do banco
-- backup.sql = nome do arquivo 

-- Podemos realizar tambem um import e export com um schema especifico:
docker exec meu-postgres pg_dump -U admin -n [schemas] meubanco > backup_schemas.sql
docker exec -i meu-postgres psql -U admin -d meubanco < backup_schemas.sql


