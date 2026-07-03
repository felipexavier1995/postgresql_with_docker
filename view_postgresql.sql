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

-- 2. Positions
CREATE TABLE positions (
    id          SERIAL PRIMARY KEY,
    title       VARCHAR(100) NOT NULL,
    level       VARCHAR(20) CHECK (level IN ('junior','mid','senior','lead','manager')),
    created_at  TIMESTAMP DEFAULT NOW()
);

-- 3. Employees
CREATE TABLE employees (
    id              SERIAL PRIMARY KEY,
    department_id   INT REFERENCES departments(id),
    position_id     INT REFERENCES positions(id),
    first_name      VARCHAR(50) NOT NULL,
    last_name       VARCHAR(50) NOT NULL,
    email           VARCHAR(100) NOT NULL UNIQUE,
    hire_date       DATE NOT NULL DEFAULT CURRENT_DATE,
    is_active       BOOLEAN DEFAULT TRUE
);

