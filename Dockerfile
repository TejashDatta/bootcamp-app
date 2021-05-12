# syntax=docker/dockerfile:1
FROM ruby:2.6.0
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
  && apt-get update -qq \
  && apt-get install -y nodejs postgresql-client \
  && npm install -g yarn
WORKDIR /bootcamp-app
COPY Gemfile Gemfile.lock /bootcamp-app/
RUN bundle install
COPY . /bootcamp-app

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
