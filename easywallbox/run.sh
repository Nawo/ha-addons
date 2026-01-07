#!/bin/bash

echo "--- Uruchamianie EasyWallbox Controller (Direct Mode) ---"

CONFIG_PATH=/data/options.json

export MQTT_HOST=$(jq --raw-output '.mqtt_host' $CONFIG_PATH)
export MQTT_PORT=$(jq --raw-output '.mqtt_port' $CONFIG_PATH)
export MQTT_TOPIC=$(jq --raw-output '.mqtt_topic' $CONFIG_PATH)
export MQTT_USERNAME=$(jq --raw-output '.mqtt_user' $CONFIG_PATH)
export MQTT_PASSWORD=$(jq --raw-output '.mqtt_password' $CONFIG_PATH)

export WALLBOX_ADDRESS=$(jq --raw-output '.wallbox_mac' $CONFIG_PATH)
export WALLBOX_PIN=$(jq --raw-output '.wallbox_pin' $CONFIG_PATH)

echo "------------------------------------------------"
echo "MQTT Host: $MQTT_HOST"
echo "MQTT Port: $MQTT_PORT"
echo "MQTT Topic: $MQTT_TOPIC"
echo "MQTT User: $MQTT_USERNAME"
echo "Wallbox MAC: $WALLBOX_ADDRESS"
echo "Wallbox PIN: $WALLBOX_PIN"
echo "------------------------------------------------"

if [ -z "$WALLBOX_ADDRESS" ] || [ "$WALLBOX_ADDRESS" == "null" ]; then
    echo "BŁĄD: Nie udało się odczytać adresu MAC. Sprawdź konfigurację dodatku!"
    exit 1
fi

echo "Uruchamiam skrypt..."
cd /app
python3 easywallbox.py