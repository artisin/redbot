FROM python:3.7.15-alpine3.16
WORKDIR /redbot
COPY . /redbot

RUN apk add --no-cache libffi-dev build-base openssl-dev

RUN pip install --trusted-host pypi.python.org -r requirements.txt

EXPOSE 8000

ENV PYTHONPATH /redbot
ENV PYTHONUNBUFFERED true
ENTRYPOINT ["python", "bin/redbot_daemon.py", "extra/config-docker.txt"]
