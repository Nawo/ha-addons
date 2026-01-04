#!/bin/bash

set -e

echo "Uruchamianie EasyWallbox Controller..."

export MQTT_HOST=$(jq --raw-output '.mqtt_host // empty' /data/options.json)
export MQTT_PORT=$(jq --raw-output '.mqtt_port // 1883' /data/options.json)
export MQTT_USERNAME=$(jq --raw-output '.mqtt_user // empty' /data/options.json)
export MQTT_PASSWORD=$(jq --raw-output '.mqtt_password // empty' /data/options.json)
export WALLBOX_ADDRESS=$(jq --raw-output '.wallbox_mac // empty' /data/options.json)
export WALLBOX_PIN=$(jq --raw-output '.wallbox_pin // "0000"' /data/options.json)

echo "Konfiguracja załadowana."
echo "Wallbox address: $WALLBOX_ADDRESS"
echo "Broker MQTT: $MQTT_HOST"

echo "Pobieranie najnowszej wersji kodu..."
cd /app

git pull

echo "Startuje EasyWallbox..."
python3 easywallbox.py