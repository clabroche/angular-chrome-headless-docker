FROM ubuntu:18.04
RUN  apt-get update && apt-get install -y curl wget gnupg sudo 

RUN sudo sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list' && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
    curl -sL https://deb.nodesource.com/setup_8.x | bash -

RUN  apt-get update

RUN apt-get install -y  procps git make gcc g++ google-chrome-stable xvfb nodejs xvfb libgtk2.0-0 libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2
RUN rm -rf /var/lib/apt/lists/*

RUN npm install npm@5.6 -g
RUN npm cache verify
RUN npm i cypress
RUN cd usr/bin && ln -s /node_modules/.bin/cypress cypress
