#!/usr/bin/env bashio

echo "Uruchamianie EasyWallbox Controller..."


export MQTT_HOST=$(bashio::config 'mqtt_host')
export MQTT_PORT=$(bashio::config 'mqtt_port')
export MQTT_USER=$(bashio::config 'mqtt_user')
export MQTT_PASSWORD=$(bashio::config 'mqtt_password')

export WALLBOX_MAC_ADDRESS=$(bashio::config 'wallbox_mac')
export WALLBOX_PIN=$(bashio::config 'wallbox_pin')

export MQTT_TOPIC_PREFIX="easywallbox"

echo "------------------------------------------------"
echo "DEBUG: Sprawdzanie zmiennych środowiskowych:"
echo "MQTT Host: $MQTT_HOST"
echo "MQTT Port: $MQTT_PORT"
echo "MQTT User: $MQTT_USER"
echo "MQTT Pass: $MQTT_PASSWORD"
echo "Wallbox MAC: $WALLBOX_MAC_ADDRESS"
echo "Wallbox PIN: $WALLBOX_PIN"
echo "Topic Prefix: $MQTT_TOPIC_PREFIX"
echo "------------------------------------------------"

echo "Zmienne ustawione. Uruchamiam skrypt..."
cd /app
git pull
python3 easywallbox.py