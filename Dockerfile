FROM ruby:2.4.1-alpine

ENV APPLICATION /usr/lib/origin
ENV RAILS_ENV production
ENV PORT 3001
ENV BUNDLE_FORCE_RUBY_PLATFORM 1

WORKDIR $APPLICATION

RUN apk add --no-cache build-base tzdata protobuf
RUN apk add --no-cache --repository http://nl.alpinelinux.org/alpine/v3.5/main postgresql-dev
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
