
FROM ruby:3.2.0

RUN apt-get update -qq && apt-get install -y ruby-full postgresql-client

WORKDIR /app

COPY Gemfile Gemfile.lock /app/

RUN bundle install

# COPY package.json yarn.lock /app/
# RUN yarn install --check-files

COPY . /app

RUN bundle exec rake assets:precompile

CMD ["rails", "server", "-b", "0.0.0.0"]