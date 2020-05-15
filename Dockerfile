FROM node:14.0-alpine3.10

ENV TIME_ZONE=Asia/Shanghai

RUN \
  mkdir -p /usr/src/app \
  && apk add --no-cache tzdata \
  && echo "${TIME_ZONE}" > /etc/timezone \ 
  && ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime 

WORKDIR /usr/src/app

COPY package.json /usr/src/app/

RUN npm i --production

# RUN npm i --registry=https://registry.npm.taobao.org

COPY . /usr/src/app

EXPOSE 7001

CMD npm run start
