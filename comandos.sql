-- Comandos usados dentro do postgresql.

--- Para entrar no postgres com o docker.
docker exec -it meu-postgres psql -U admin -d meubanco

-- Visualizar todos os banco de dados.
\l

-- Visualizar todos os usuários.
\du

-- Visualizar todas as tabelas do banco de dados
\dt

-- Visualizar em qual banco de dados está conectado.
\conninfo

--- Comando para sair do postgresql
\q

-- Visualizar o tempo de execução
\timing

-- Visualizar todas as view 
\dv

-- Visualizar todos os schemas
\dn
