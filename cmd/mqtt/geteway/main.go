package main

import (
	"fmt"
	"os"

	mqtt "github.com/eclipse/paho.mqtt.golang"
	"github.com/joho/godotenv"
)

func main() {

	err := godotenv.Load()
	if err != nil {
		fmt.Println("Erro ao carregar variáveis de ambiente", err)
		return
	}

	mqttConnectOpts := mqtt.NewClientOptions()
	mqttConnectOpts.AddBroker(os.Getenv("MQTT_BROKER"))
	mqttConnectOpts.SetClientID("gateway_a")
	mqttConnectOpts.SetUsername(os.Getenv("MQTT_USERNAME"))
	mqttConnectOpts.SetPassword(os.Getenv("MQTT_PASSWORD")) //		opts.SetDefaultPublishHandler(mqttMess

	clientMqtt := mqtt.NewClient(mqttConnectOpts)

	if token := clientMqtt.Connect(); token.Wait() && token.Error() != nil {
		fmt.Println("Erro ao conectar ao broker MQTT", token.Error())
		return
	}

	clientMqtt.Subscribe("/www/sensor", 1, func(c mqtt.Client, m mqtt.Message) {
		fmt.Println("Mensagem recebida", m)
	})
	select {}
}
