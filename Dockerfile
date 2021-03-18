FROM node:12

ADD . /root/OneBot

WORKDIR /root/OneBot

RUN if [ ! -f "config.js" ]; then cp config.sample.js config.js; fi;

ARG USE_CHINA_NPM_REGISTRY=0

RUN if [ "$USE_CHINA_NPM_REGISTRY" = 1 ]; then \
  echo 'use npm mirror';echo 'use npm mirror';echo 'use npm mirror'; \
  npm config set registry https://registry.npm.taobao.org; \
  fi;

EXPOSE 5700

RUN npm install oicq -g
RUN npm install ws -g
CMD ["node", "main","649668411"]

# docker build --build-arg USE_CHINA_NPM_REGISTRY=1 -t wdssmq/onebot-node .
