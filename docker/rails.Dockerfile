
FROM ruby:2.5.5

ENV BUNDLER_VERSION 2.0.2

RUN apt-get -y update && apt-get -y install nodejs && rm -rf /var/lib/apt/lists/*
RUN gem install bundler -v $BUNDLER_VERSION

COPY . /var/www

WORKDIR /var/www

RUN bundle install

EXPOSE 3000
CMD bundle exec rake db:create && bundle exec rake db:migrate && bundle exec rails server -b 0.0.0.0
