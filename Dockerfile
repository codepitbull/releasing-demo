FROM eclipse-temurin:21-jre
LABEL maintainer="Jochen Mader"
#THIS IS NOT THE MOST EFFICIENT WAY; USED ONLY FOR DEMO PURPOSES
COPY build/libs/cli-all.jar /cli/cli-all.jar
ENTRYPOINT ["java", "-Xms256m", "-Xmx2048m", "-jar", "/cli/cli-all.jar", "server"]
EXPOSE 8080
