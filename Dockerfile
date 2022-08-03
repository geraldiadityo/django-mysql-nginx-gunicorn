FROM python:3.8-alpine
ENV PYTHONUNBUFFERED 1
WORKDIR /app
RUN apk update \
    && apk add --no-cache --virtual bash \
    && apk add gcc \
    && apk add musl-dev \
    && apk add linux-headers \
    && apk add jpeg-dev \
    && apk add zlib-dev \
    && apk add mariadb-dev \
    && apk add libffi-dev  \
    && apk add mysql-client
COPY requirment.txt /app/requirment.txt
RUN pip install --upgrade pip \
    && pip install -r requirment.txt

COPY . /app