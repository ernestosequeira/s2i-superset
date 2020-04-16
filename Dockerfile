FROM centos:7.6.1810

LABEL io.k8s.description="Apache Superset" \
      io.k8s.display-name="Apache Superset" \
      io.openshift.expose-services="8088:http,8081:http" \
      io.openshift.tags="superset,python,apache" \
      maintainer="Ernesto Sequeira <erdaseq@gmail.com>" \
      io.openshift.s2i.scripts-url="image:///usr/libexec/s2i"

ENV APACHE_SUPERSET_VERSION=0.34.0 \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    PY_DEPS="postgresql-devel mysql-devel gcc gcc-c++ cyrus-sasl-plain cyrus-sasl-devel" \
    PY368="python36u python36u-pip python36u-devel which" \
    PIPENV_VENV_IN_PROJECT=yes \
    PIPENV_YES=yes 

WORKDIR /app
COPY --chown=1001:1001 Pipfile .
COPY --chown=1001:1001 .env .
COPY .s2i/bin/ /usr/libexec/s2i

RUN rpm --import /etc/pki/rpm-gpg/* && \
    yum -y update && \
    yum -y install https://centos7.iuscommunity.org/ius-release.rpm && \
    yum install -y --setopt=tsflags=nodocs $PY_DEPS && \
    yum install -y --setopt=tsflags=nodocs $PY368 && \
    pip3.6 install pipenv && \
    pipenv install --skip-lock && \
    rm -rf .cache && \
    yum -y remove $PY_DEPS && \
    yum -y clean all --enablerepo='*' && \
    mkdir -p superset && \
    chown -R 1001:1001 /app && \
    chown -R 1001:1001 /var/lib/rpm/.dbenv.lock
   
USER 1001
EXPOSE 8088 8081
CMD ["/usr/libexec/s2i/usage"]
