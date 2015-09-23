FROM java:7

MAINTAINER lmazuel

ENV JETTY_VERSION 9.3.3.v20150827

RUN wget http://download.eclipse.org/jetty/${JETTY_VERSION}/dist/jetty-distribution-${JETTY_VERSION}.zip -O /tmp/jetty.zip && \
    cd /opt && jar xf /tmp/jetty.zip && \
    ln -s /opt/jetty-distribution-${JETTY_VERSION} /opt/jetty && \
    rm /tmp/jetty.zip

ENV JETTY_HOME /opt/jetty
ENV PATH $PATH:$JETTY_HOME/bin

COPY mariadb-java-client-1.2.2.jar /opt/jetty/lib/ext/
COPY slf4j-api-1.7.12.jar /opt/jetty/lib/ext/

VOLUME /conf
WORKDIR /opt/jetty

EXPOSE 8080

CMD java -jar /opt/jetty/start.jar
