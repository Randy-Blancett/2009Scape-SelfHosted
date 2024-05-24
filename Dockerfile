# Starting out with the openjdk-11-slim image
FROM eclipse-temurin:11-jre-alpine

# Fake it til you make it - let's go home
WORKDIR /app/2009scape

COPY ./server.jar /app

# Make sure ./run has permissions
RUN chmod +x run

GS_EXEC="cd $GS_SRC && java -Dnashorn.args=--no-deprecation-warning -jar $BUILD_DIR/server.jar"
# Run it
CMD ["java -Dnashorn.args=--no-deprecation-warning -jar /app/server.jar]
