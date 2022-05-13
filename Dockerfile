FROM nginx

ARG VERSION
ENV COMMITID=$VERSION
COPY index.html /usr/share/nginx/html/


