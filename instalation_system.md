📋 Pré-requisitos para a maquina virtual 📋

Software:
| Componente | Usado |
|---|---|
| Sistema Operacional | Ubuntu |
| Banco de dados | Postgre |
| Docker | Versão 29 |


Hardware:
| Componente | Usado | 
|---|---|
| CPU | 2 clocks | 
| Memoria | 4GB |
| Disco | 40GB |
| Placa de Rede | Modo Bridged |

---------------------------------------------------------------
Esquema para conectar ao servidor atraves do SSH.

```text
🔧 Configuração de Rede recomendada para aprendizado
[ Sua máquina ]  ←──SSH──→  [ Servidor Linux ]
   192.168.1.10               192.168.1.X
                                    |
                               [ Docker ]
                                    |
                           [ PostgreSQL :5432 ]
```

--------------------------------------------------------------

👉 Passos para se conectar ao servidor, no caso é um exemplo como podemos conectar.

Ao entrar no servidor, digitar o ip addr para verificar o IP. É pegar o IP confirme o destaque.
<img width="1270" height="800" alt="image" src="https://github.com/user-attachments/assets/92487f13-5ff6-4905-a269-c6aa8ccac488" />

<img width="905" height="704" alt="image" src="https://github.com/user-attachments/assets/9f76f53e-d6e7-482a-be0f-df3fa5fffb6e" />

Em remote host, basta digitar o ip e username coloca root e a senha. E a porta é sempre a 22, esse é o caminho para fazer uma conexão SSH.


✅ Já conectado ao servidor, vamos atualizar o sistemas, antes de fazer qualquer instalação dentro no servidor.

1️⃣ No servidor, verificar se o SSH está rodando
sudo systemctl status ssh

2️⃣ Se não estiver instalado
sudo apt install openssh-server -y

3️⃣ Iniciar o SSH
sudo systemctl start ssh
sudo systemctl enable ssh

--------------------------------------------------------------
# Preparo e instalação.

📦 Atualizar o sistema. <p>
sudo apt update && sudo apt upgrade -y

📦 Instalar dependências. <p>
sudo apt install -y ca-certificates curl gnupg lsb-release

📦 Adicionar repositório oficial do Docker. <p>
sudo install -m 0755 -d /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

📦 Instalar o Docker. <p>
sudo apt update <p>
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin <p>


Criar uma pasta para o projeto com o comando <p>
mkdir ~/postgres-docker                       <p>
cd ~/postgres-docker                          <p>

Criar o arquivo docker-compose.yml (Criando um .yml com os dados do novo container)
nano docker-compose.yml


Cole esse conteúdo dentro do arquivo
```text
services:
  postgres:
    image: postgres:16
    container_name: meu-postgres
    restart: always
    environment:
      POSTGRES_USER: admin
      POSTGRES_PASSWORD: senha123
      POSTGRES_DB: meubanco
    ports:
      - "5432:5432"
    volumes:
      - pgdata:/var/lib/postgresql/data

volumes:
  pgdata:
```
Agora dentro do diretorio /root/postgres-docker vamos digitar o comando ls -lrth para verificar o arquivo criado.
<img width="514" height="107" alt="image" src="https://github.com/user-attachments/assets/04815ab5-09cd-4111-817d-8169eb47594a" />

Agora é subir o docker o container com o comando a seguir:
docker compose up -d
<img width="632" height="73" alt="image" src="https://github.com/user-attachments/assets/095edee9-beaf-4209-a63f-dd8b9d2f395f" />

📋 Atenção para ser anotado com alguns comandos do Docker 📋
| Comando | O que faz | Quando usar |
|---|---|---|
| docker compose up -d | Crie e inicia o container inicial | Primeira vez ou após mudança no compose
| docker start [meu_banco] | Apenas inicia um container já existente | Quando o container foi parado
| docker stop [meu_banco] | Parar o container | Quando quer parar o banco

Podemos criar um Ciclo de Vida de um Container.
```text
docker compose up -d
        ↓
   [ CREATED ]  ← container criado
        ↓
   [ RUNNING ]  ← container rodando
        ↓
docker stop meu-postgres
        ↓
   [ STOPPED ]  ← container parado (mas ainda existe!)
        ↓
docker start meu-postgres
        ↓
   [ RUNNING ]  ← container rodando novamente
```

Agora com o Docker instalado e funcionando perfeitamente no servidor, vamos verificar o Docker no momento com o comando: docker ps

<img width="1152" height="71" alt="image" src="https://github.com/user-attachments/assets/5495ea7d-a8e1-4739-b4d2-a62b04c3ef48" />

 



