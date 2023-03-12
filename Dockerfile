FROM amazoncorretto:17

LABEL mentainer="huydinhanhle@gmail.com"

WORKDIR /app

COPY target/springboot-restful-webservices-0.0.1-SNAPSHOT.jar /app/springboot-mysql-docker.jar

ENTRYPOINT ["java", "-jar", "springboot-mysql-docker.jar"]