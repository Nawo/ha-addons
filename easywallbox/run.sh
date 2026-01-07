#!/usr/bin/env bashio

echo "Uruchamianie EasyWallbox Controller..."

CONFIG_PATH=/data/options.json

export MQTT_HOST=$(bashio::config 'mqtt_host')
export MQTT_PORT=$(bashio::config 'mqtt_port')
export MQTT_USERNAME=$(bashio::config 'mqtt_user')
export MQTT_PASSWORD=$(bashio::config 'mqtt_password')

export WALLBOX_ADDRESS=$(bashio::config 'wallbox_mac')
export WALLBOX_PIN=$(bashio::config 'wallbox_pin')

export MQTT_TOPIC_PREFIX="easywallbox"

echo "------------------------------------------------"
echo "DEBUG: Sprawdzanie zmiennych środowiskowych:"
echo "MQTT Host: $MQTT_HOST"
echo "MQTT Port: $MQTT_PORT"
echo "MQTT User: $MQTT_USERNAME"
echo "MQTT Pass: $MQTT_PASSWORD"
echo "Wallbox MAC: $WALLBOX_ADDRESS"
echo "Wallbox PIN: $WALLBOX_PIN"
echo "Topic Prefix: $MQTT_TOPIC_PREFIX"
echo "------------------------------------------------"

echo "Zmienne ustawione. Uruchamiam skrypt..."
cd /app
python3 easywallbox.py