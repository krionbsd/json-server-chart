FROM node:18-alpine
RUN npm install -g json-server@0.17.4
EXPOSE 3000
ENTRYPOINT ["json-server"]
