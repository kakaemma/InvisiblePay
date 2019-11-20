FROM ruby:2.6
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN mkdir /InvisiblePay
WORKDIR /InvisiblePay
COPY Gemfile /InvisiblePay/Gemfile
COPY Gemfile.lock /InvisiblePay/Gemfile.lock
RUN gem install bundler -v 2.0.2
RUN bundle install
COPY . /InvisiblePay

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x  /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 8081

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
