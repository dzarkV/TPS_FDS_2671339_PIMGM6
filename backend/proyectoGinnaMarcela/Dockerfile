# mvn intall -DskipTests to build .jar project

FROM eclipse-temurin:11
ARG JAR_FILE=target/*.jar
RUN mkdir /opt/app 
ADD ${JAR_FILE} /opt/app/app.jar
ENTRYPOINT ["java", "-jar", "/opt/app/app.jar"]
