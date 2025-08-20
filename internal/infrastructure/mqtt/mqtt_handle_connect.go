package mqtt

import (
	"fmt"
	"os"
	"sync"

	mqtt "github.com/eclipse/paho.mqtt.golang"
	"github.com/joho/godotenv"
)

var (
	clientInstance mqtt.Client
	once           sync.Once
)

func GetMqttClient() mqtt.Client {

	once.Do(func() {

		err := godotenv.Load()
		if err != nil {
			fmt.Println("Erro ao carregar variáveis de ambiente", err)
			return
		}

		opts := mqtt.NewClientOptions()
		opts.AddBroker(os.Getenv("MQTT_BROKER"))
		opts.SetClientID(os.Getenv("MQTT_CLIENT_ID"))
		opts.SetUsername(os.Getenv("MQTT_USERNAME"))
		opts.SetPassword(os.Getenv("MQTT_PASSWORD"))
		//		opts.SetDefaultPublishHandler(mqttMessageHandler)

		clientInstance = mqtt.NewClient(opts)

		if token := clientInstance.Connect(); token.Wait() && token.Error() != nil {
			fmt.Println("Erro ao conectar ao broker MQTT", token.Error())
			return
		}

	})

	return clientInstance
}
