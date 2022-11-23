FROM maven:3.8.4-openjdk-17 as MAVEN_BUILD

COPY pom.xml /build/
COPY src /build/src/

WORKDIR /build/

RUN mvn -Dmaven.test.skip=true package -Ptest

FROM openjdk:17

WORKDIR /app

COPY --from=MAVEN_BUILD /build/target/demo-0.0.1-SNAPSHOT.jar /app/

ENTRYPOINT ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]