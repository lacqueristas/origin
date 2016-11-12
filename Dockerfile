FROM ruby:2.3-alpine

ENV APPLICATION /usr/src/origin
ENV DATABASE_HOST postgres

WORKDIR $APPLICATION
COPY Gemfile* $APPLICATION/

RUN apk add --no-cache build-base git libc-dev postgresql-client postgresql postgresql-dev tzdata
RUN bundle install
