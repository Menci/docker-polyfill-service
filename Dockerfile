# Use node 12 and npm 7
FROM node:12-alpine
RUN apk add bash && \
    npm install -g npm@7 &&\
    RUN npm ci --production


# Copy polyfill-service files
COPY polyfill-service /polyfill-service
WORKDIR /polyfill-service

# Install dependencies
#RUN npm ci --production

ENV NODE_ENV=production \
    PORT=80
EXPOSE 80

ENTRYPOINT ["npm", "run"]
CMD ["start"]
