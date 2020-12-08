FROM node:14-alpine as npm-deps

WORKDIR /app

COPY package.json package.json
COPY yarn.lock yarn.lock

RUN yarn install --prod


FROM ruby:2.6.6-alpine as build

RUN apk add --no-cache build-base postgresql-dev
RUN gem install bundler
RUN bundle config set without development test

WORKDIR /app

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install

COPY --from=npm-deps /app/node_modules node_modules


FROM build as deploy

WORKDIR /app
ENV RAILS_ENV=production
COPY . .

CMD [ "bundle", "exec", "rake", "startup" ]
