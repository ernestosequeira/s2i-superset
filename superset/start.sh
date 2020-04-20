#!/bin/bash -e

case $cmd in 
    "usage")
        echo "Usage!"
        /usr/libexec/s2i/usage
        exit 0
        ;;
    "superset-init")
        echo "Running superset initialzations scripts"
        # pipenv shell
        pipenv run superset db upgrade && 
        pipenv run flask fab create-admin \
            --username $fab_username \
            --firstname $fab_firstname \
            --lastname $fab_lastname \
            --email $fab_email \
            --password $fab_password &&
        pipenv run superset init &&
        pipenv run gunicorn \
            -w 4 \
            -k gevent \
            --timeout 120 \
            -b  0.0.0.0:8081 \
            --limit-request-line 0 \
            --limit-request-field_size 0 \
            superset:app
        ;;
    "superset")
        echo "Running superset with Gunicorn"
        # pipenv shell
        superset db upgrade
        gunicorn \
            -w 4 \
            -k gevent \
            --timeout 120 \
            -b  0.0.0.0:8081 \
            --limit-request-line 0 \
            --limit-request-field_size 0 \
            superset:app
        ;;
    *)
        echo "Running bash"
        pipenv shell
        exec /bin/bash
        ;;
esac
