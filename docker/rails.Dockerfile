
FROM ruby:2.5.1

ENV BUNDLER_VERSION 2.0.1

RUN apt-get -y update && apt-get -y install nodejs && rm -rf /var/lib/apt/lists/*
RUN gem install bundler -v 2.0.1

# Use COPY instead of git clone
RUN git clone https://github.com/jaus11/TkmtLabGO.git /var/www

WORKDIR /var/www

RUN bundle install

EXPOSE 3000
CMD bundle exec rake db:create && bundle exec rake db:migrate && bundle exec rails server -b 0.0.0.0
