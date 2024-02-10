# mvn intall -DskipTests to build .jar project
# it can docker run with --env-file
FROM eclipse-temurin:11
ARG JAR_FILE=target/*.jar
RUN mkdir /opt/app
ADD ${JAR_FILE} /opt/app/app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/opt/app/app.jar"]
