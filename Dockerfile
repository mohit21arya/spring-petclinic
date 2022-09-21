FROM adoptopenjdk/openjdk:11-jdk-alpine
MAINTAINER mohit21arya@gmail.com
COPY /target/2.7.3.jar spring-petclinic-2.7.3.jar
ENTRYPOINT ["java","-jar","/target/spring-petclinic-2.7.3.jar"]