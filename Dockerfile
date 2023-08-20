# https://qiita.com/291dev/items/53f00265812e7e934dec

# base image #1
FROM nginx:1.23.1 as build

ARG BASIC_AUTH_USER
ARG BASIC_AUTH_PASS

RUN crypt_pass=`openssl passwd -crypt ${BASIC_AUTH_PASS}` && \
    echo "${BASIC_AUTH_USER}:${crypt_pass}" > .htpasswd

# base image #2
#FROM nginx:1.19.2-alpine
FROM nginxinc/nginx-unprivileged:alpine

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=build .htpasswd /etc/nginx/.htpasswd

COPY ./docs /usr/share/nginx/html

EXPOSE 8080
CMD [ "nginx", "-g", "daemon off;" ]

