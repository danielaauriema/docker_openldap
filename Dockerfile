FROM debian:bookworm-20241111-slim

RUN apt update && \
    apt install -y vim curl procps ldap-utils slapd=2.5.13+dfsg-5

ENV LDAP_ORGANIZATION="devops-tools"
ENV LDAP_DOMAIN="devops-tools.local"
ENV LDAP_BASE_DN="dc=devops-tools,dc=local"

ENV LDAP_ADMIN_USERNAME="admin"
ENV LDAP_ADMIN_PASSWORD="password"
ENV LDAP_BIND_USERNAME="bind"
ENV LDAP_BIND_PASSWORD="password"
ENV LDAP_DEFAULT_USERNAME="devops"
ENV LDAP_DEFAULT_PASSWORD="password"

ENV LDAP_BACKEND="mdb"
ENV LDAP_ROOT_PATH="/openldap"
ENV LDAP_CONF_PATH="/etc/ldap/slapd.d"
ENV LDAP_DATA_PATH="${LDAP_ROOT_PATH}/data"
ENV LDAP_LOG_LEVEL=-1

ENV LDAP_LDAP_ENABLED=true
ENV LDAP_LDAPI_ENABLED=true
ENV LDAP_AUTO_START=true

EXPOSE 389
EXPOSE 636

RUN mkdir -p ${LDAP_ROOT_PATH}/logs && chmod -R ugo+rw ${LDAP_ROOT_PATH}

ADD start ${LDAP_ROOT_PATH}/start
WORKDIR ${LDAP_ROOT_PATH}/start

ENTRYPOINT [ "/bin/bash", "-c" ]
CMD [ "./entrypoint.sh" ]
