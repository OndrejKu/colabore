FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /colabore
WORKDIR /colabore
ADD Gemfile /colabore/Gemfile
ADD Gemfile.lock /colabore/Gemfile.lock
RUN bundle install
ADD . /colabore
