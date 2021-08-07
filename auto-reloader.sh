#!/bin/bash
set -eou pipefail

while true
do
    inotifywait --exclude .swp -e create -e modify -e delete -e move /etc/nginx/ /etc/nginx/conf.d
    echo "Detected Nginx Configuration Change"
    nginx -t
    if [ $? -eq 0 ]
    then
        echo "Latest configuration is valid."
        echo "Executing: nginx -s reload"
        nginx -s reload
    else
        echo "But configuration seems to be invalid! No reload attempted."
    fi
done
