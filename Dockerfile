FROM ubuntu:latest

ENV TZ=Europe/Paris
RUN apt-get update && apt-get upgrade && apt-get install wget gnupg2 unzip zip -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && apt-get update && DEBIAN_FRONTEND="noninteractive" apt-get install google-chrome-stable -y
RUN wget -O /tmp/chromedriver.zip http://chromedriver.storage.googleapis.com/89.0.4389.23/chromedriver_linux64.zip
RUN unzip /tmp/chromedriver.zip chromedriver -d /usr/local/bin/
RUN export DBUS_SYSTEM_BUS_ADDRESS=unix:path=/host/run/dbus/system_bus_socket
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null