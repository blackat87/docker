#!/bin/sh

echo 'install mysqlclient python lib'
python3 -m pip install mysqlclient
echo 'run flask app'
python3 flask_app.py >> log.log 2>&1
