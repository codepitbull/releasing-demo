FROM eclipse-temurin:21-jre
LABEL maintainer="Jochen Mader"
#THIS IS NOT THE MOST EFFICIENT WAY; USED ONLY FOR DEMO PURPOSES
COPY build/libs/cli.jar /cli/cli.jar
ENTRYPOINT ["java", "-Xms256m", "-Xmx2048m", "-jar", "/cli/cli.jar", "server"]
EXPOSE 8080
