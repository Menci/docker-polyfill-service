FROM node:16-alpine

RUN apk add --no-cache --update bash
RUN apk add --no-cache --update --virtual build git python3 make gcc g++
COPY polyfill-service /polyfill-service
WORKDIR /polyfill-service

ARG NODE_ENV='production'
ENV PORT 80

RUN npm install -g patch-package
RUN npm ci --no-audit

RUN sed -i.bak -e 's,^node,exec node,' start_server.sh && \
        mv start_server.sh /bin/ && \
        chmod a+x /bin/start_server.sh && \
        apk del build

EXPOSE ${PORT}

CMD ["/bin/start_server.sh", "server/index.js"]
