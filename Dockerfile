FROM maven:3.8.3-openjdk-11 AS build

COPY . .

RUN mvn clean install

FROM tomcat:9-jre11 AS runtime

COPY --from=build ./target/*.war $CATALINA_HOME/webapps/ROOT.war
