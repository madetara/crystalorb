FROM node:15.4-alpine as build

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install

COPY . .

RUN yarn build

FROM nginx:1.19-alpine as deploy

COPY --from=build /app/public /usr/share/nginx/html
