<h1> 🐘 PostgreSQL com Docker </h1>

Este projeto demonstra como criar e executar um container PostgreSQL utilizando Docker.
O Objetivo é simplesmente demonstra e apresentar o meu conhecimento referente a Docker e postgre sql

Ok, mas o que é Docker e porque utilizar em produção ?

-------------------------------------------------------------
<h1>🐳 O que é Docker?</h1>

Docker é uma plataforma de virtualização baseada em containers que permite empacotar uma aplicação juntamente com todas as suas dependências, bibliotecas e configurações necessárias para sua execução.

Diferentemente das máquinas virtuais tradicionais, os containers compartilham o mesmo kernel do sistema operacional hospedeiro, tornando sua inicialização muito mais rápida e consumindo menos recursos computacionais.

Com Docker, uma aplicação pode ser desenvolvida, testada e executada em diferentes ambientes sem a preocupação com incompatibilidades entre sistemas operacionais ou versões de software.

<h1>🚀 Por que utilizar Docker em produção?</h1>

O uso do Docker em ambientes de produção tornou-se uma prática amplamente adotada devido aos diversos benefícios oferecidos pela tecnologia.

✅ Padronização dos Ambientes

Um dos maiores desafios no desenvolvimento de software é garantir que a aplicação funcione da mesma forma em desenvolvimento, homologação e produção.

Com Docker, o mesmo container utilizado pelo desenvolvedor pode ser implantado diretamente em produção, reduzindo problemas relacionados a configurações diferentes entre servidores.

✅ Facilidade de Implantação

A criação e distribuição de aplicações tornam-se muito mais simples, pois basta disponibilizar a imagem Docker para que qualquer servidor compatível possa executá-la.

Isso facilita processos de CI/CD (Integração Contínua e Entrega Contínua), permitindo implantações rápidas e automatizadas.

✅ Escalabilidade

Docker facilita a criação de múltiplas instâncias de uma aplicação para atender ao aumento da demanda.
Em conjunto com ferramentas como Docker é possível distribuir containers automaticamente entre diversos servidores, garantindo alta disponibilidade.

-------------------------------------------------------------
