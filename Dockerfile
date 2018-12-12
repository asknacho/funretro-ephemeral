FROM node:boron

MAINTAINER Arran Bartish <arranbartish@hotmail.com>

ADD https://github.com/funretro/distributed/archive/master.tar.gz /Downloads/master.tar.gz

RUN tar -xzf /Downloads/master.tar.gz && \
    mv /distributed-master /retro && \
    npm i -g gulp && \
    cd /retro;npm install && \
    npm i firebase-server

RUN echo "firebase.initializeApp({apiKey: 'YOUR_API_KEY',  databaseURL: 'ws://localhost:5000'});" > /retro/js/vendor/firebaseInitialization.js && \
    adduser --disabled-password --gecos "retro" --home /retro --no-create-home retro && \
    chown -R retro:retro /retro
RUN cat /retro/js/vendor/firebaseInitialization.js

COPY --chown=retro:retro run.sh  /retro/

EXPOSE 4000

WORKDIR /retro

USER retro

ENTRYPOINT ["bash"]
CMD ["run.sh"]
