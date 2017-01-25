FROM ubuntu:trusty
MAINTAINER Mehran Akhavan <mehran.akhavan.1994@gmail.com>

RUN echo "Asia/Tehran" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

RUN chsh -s /bin/bash

RUN echo "deb http://ir.archive.ubuntu.com/ubuntu/ trusty main restricted universe" > /etc/apt/sources.list
RUN echo "deb http://ir.archive.ubuntu.com/ubuntu/ trusty-updates main restricted universe" >> /etc/apt/sources.list
RUN echo "deb http://security.ubuntu.com/ubuntu trusty-security main restricted universe" >> /etc/apt/sources.list

RUN apt-get -qq update && apt-get upgrade -qqy

RUN apt-get install -y python2.7 python-pip wget build-essential python-dev
RUN pip install django==1.9.12 gunicorn==19.3.0 django-json-rpc python-jsonrpc
RUN wget https://pypi.python.org/packages/c8/0a/b6723e1bc4c516cb687841499455a8505b44607ab535be01091c0f24f079/six-1.10.0-py2.py3-none-any.whl#md5=3ab558cf5d4f7a72611d59a81a315dc8
RUN pip install six-1.10.0-py2.py3-none-any.whl

ADD . /home/interview
WORKDIR /home/interview

EXPOSE 8000
CMD ["./entrypoint.sh"]

