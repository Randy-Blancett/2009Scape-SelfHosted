# Starting out with the openjdk-11-slim image
FROM eclipse-temurin:11-jre-alpine

# Fake it til you make it - let's go home
WORKDIR /app
ENV WORLD_CONFIG_FILE=default.conf

RUN mkdir -p /app/worldprops
COPY ./server.jar /app
COPY ./default.conf /app
COPY ./start.sh /app

# Run it
ENTRYPOINT ./start.sh
