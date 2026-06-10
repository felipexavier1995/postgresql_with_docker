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
