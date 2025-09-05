package main

import "github.com/kleysoncastro/iot-telemetry/internal/infrastructure/mqtt"

func main() {

	clientMqtt := mqtt.GetMqttClient()

	clientMqtt.Subscribe("/www/sensor", 0, nil)

	select {}
}
