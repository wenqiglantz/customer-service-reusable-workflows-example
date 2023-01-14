FROM amazoncorretto:17-alpine-jdk
RUN apk update && apk upgrade -U -a

RUN mkdir -m777 /etc/customer-service
ADD start-service.sh /etc/customer-service
ADD target/customer-service-exec.jar /etc/customer-service
COPY postgre.jks /tmp/postgre.jks
RUN chmod +x /etc/customer-service/start-service.sh
WORKDIR /etc/customer-service
ENV JVM_XMX=4096m
EXPOSE 80
CMD sh start-service.sh