FROM jekyll/jekyll:4.1.0
LABEL maintainer="jberenguer <berenguer.jon@gmail.com>"

RUN gem install jekyll-docs -v 4.0.0
COPY _config.yml /srv/jekyll/

ENTRYPOINT ["/usr/jekyll/bin/jekyll","_4.0.0_","docs"]
