# Starting out with the openjdk-11-slim image
FROM eclipse-temurin:11-jre-alpine

# Fake it til you make it - let's go home
WORKDIR /app/2009scape

COPY ./server.jar /app

# Run it
ENTRYPOINT ["java", "-Dnashorn.args=--no-deprecation-warning", "-jar" , "/app/server.jar"]
