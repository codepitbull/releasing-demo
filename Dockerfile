FROM eclipse-temurin:21-jre
LABEL maintainer="Jochen Mader"
#THIS IS NOT THE MOST EFFICIENT WAY; USED ONLY FOR DEMO PURPOSES
COPY app/build/libs/app-all.jar /app/app-all.jar
ENTRYPOINT ["java", "-Xms256m", "-Xmx2048m", "-jar", "/app/app-all.jar", "server"]
EXPOSE 8080
