# springboot-mysql-docker-compose

# application-docker.properties

spring.datasource.url=jdbc:mysql://mysql-docker:3306/mysql_network
spring.datasource.username=root
spring.datasource.password=1234
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect
spring.jpa.hibernate.ddl-auto=update

# application.properties

spring.datasource.url=jdbc:mysql://localhost:3306/mysql_local
spring.datasource.username=root
spring.datasource.password=1234
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect
spring.jpa.hibernate.ddl-auto=update
spring.profiles.active=docker

- sudo docker pull mysql
- sudo docker network create springboot-mysql-net
- sudo docker network ls
- `sudo docker run --name mysql_network --network springboot-mysql-net -e MYSQL_ROOT_PASSWORD=1234 -e MYSQL_DATABASE=mysql_docker -d mysql`
- sudo docker logs -f `container mysql_network`
    + sudo docker exec -it `container mysql_network` bash

- mvn clean package => `springboot-restful-webservices-0.0.1-SNAPSHOT.jar`

- Dockerfile:

  FROM amazoncorretto:17

  LABEL mentainer="huydinhanhle@gmail.com"

  WORKDIR /app

  COPY target/springboot-restful-webservices-0.0.1-SNAPSHOT.jar /app/springboot-mysql-docker.jar

  ENTRYPOINT ["java", "-jar", "springboot-mysql-docker.jar"]

- sudo docker build -t springboot-mysql-docker-network .
- sudo docker images
- sudo docker run --network springboot-mysql-net --name springboot-mysql-network-container -p 8080:8080 -d
  springboot-mysql-docker-network
- sudo docker logs -f <Container ID of springboot-mysql-network-container>

# springboot-mysql-docker-compose

- sudo docker rmi -f <Image ID mysql_local> <Image ID springboot-mysql-docker-network>
- sudo docker-compose up -d => Starting mysql_network ... done
- sudo docker-compose down
- sudo docker-compose up -d --build
- sudo docker-compose down --rmi all

# Tutorials on Java Guides

https://github.com/bezkoder/docker-compose-spring-boot-mysql

https://www.bezkoder.com/docker-compose-spring-boot-mysql/

https://www.javaguides.net/2022/12/deploy-spring-boot-application-on-docker.html

https://www.javaguides.net/2022/12/deploy-spring-boot-mysql-application-to-docker.html

https://www.javaguides.net/2022/12/spring-boot-mysql-docker-compose-example.html

https://www.javaguides.net/2022/12/docker-container-commands.html

https://www.javaguides.net/2022/12/docker-images-commands-list.html
