FROM ruby:2.3.0-alpine

ENV \
  APPLICATION=/usr/lib/origin \
  RAILS_ENV=production

WORKDIR $APPLICATION

RUN \
  apk add --no-cache build-base tzdata \
  && \
  apk add --no-cache --repository http://nl.alpinelinux.org/alpine/edge/community postgresql-dev

COPY Gemfile $APPLICATION/
COPY Gemfile.lock $APPLICATION/

RUN bundle install

COPY app/ $APPLICATION/app/
COPY bin/ $APPLICATION/bin/
COPY config/ $APPLICATION/config/
COPY db/ $APPLICATION/db/
COPY lib/ $APPLICATION/lib/
COPY public/ $APPLICATION/public/
COPY config.ru $APPLICATION/config.ru
COPY Rakefile $APPLICATION/Rakefile

ENV \
  DATABASE_HOST=postgres \
  PORT=3000

CMD bin/rails server --port $PORT --bind '0.0.0.0'
