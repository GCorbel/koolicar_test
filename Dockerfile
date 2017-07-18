FROM ruby:2.3.0

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main 9.5" >> /etc/apt/sources.list.d/postgresql.list

RUN apt-get update -qq && apt-get install -y build-essential

RUN apt-get install -y libqtwebkit-dev qt4-qmake g++

RUN apt-get install -y --force-yes postgresql-client-9.5

RUN wget https://github.com/Medium/phantomjs/releases/download/v2.1.1/phantomjs-2.1.1-linux-x86_64.tar.bz2 && tar -xvf phantomjs-2.1.1-linux-x86_64.tar.bz2 && mv phantomjs-2.1.1-linux-x86_64 /usr/local/share && ln -sf /usr/local/share/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin

RUN apt-get install wget && wget https://github.com/GCorbel/dotfiles/raw/master/development_docker_install.sh -O - | sh

RUN mkdir /app
WORKDIR /app

ADD ./Gemfile* /app/

RUN gem install bundler

ADD . /app

EXPOSE "3000"
