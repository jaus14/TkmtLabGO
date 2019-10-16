
FROM ruby:2.5.1

ENV BUNDLER_VERSION 2.0.1

RUN apt-get -y update && apt-get -y install nodejs && rm -rf /var/lib/apt/lists/*
RUN gem install bundler -v 2.0.1

# Use COPY instead of git clone -> COPY command
# RUN git clone https://github.com/jaus11/TkmtLabGO.git /var/www
COPY . /var/www

WORKDIR /var/www

RUN bundle install
RUN bundle exec rake db:create && bundle exec rake db:migrate

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
