FROM ruby:2.4.0-alpine

ENV APPLICATION /usr/lib/origin
ENV RAILS_ENV production
ENV PORT 3001

WORKDIR $APPLICATION

RUN apk add --no-cache --repository http://nl.alpinelinux.org/alpine/v3.4/main postgresql=9.5.7-r0
RUN apk add --no-cache --repository http://nl.alpinelinux.org/alpine/v3.4/main postgresql-dev=9.5.7-r0
RUN apk add --no-cache build-base tzdata
RUN gem install bundler

COPY Gemfile $APPLICATION/
COPY Gemfile.lock $APPLICATION/

RUN bundle install --jobs 20 --retry 5

COPY app/ $APPLICATION/app/
COPY bin/ $APPLICATION/bin/
COPY config/ $APPLICATION/config/
COPY db/ $APPLICATION/db/
COPY lib/ $APPLICATION/lib/
COPY public/ $APPLICATION/public/
COPY config.ru $APPLICATION/config.ru
COPY Rakefile $APPLICATION/Rakefile

EXPOSE $PORT

CMD ["bin/rails", "server", "--binding", "0.0.0.0"]
