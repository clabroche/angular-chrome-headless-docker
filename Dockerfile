FROM debian:stable-slim

RUN apt-get update
RUN apt-get install -yy wget curl gnupg procps
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
	apt-get update && apt-get install -y nodejs

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list && \
  apt-get update && \
  apt-get install -y google-chrome-stable xvfb
RUN rm /etc/apt/sources.list.d/google.list
RUN apt-get -y update && apt-get -y install git make gcc g++

RUN npm install npm@5.6 -g
RUN npm cache verify
RUN rm -rf /var/lib/apt/lists/*
