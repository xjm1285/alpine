FROM alpine:3.5

RUN apk add --update \
    build-base git \
    python python-dev py-pip linux-headers \
    postgresql-dev openldap-dev nodejs libxml2-dev libxslt-dev libjpeg-turbo-dev \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/*

WORKDIR /app

ONBUILD COPY . /app
ONBUILD RUN virtualenv /env && /env/bin/pip install -r /app/base/requirements.txt

EXPOSE 8069
CMD ["/env/bin/python", "base/odoo-bin", " --addons-path=gooderp_addons"]
