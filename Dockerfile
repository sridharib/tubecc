FROM maven:3.9-eclipse-temurin-17-alpine AS build
COPY src /app/src/
COPY pom.xml /app/
WORKDIR /app
RUN mvn clean install

WORKDIR /app/target
RUN ls -la

FROM tomcat:9-jre17-temurin
COPY --from=build /app/target/tubecc.war /usr/local/tomcat/webapps/
EXPOSE 8080