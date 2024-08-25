FROM ruby:3.2.0

RUN apt-get update -qq && apt-get install -y postgresql-client nodejs yarn

WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN bundle install


COPY . /app

RUN bundle exec rake assets:precompile

EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
