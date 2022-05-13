FROM nginx

ARG $VERSION
ENV VERSION=$VERSION
COPY index.html /usr/share/nginx/html/


