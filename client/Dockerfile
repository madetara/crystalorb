FROM node:15.4-alpine

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install

COPY . .

ENV HOST=0.0.0.0

CMD [ "yarn", "start" ]
