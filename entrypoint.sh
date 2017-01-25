#!/bin/bash

# Prepare log files and start outputting logs to stdout
mkdir /logs/
touch /logs/gunicorn.log
touch /logs/access.log
tail -n 0 -f /logs/*.log &


exec gunicorn interview.wsgi:application \
        --name interview-gunicorn \
        --bind 0.0.0.0:8000 \
        --workers 1 \
        --log-level=info \
        --log-file=/logs/gunicorn.log \
        --access-logfile=/logs/access.log \
        --timeout 300 \
        --reload
