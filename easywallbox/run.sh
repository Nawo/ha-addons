#!/usr/bin/with-contenv bashio

echo "Uruchamianie EasyWallbox Controller..."

export MQTT_HOST=$(bashio::config 'mqtt_host')
export MQTT_PORT=$(bashio::config 'mqtt_port')
export MQTT_USERNAME=$(bashio::config 'mqtt_user')
export MQTT_PASSWORD=$(bashio::config 'mqtt_password')
export WALLBOX_ADDRESS=$(bashio::config 'wallbox_mac')
export WALLBOX_PIN=$(bashio::config 'wallbox_pin')

echo "Wallbox adress: $WALLBOX_ADDRESS"
echo "Broker MQTT: $MQTT_HOST"

echo "Starting EasyWallbox..."
cd /app
python3 easywallbox.py