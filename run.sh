#!/bin/bash
set -e
set -x


sudo docker build -t saltcloud_memleak:local --rm .

sudo docker run --rm -e "AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID" -e "AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY" -e "AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION" saltcloud_memleak:local
