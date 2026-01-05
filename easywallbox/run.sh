#!/bin/bash

echo "--- Uruchamianie EasyWallbox Controller ---"

CONFIG_PATH=/data/options.json

export MQTT_HOST=$(jq --raw-output '.mqtt_host' $CONFIG_PATH)
export MQTT_PORT=$(jq --raw-output '.mqtt_port' $CONFIG_PATH)
export MQTT_USERNAME=$(jq --raw-output '.mqtt_user' $CONFIG_PATH)
export MQTT_PASSWORD=$(jq --raw-output '.mqtt_password' $CONFIG_PATH)
export WALLBOX_ADDRESS=$(jq --raw-output '.wallbox_mac' $CONFIG_PATH)
export WALLBOX_PIN=$(jq --raw-output '.wallbox_pin' $CONFIG_PATH)

echo "Konfiguracja załadowana:"
echo "Wallbox address: $WALLBOX_ADDRESS"
echo "Broker MQTT: $MQTT_HOST"

echo "Przechodzę do katalogu aplikacji..."
cd /app

git pull

echo "Uruchamiam skrypt Python..."
python3 easywallbox.py