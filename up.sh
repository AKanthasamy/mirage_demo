#!/usr/bin/env bash

rm -f env

set | grep -i twitter > env

docker-compose build && docker-compose up
