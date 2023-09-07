FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/find-links.jar
ARG JAR_LIB_FILE=target/lib/

# cd /usr/local/runme
WORKDIR /usr/local/runme

# cp target/app.jar /usr/local/runme/app.jar
COPY target/find-links.jar .

# cp -rf target/lib/  /usr/local/runme/lib
ADD target/lib/ lib/

# java -jar /usr/local/runme/app.jar
ENTRYPOINT ["java","-jar","find-links.jar"]
