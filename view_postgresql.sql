-- O que é uma View?

/*
Uma View é uma consulta SQL salva no banco de dados que funciona como uma tabela virtual. Ela não armazena dados por si só — toda vez que é consultada, executa a query definida na sua criação.
Em tese é um script pré pronto que podemos alterar alguns parametros.

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

-- 4. Salaries
CREATE TABLE salaries (
    id              SERIAL PRIMARY KEY,
    employee_id     INT NOT NULL REFERENCES employees(id),
    amount          NUMERIC(10,2) NOT NULL,
    effective_date  DATE NOT NULL,
    end_date        DATE
);

-- Insert de dados (DML)
-- Departments
INSERT INTO departments (name, location, budget) VALUES
    ('Engineering',  'São Paulo',      500000.00),
    ('Marketing',    'Rio de Janeiro', 200000.00),
    ('Finance',      'São Paulo',      300000.00),
    ('HR',           'Curitiba',       150000.00);

-- Positions
INSERT INTO positions (title, level) VALUES
    ('Software Engineer',   'mid'),
    ('Senior Engineer',     'senior'),
    ('Engineering Manager', 'manager'),
    ('Marketing Analyst',   'junior'),
    ('Marketing Lead',      'lead'),
    ('Financial Analyst',   'mid'),
    ('HR Specialist',       'mid');

-- Employees
INSERT INTO employees (department_id, position_id, first_name, last_name, email, hire_date) VALUES
    (1, 3, 'Lucas',    'Ferreira', 'lucas.ferreira@hr.com',  '2019-03-10'),
    (1, 2, 'Ana',      'Costa',    'ana.costa@hr.com',       '2020-07-01'),
    (1, 1, 'Bruno',    'Lima',     'bruno.lima@hr.com',      '2022-01-15'),
    (1, 1, 'Carla',    'Souza',    'carla.souza@hr.com',     '2023-05-20'),
    (2, 5, 'Diego',    'Alves',    'diego.alves@hr.com',     '2020-11-03'),
    (2, 4, 'Fernanda', 'Rocha',    'fernanda.rocha@hr.com',  '2021-08-22'),
    (3, 6, 'Gabriel',  'Nunes',    'gabriel.nunes@hr.com',   '2018-06-14'),
    (3, 6, 'Helena',   'Martins',  'helena.martins@hr.com',  '2021-02-28'),
    (4, 7, 'Igor',     'Pinto',    'igor.pinto@hr.com',      '2022-09-05');

-- Salaries (com histórico de reajustes)
INSERT INTO salaries (employee_id, amount, effective_date, end_date) VALUES
    (1, 12000.00, '2019-03-10', '2021-03-09'),
    (1, 16000.00, '2021-03-10', NULL),
    (2, 11000.00, '2020-07-01', '2022-06-30'),
    (2, 14000.00, '2022-07-01', NULL),
    (3,  8000.00, '2022-01-15', NULL),
    (4,  7500.00, '2023-05-20', NULL),
    (5,  9000.00, '2020-11-03', NULL),
    (6,  6000.00, '2021-08-22', NULL),
    (7, 10000.00, '2018-06-14', '2022-06-13'),
    (7, 12500.00, '2022-06-14', NULL),
    (8,  9500.00, '2021-02-28', NULL),
    (9,  7000.00, '2022-09-05', NULL);

-- Criando a View (vw_employee_current_salary)
/*
  Ao criar a view abaixo vamos apenas chamar ela para simplificar.
*/
CREATE OR REPLACE VIEW vw_employee_current_salary AS 
SELECT
    e.id                                    AS employee_id,
    e.first_name || ' ' || e.last_name      AS full_name,
    d.name                                  AS department,
    p.title                                 AS position,
    p.level                                 AS level,
    s.amount                                AS current_salary,
    s.effective_date                        AS salary_since,
    e.hire_date
FROM employees e
JOIN departments d ON d.id = e.department_id
JOIN positions   p ON p.id = e.position_id
JOIN salaries    s ON s.employee_id = e.id
                  AND s.end_date IS NULL;

-- A chamada da view será feita desse modo.
SELECT * FROM vw_employee_current_salary;
