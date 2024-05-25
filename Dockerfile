# Starting out with the openjdk-11-slim image
FROM eclipse-temurin:11-jre-alpine

# Fake it til you make it - let's go home
WORKDIR /app
ENV WORLD_CONFIG_FILE=default.conf

RUN mkdir -p /app/worldprops
COPY ./server.jar /app
COPY ./worldprops/* /app/worldprops

# Run it
ENTRYPOINT ls -l /app && java -Dnashorn.args=--no-deprecation-warning -jar /app/server.jar "worldprops/${WORLD_CONFIG_FILE}"
