FROM ruby:latest

RUN gem install nokogiri -v 1.8.1 && \
    gem install ffi --version 1.9.18 && \
    gem install therubyracer --version 0.12.3 && \
    mkdir -p /app

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install -j2

COPY . ./

CMD ["bundle", "exec", "rails", "server"]
