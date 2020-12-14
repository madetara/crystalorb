FROM node:15.4-alpine as mapgen

RUN apk add git make && yarn global add browserify

WORKDIR /app

RUN git clone https://github.com/redblobgames/mapgen4.git

WORKDIR /app/mapgen4

RUN yarn install && yarn build && make build/points-5.data


FROM node:15.4-alpine as build

RUN apk add git

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install

COPY . .

RUN yarn build

FROM nginx:1.19-alpine as deploy

COPY --from=mapgen /app/mapgen4/build/_bundle.js /usr/share/nginx/html/build/mapgen.js
COPY --from=mapgen /app/mapgen4/draggable.v2.js /usr/share/nginx/html/build/draggable.v2.js
COPY --from=mapgen /app/mapgen4/build/points-5.data /usr/share/nginx/html/build/points-5.data
COPY --from=build /app/public /usr/share/nginx/html
