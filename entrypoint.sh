#!/bin/bash
set -eou pipefail

sh -c "/auto-reloader.sh &"
exec "$@"
