#!/usr/bin/env bashio

echo "Uruchamianie EasyWallbox Controller (ENV Mode)..."

export MQTT_HOST=$(bashio::config 'mqtt_host')
export MQTT_PORT=$(bashio::config 'mqtt_port')
export MQTT_USER=$(bashio::config 'mqtt_user')
export MQTT_PASSWORD=$(bashio::config 'mqtt_password')

export WALLBOX_MAC_ADDRESS=$(bashio::config 'wallbox_mac')
export WALLBOX_PIN=$(bashio::config 'wallbox_pin')

export MQTT_TOPIC_PREFIX="easywallbox"

echo "Zmienne ustawione. Uruchamiam skrypt..."

python3 easywallbox.py