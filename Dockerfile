FROM maven:3.8.8-eclipse-temurin-21 AS build

COPY . .

RUN mvn clean install

FROM tomcat:9-jre21 AS runtime

COPY --from=build ./target/*.war $CATALINA_HOME/webapps/ROOT.war
