# Sistema de supervisor de dispositivos IoT

### Intenção do projeto

O projeto visa criar um sistema de supervisor de dispositivos IoT Industriais, que irá receber as mensagens de telemetria e enviar as mensagens de comando para os dispositivos IoT.


## Modelo de infraestrutura
![Dispositivo de telemetria](doc/sistema.png)



### Alvo para supervisão

Instalação de equipamentos industriais, acessórios de segurança, quadros elétricos, etc.


### Esse projeto é dividido em 3 partes, e cada uma dessas partes/etapas tem subitens.


1. API em Go Lang
   - MQTT com etapa de autenticação e autorização
   - rabbitmq
   - redis
   - postgresql


## Link para o projeto

Visão resumida da API em Go Lang [doc/core-api.md](doc/core-api.md) 

Endpoints Https [doc/endpoints-https.md](doc/endpoints-https.md)

## _

2. Dispositivos de monitoramento ou `dispositivos de telemetria`
   - Gateway
   - Dispositivos IoT com sensor diversos, temperatura, umidade, luminosidade, corrente, tensão, eixos, vibração.

Os dispositivos IoT `irão` enviar as mensagens de telemetria para o gateway, que irá enviar as mensagens para a API em Go Lang.

3. Frontend
   - Angular | React
   - Dashboard
   - Grafana


### Regras de negócio fundamentais

- 1. Os dispositivos IoT irão enviar mensagens para o gateway.
- 2. O gateway se conecta ao broker MQTT e envia as mensagens para a `API`.
- 3. A `API` faz autenticação e autorização das mensagens recebidas do gateway.
- 4. A `API` processa as mensagens recebidas do gateway aplicando as regras de negócio.
- 5. A `API` envia as mensagens de comando para o gateway avisando sobre o recebimento das mensagens de telemetria.
- 6. A `API` encaminha as mensagens processadas para o RabbitMQ.
- 7. A `API` salva as mensagens de telemetria no banco de dados PostgreSQL.
- 8. A `API` expõe endpoints para consulta das mensagens de telemetria para o frontend.



## Desenvolvimento dos dispositivos IoT

Dispositivo de `ponta` que é a parte que vai coletar as grandezas dos sensores.

- 1. Controlador principal `ESP32-S3`
- 2. Sensores
- 3. Comunicação via `ESP-Now` com `Gateway`
- 4. Fonte de energia `em avaliação`
- 5. Software de CAD `KiCad 8`
- 6. Software de programação `ESP-IDF 5.5`
- 7. Hardware de programação `ESP-PROG`

Dispositivo mestre ou `Gateway`

- 1. Processador principal `ARM-v7` com `Linux` ou `OpenWRT`
- 2. Fonte de energia `em avaliação`
- 3. Software de CAD `KiCad 8`
- 4. Software de programação `Yocto Project`
- 5. `ESP32-S3` para comunicação com `dispositivo de telemetria` via `ESP-Now`
- 6. Hardware de programação `ESP-PROG`



### Esse repodistoro é apenas para o desenvolvimento da API em Go Lang

Toda a implementação do `dispositivo de telemetria` e `gateway` está em desenvolvimento.

aqui nesse repo está apenas a API em Go Lang.

Os link do projeto hardware, firmware e frontend estão em desenvolvimento e logo estão disponiveis.

Um grupo no `telegram` está sendo criado para o desenvolvimento do projeto.