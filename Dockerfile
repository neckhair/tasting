FROM ubuntu:17.10

ENV DEBIAN_FRONTEND=noninteractive
ENV BUNDLE_SILENCE_ROOT_WARNING=1

RUN echo 'APT::Install-Recommends "0";' > /etc/apt/apt.conf.d/01norecommend; \
    echo 'APT::Install-Suggests "0";' > /etc/apt/apt.conf.d/01nosuggests

RUN    apt-get update \
    && apt-get install -y curl ca-certificates \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y nodejs yarn ruby build-essential libmysqlclient-dev ruby-dev \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && gem install nokogiri -v 1.8.1 \
    && gem install ffi -v 1.9.18 \
    && gem install bundler \
    && mkdir -p /app

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install -j $(nproc)

COPY package.json yarn.lock ./
RUN yarn install

COPY . ./

CMD ["bundle", "exec", "rails", "server"]
