# Starting out with the openjdk-11-slim image
FROM eclipse-temurin:11-jre-alpine

# Fake it til you make it - let's go home
WORKDIR /app
ENV WORLD_CONFIG_FILE=default.conf
ENV DEFAULT_DATA_DIR=/app/default_data

RUN mkdir -p /app/worldprops
RUN mkdir -p ${DEFAULT_DATA_DIR}
RUN mkdir -p /app/data/configs

COPY ./server.jar /app
COPY ./default.conf /app
COPY ./start.sh /app
COPY ./default_data ${DEFAULT_DATA_DIR}

RUN chmod -R 755 /app
RUN chmod -R 777 /app/data
RUN chmod -R 777 /app/worldprops
RUN chmod -R 777 /app/data/configs

# Run it
ENTRYPOINT /app/start.sh
