FROM ruby:2.3
MAINTAINER szymon.ciolkowski@gmail.com

RUN useradd -ms /bin/bash acredisrails5 && apt-get update && apt-get install -y \
build-essential \
nodejs \
redis-tools

USER acredisrails5:www-data
WORKDIR /home/acredisrails5

COPY Gemfile Gemfile.lock ./

RUN gem install bundler && bundle install --jobs 20 --retry 5
