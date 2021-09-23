> Disclaimer: Inspired from https://cyral.com/blog/how-to-auto-reload-nginx/

### Build Nginx
```sh
docker build -t nanda/nginx-auto-reload:1.21.1 .
```

### Run Nginx
```sh
docker run --name nginx -it nginx-auto-reload:1.21.1
```

### Make config changes and test reload
```sh
docker exec -it nginx bash
```
Once you are in the nginx shell, try running
```sh
cp /tmp/new_routes.conf /etc/nginx/conf.d/
```
Immediately on the you would find the latest config changes are picked up
and nginx reload itself gracefully :point_down

![screenshot](/screenshot.png "Screenshot")
