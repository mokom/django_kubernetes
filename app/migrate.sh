#!/bin/bash
SUPERUSER_EMAIL=${DJANGO_SUPERUSER_EMAIL:-"admin@admin.com"}
# SUPERUSER_USERNAME=${DJANGO_SUPERUSER_USERNAME:-"admin"}
cd /app/

/opt/venv/bin/python3 manage.py migrate --noinput

# /opt/venv/bin/python3 manage.py createsuperuser --email $SUPERUSER_EMAIL --user $SUPERUSER_USERNAME --noinput || true

/opt/venv/bin/python3 manage.py createsuperuser --email $SUPERUSER_EMAIL --noinput || true