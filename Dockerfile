FROM ruby:2.6.6-alpine

WORKDIR /app

RUN apk add --no-cache build-base postgresql-dev yarn && \
    gem install bundler && \
    bundle config set without development test

COPY package.json yarn.lock ./
RUN yarn install --prod

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

ENV RAILS_ENV=production
CMD [ "bundle", "exec", "rake", "startup" ]
