FROM heroku/heroku:16-build

ENV APPLICATION /app
ENV RAILS_ENV production
ENV PORT 3001

COPY Gemfile $APPLICATION/
COPY Gemfile.lock $APPLICATION/
COPY app/ $APPLICATION/app/
COPY bin/ $APPLICATION/bin/
COPY config/ $APPLICATION/config/
COPY db/ $APPLICATION/db/
COPY lib/ $APPLICATION/lib/
COPY public/ $APPLICATION/public/
COPY config.ru $APPLICATION/config.ru
COPY Rakefile $APPLICATION/Rakefile

RUN wget -q -O /heroku-buildpack-ruby-master.zip https://github.com/heroku/heroku-buildpack-ruby/archive/master.zip
RUN unzip -q /heroku-buildpack-ruby-master.zip -d /
RUN /heroku-buildpack-ruby-master/bin/detect $APPLICATION && /heroku-buildpack-ruby-master/bin/compile $APPLICATION/ /tmp

EXPOSE $PORT

CMD ["bin/rails", "server", "--binding", "0.0.0.0"]
