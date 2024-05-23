# Starting out with the openjdk-11-slim image
FROM eclipse-temurin:11-jre-alpine

# Fake it til you make it - let's go home
WORKDIR /app/2009scape

COPY ./

# Make sure ./run has permissions
RUN chmod +x run


# Run it
CMD ["./run"]
