# Stage 1: Build with Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /usr/src/app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Run with JRE
FROM eclipse-temurin:17
WORKDIR /usr/src/app
COPY --from=build /usr/src/app/target/*.jar app.jar
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
