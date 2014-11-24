FROM heroku/cedar:14
MAINTAINER Joe Kutner <joe@heroku.com>

RUN mkdir /app

ADD *   /opt/heroku/
ADD bin /opt/heroku/bin

RUN /opt/heroku/bin/setup.sh /opt/heroku

ENV PATH /opt/heroku/.jdk/bin:$PATH
ENV PORT 8080

EXPOSE 8080

WORKDIR /app

ENTRYPOINT /opt/heroku/bin/run.sh
