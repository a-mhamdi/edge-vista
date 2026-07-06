FROM eclipse-mosquitto

COPY mosquitto.conf /mosquitto/config/mosquitto.conf
COPY passwd /mosquitto/config/passwd

EXPOSE 1883 9001

# docker build -t mosquitto .
# docker run -d --name mosquitto -p 1883:1883 -p 9001:9001 mosquitto
