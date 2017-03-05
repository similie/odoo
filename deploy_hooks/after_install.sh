#!/bin/bash
cd /home/ubuntu/apps/raphter/
docker build -t similie/raphter .
/usr/bin/sudo service nginx reload
