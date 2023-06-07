FROM ruby:2.7.0

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update
RUN apt install build-essential libpq-dev -y
RUN apt install nano -y
RUN apt install nodejs -y
RUN apt install yarn -y
RUN apt install postgresql-client -y
RUN gem install rails -v 5
RUN gem install bundler
RUN gem install pg

RUN mkdir /back-app
WORKDIR /back-app

COPY app-entrypoint.sh /usr/src/app/app-entrypoint.sh
RUN chmod +x /usr/src/app/app-entrypoint.sh

ENV RAILS_ENV development
ENV RACK_ENV development

EXPOSE 3000
ENTRYPOINT [ "/usr/src/app/app-entrypoint.sh" ]
