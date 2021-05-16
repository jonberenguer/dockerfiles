FROM jekyll/jekyll:4.2.0
LABEL maintainer="jberenguer <berenguer.jon@gmail.com>"

RUN gem update bundler
RUN bundle config set --local system 'true'
COPY Gemfile /home/jekyll/Gemfile
RUN bundle install --gemfile /home/jekyll/Gemfile

RUN apk add --upgrade nodejs && \
    apk add --upgrade npm git && \
    npm install -g bower


WORKDIR /srv/jekyll
USER jekyll
ENTRYPOINT ["/usr/jekyll/bin/entrypoint"]
