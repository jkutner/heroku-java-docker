FROM heroku/cedar:14
MAINTAINER Joe Kutner <joe@heroku.com>

RUN mkdir /app

ADD *   /opt/heroku/
ADD bin /opt/heroku/bin

RUN /opt/heroku/bin/setup.sh /opt/heroku
RUN gem install --no-rdoc --no-ri foreman

ENV PATH /opt/heroku/.jdk/bin:$PATH

EXPOSE 5000

WORKDIR /app

ENTRYPOINT /opt/heroku/bin/run.sh
