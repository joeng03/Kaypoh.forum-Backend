FROM ruby:3.1.2-alpine

RUN apk update && apk add bash build-base nodejs postgresql-dev tzdata

RUN mkdir /app

WORKDIR /app

COPY Gemfile Gemfile.lock ./

RUN gem install bundler --no-document
RUN bundle install --no-binstubs --jobs $(nproc) --retry 3

COPY . .

RUN addgroup -g 1000 docker && adduser -G docker -g docker -s /bin/sh -D docker
USER docker

# Start the main process.
CMD ["bundle", "exec", "rails", "server",  "-b", "0.0.0.0"]