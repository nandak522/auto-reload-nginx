FROM nginx:1.21.1

COPY auto-reloader.sh /auto-reloader.sh
COPY entrypoint.sh /nginx-entrypoint.sh
COPY new_routes.conf /tmp/new_routes.conf

RUN chmod +x /auto-reloader.sh /nginx-entrypoint.sh && \
    apt-get update && apt-get install -y --no-install-recommends apt-utils inotify-tools && \
    rm /etc/nginx/conf.d/default.conf

ENTRYPOINT [ "/nginx-entrypoint.sh" ]
CMD ["nginx", "-g", "daemon off;"]
