-- O que é uma View?

/*
Uma View é uma consulta SQL salva no banco de dados que funciona como uma tabela virtual. Ela não armazena dados por si só — toda vez que é consultada, executa a query definida na sua criação.

Vantagens


Reutilização: escreva a query uma vez e use em qualquer lugar
Simplicidade: esconde JOINs e lógicas complexas do consumidor
Segurança: permite expor apenas colunas específicas ao usuário
Manutenção: alterações na lógica ficam centralizadas na view
*/
-- Como exemplo, vamos utilizar um banco de dados para demonstrar conhecimento sobre:


DROP TABLE IF EXISTS salaries    CASCADE;
DROP TABLE IF EXISTS employees   CASCADE;
DROP TABLE IF EXISTS positions   CASCADE;
DROP TABLE IF EXISTS departments CASCADE;
