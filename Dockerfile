FROM debian:jessie


# Install some deps, lessc and less-plugin-clean-css, and wkhtmltopdf
RUN set -x; \
        apt-get update \
        && apt-get install -y --no-install-recommends \
            ca-certificates \
            curl \
            node-less \
            python-gevent \
            python-pip \
            python-renderpm \
            python-support \
            python-watchdog \
        && curl -o wkhtmltox.deb -SL http://nightly.odoo.com/extra/wkhtmltox-0.12.1.2_linux-jessie-amd64.deb \
        && echo '40e8b906de658a2221b15e4e8cd82565a47d7ee8 wkhtmltox.deb' | sha1sum -c - \
        && dpkg --force-depends -i wkhtmltox.deb \
        && apt-get -y install -f --no-install-recommends \
        && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false -o APT::AutoRemove::SuggestsImportant=false npm \
        && rm -rf /var/lib/apt/lists/* wkhtmltox.deb \
        && pip install psycogreen==1.0



RUN  set -x; \
	apt-get update \
    && apt-get install -y  --no-install-recommends libpq-dev python-dev build-essential libxml2-dev libxslt1-dev libjpeg62-turbo-dev libldap2-dev libsasl2-dev


WORKDIR /usr/src/app/

#RUN virtualenv raphter

#RUN source raphter/bin/activate

COPY requirements.txt /usr/src/app/

RUN pip install -r requirements.txt

COPY . /usr/src/app/


EXPOSE 8069 8071 8072

ENV ODOO_VERSION 10.0

ENV ODOO_RC /usr/src/app/odoorc

RUN useradd -ms /bin/bash similie

RUN chown -R similie /usr/src/app

USER similie

CMD [ "./odoo-bin", "--config=/usr/src/app/odoorc" ]

