FROM casjaysdev/alpine:latest AS stage

RUN apk -U upgrade && \
  apk add \
  proftpd-mod_auth_otp \
  proftpd-mod_ban \
  proftpd-mod_copy \
  proftpd-mod_ctrls_admin \
  proftpd-mod_deflate \
  proftpd-mod_dynmasq \
  proftpd-mod_exec \
  proftpd-mod_facl \
  proftpd-mod_geoip \
  proftpd-mod_ifsession \
  proftpd-mod_ifversion \
  proftpd-mod_ldap \
  proftpd-mod_load \
  proftpd-mod_memcache \
  proftpd-mod_quotatab \
  proftpd-mod_quotatab_file \
  proftpd-mod_quotatab_ldap \
  proftpd-mod_quotatab_radius \
  proftpd-mod_quotatab_sql \
  proftpd-mod_radius \
  proftpd-mod_ratio \
  proftpd-mod_readme \
  proftpd-mod_redis \
  proftpd-mod_rewrite \
  proftpd-mod_sftp \
  proftpd-mod_sftp_sql \
  proftpd-mod_shaper \
  proftpd-mod_site_misc \
  proftpd-mod_snmp \
  proftpd-mod_sql \
  proftpd-mod_sql_mysql \
  proftpd-mod_sql_odbc \
  proftpd-mod_sql_passwd \
  proftpd-mod_sql_postgres \
  proftpd-mod_sql_sqlite \
  proftpd-mod_tls \
  proftpd-mod_tls_memcache \
  proftpd-mod_tls_redis \
  proftpd-mod_tls_shmcache \
  proftpd-mod_unique_id \
  proftpd-mod_wrap2 \
  proftpd-mod_wrap2_file \
  proftpd-mod_wrap2_redis \
  proftpd-mod_wrap2_sql \
  proftpd-utils 

COPY ./config/. /etc/
COPY ./bin/. /usr/local/bin/

FROM stage
ARG BUILD_DATE="$(date +'%Y-%m-%d %H:%M')" 

LABEL \
  org.label-schema.name="proftpd" \
  org.label-schema.description="proftpd server based on Alpine Linux" \
  org.label-schema.url="https://github.com/casjaysdev/jekyll" \
  org.label-schema.vcs-url="https://github.com/casjaysdev/jekyll" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.version=$BUILD_DATE \
  org.label-schema.vcs-ref=$BUILD_DATE \
  org.label-schema.license="MIT" \
  org.label-schema.vcs-type="Git" \
  org.label-schema.schema-version="latest" \
  org.label-schema.vendor="CasjaysDev" \
  maintainer="CasjaysDev <docker-admin@casjaysdev.com>" 

EXPOSE 21

WORKDIR /data
VOLUME [ "/data" ] [ "/data", "/config" ]

HEALTHCHECK CMD [ "/usr/local/bin/entrypoint-proftpd.sh" "healthcheck" ]
ENTRYPOINT [ "/usr/local/bin/entrypoint-proftpd.sh" ]
