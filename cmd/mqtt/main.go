package main

import "github.com/kleysoncastro/iot-telemetry/internal/infrastructure/mqtt"

func main() {

	clientMqtt := mqtt.GetMqttClient()

	clientMqtt.Subscribe("/device/0/", 0, nil)

	select {}
}
