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

### Want to try in K8s ?
```sh
kubectl create ns auto-reload-nginx
kubectl -n auto-reload-nginx create configmap nginx-config  --from-file=new_routes.conf
kubectl apply -f kube.yaml
```
Edit the configmap in a parallel window using
```sh
kubectl -n auto-reload-nginx edit configmap nginx-config
```
and watch for logs of the pod. It should reload nginx service running inside the pod, inside a minute.
