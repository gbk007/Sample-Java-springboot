FROM openjdk:latest
WORKDIR /test
COPY jenkins-test-1.0.jar /test/jenkins-test-1.0.jar
ENTRYPOINT ["java", "-jar", "/test/jenkins-test-1.0.jar"]
