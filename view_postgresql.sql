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

-- necessitamos criar um banco de dados para com isso, vamos criar alguns scripts e alimentar com alguns dados nas tabelas:
/*
departments  ──┐
               ├──► employees ──► salaries
positions    ──┘
*/

-- 1. Departments
CREATE TABLE departments (
    id          SERIAL PRIMARY KEY,
    name        VARCHAR(100) NOT NULL UNIQUE,
    location    VARCHAR(100),
    budget      NUMERIC(15,2),
    created_at  TIMESTAMP DEFAULT NOW()
);
