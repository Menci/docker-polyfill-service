# Use node 16 and npm 8
FROM node:16-alpine
RUN apk add bash && \
    npm install -g npm@9
    
# Copy polyfill-service files
COPY polyfill-service /polyfill-service
WORKDIR /polyfill-service

# Install dependencies
#RUN npm ci --production
RUN npm install --legacy-peer-deps

ENV NODE_ENV=production \
    PORT=80
EXPOSE 80

ENTRYPOINT ["npm", "run"]
CMD ["start"]
