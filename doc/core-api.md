# Core API

A base da API está ligada diretamente a duas tecnologias:

- 1. Broker MQTT `EMQX`
- 2. Banco de dados PostgreSQL

O mais comum em projetos com MQTT é o broker Mosquitto, no entanto o broker `EMQX` já tem integrado autorização e autenticação.

Essas duas etapas `autenticação e autorização` são fundamentais para o projeto.

Num primeiro momento, todo dispositivo já sai para produção/campo com credenciais de autenticação, mas não com autorização.

Isso evita muito trabalho de desenvolvimento e teste na etapa de autenticação.

Após a etapa de comissionamento do dispositivo, que será feita por `QR Code`, um `endpoint` irá receber as credenciais do dispositivo e realizar a parte de `autorização`.

### Autorização

As regras de negócio da parte de autorização estão ligadas ao tipo de ação que o dispositivo irá realizar.

- 1. Leitura
- 2. Escrita
- 3. Leitura e Escrita
- 4. Tópicos mqtt para `publish` e `subscribe`

### Estrutura de dados trocados entre o dispositivo e a API

O protocolo MQTT em essência envia e recebe mensagens no formato `string`, mas para o desenvolvimento da API vamos adotar o formato `JSON`.

Os dados enviados no formato `JSON` ainda estão em desenvolvimento e análise, mas existe dos compos `JSON` fundamental, que é:

```json
{
    "serial_number": "FF:FF:FF:FF:FF:FF",
    "node_number": "1"
}
```
Os campos `serial_number` e `node_number` são dados enviados pelo `gateway` para a `API`.

### Desenvolvimento e teste

Para quem acha que é necessário ter o dispositivo `gateway` e o `dispositivo de telemetria` prontos para desenvolver e validar funcionalidades da `API`,

No entanto, é possível desenvolver e validar funcionalidades usando testes automatizados e principalmente ferramentas como `mosquitto_sub` e `mosquitto_pub`.


Para enviar um json para a API, `mosquitto_pub` podemos fazer o seguinte comando:


```bash
mosquitto_pub -h localhost -t "device/0/" -m '{"serial_number": "FF:FF:FF:FF:FF:FF", "node_number": "1", "sensor_temperature": "25.5", "sensor_humidity": "45.9"}'
```

Para receber dados de `comando` da API:

```bash
mosquitto_sub -h localhost -t "device/0/"
```
