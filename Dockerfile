FROM node:16.2.0-stretch-slim

RUN apt-get update

WORKDIR /usr/src/snowpack-bug-repro

COPY package*.json ./
COPY snowpack.config.mjs ./

RUN chown -R node:node /usr/src/snowpack-bug-repro

USER node

RUN npm install

COPY . .

CMD ["npx", "snowpack", "dev"]
