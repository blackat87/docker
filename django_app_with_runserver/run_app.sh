#!/bin/sh

echo 'python makemigration'
python3 manage.py makemigrations
python3 manage.py makemigrations app_name

echo 'python migrate'
python3 manage.py migrate
python3 manage.py migrate app_name

echo 'create superuser for admin'
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.filter(email='admin@example.com', is_superuser=True).delete(); User.objects.create_superuser('admin', 'admin@example.com', 'password')" | python3 manage.py shell

echo 'load json data if there are'
python3 manage.py loaddata data.json

echo 'python collectstatic'
python3 manage.py collectstatic --clear --noinput --verbosity 0

echo 'python runserver'
python3 manage.py runserver 0.0.0.0:8000 >> log.log 2>&1
