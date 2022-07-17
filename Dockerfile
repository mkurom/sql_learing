# mysql:5.7-debianではなく、mysql:5.7だとapt-getエラーが発生?
# https://stackoverflow.com/questions/72946649/dockerfile-running-from-mysql-cannot-access-apt-get
FROM mysql:5.7-debian

RUN apt-get update && apt-get -y install locales-all

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ Asia/Tokyo

COPY ./docker/db/my.cnf /etc/mysql/conf.d/my.cnf

CMD ["mysqld"]

EXPOSE 3306