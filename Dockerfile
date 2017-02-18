FROM ruby:2.3.0-alpine

ENV APPLICATION /usr/lib/origin
ENV RAILS_ENV production

WORKDIR $APPLICATION

RUN apk add --no-cache build-base tzdata
RUN apk add --no-cache --repository http://nl.alpinelinux.org/alpine/v3.5/main postgresql-dev
RUN gem install bundler

COPY Gemfile* $APPLICATION/

RUN bundle install --jobs 20 --retry 5

COPY app/ $APPLICATION/app/
COPY bin/ $APPLICATION/bin/
COPY config/ $APPLICATION/config/
COPY db/ $APPLICATION/db/
COPY lib/ $APPLICATION/lib/
COPY public/ $APPLICATION/public/
COPY config.ru $APPLICATION/config.ru
COPY Rakefile $APPLICATION/Rakefile

CMD bin/rails server --port $PORT --bind '0.0.0.0'
