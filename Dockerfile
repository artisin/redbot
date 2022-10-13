FROM mcr.microsoft.com/playwright:focal
WORKDIR /redbot
COPY . /redbot

# Get the needed libraries to run Playwright
RUN apt-get update && apt-get -y install libnss3 libatk-bridge2.0-0 libdrm-dev libxkbcommon-dev libgbm-dev libasound-dev libatspi2.0-0 libxshmfence-dev python3-pip

RUN pip install --trusted-host pypi.python.org -r requirements.txt

EXPOSE 8000

ENV PYTHONPATH /redbot
ENV PYTHONUNBUFFERED true
ENTRYPOINT ["python", "bin/redbot_daemon.py", "extra/config-docker.txt"]
