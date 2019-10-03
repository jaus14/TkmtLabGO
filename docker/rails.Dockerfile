
FROM ruby:2.5.1

ARG RAILS_ENV="development"
ENV RAILS_ENV ${RAILS_ENV}

ENV BUNDLER_VERSION 2.0.1

RUN apt-get -y update && apt-get -y install nodejs && rm -rf /var/lib/apt/lists/*
RUN gem install bundler -v 2.0.1

# Use COPY instead of git clone
RUN git clone https://github.com/jaus11/TkmtLabGO.git /var/www

WORKDIR /var/www
# RUN git checkout -b test origin/server

RUN bundle install
RUN bundle exec rake db:create RAILS_ENV=${RAILS_ENV}
RUN bundle exec rake db:migrate RAILS_ENV=${RAILS_ENV}

EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-e", "${RAILS_ENV}"]
