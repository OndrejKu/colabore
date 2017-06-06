FROM ruby:2.3.3

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

ENV INSTALL_PATH /colabore

RUN mkdir /colabore
WORKDIR $INSTALL_PATH

ADD Gemfile $INSTALL_PATH/Gemfile
ADD Gemfile.lock $INSTALL_PATH/Gemfile.lock

ENV BUNDLE_PATH /box

ADD . $INSTALL_PATH
