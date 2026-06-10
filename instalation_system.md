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

Em remote host, basta digitar o ip e username coloca root e a senha




