FROM --platform=linux/amd64 ruby:3.4.0-preview1-slim-bookworm
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN gem install bundler -v 1.17.3
RUN bundle install
ADD . /myapp
