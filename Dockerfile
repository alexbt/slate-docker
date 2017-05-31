FROM ruby:2.2

RUN apt-get update
RUN apt-get install -yq ruby ruby-dev build-essential libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext unzip git nodejs \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*
RUN gem install --no-ri --no-rdoc bundler

RUN git clone http://github.com/lord/slate.git /app/slate
WORKDIR /app/slate
RUN bundle install

EXPOSE 4567
RUN mkdir -p /app/slate/source/test
VOLUME /app/slate/source/test
WORKDIR /app/slate

ENTRYPOINT ["bundle", "exec", "middleman", "server"]
