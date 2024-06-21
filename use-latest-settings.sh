#!/bin/bash

sed -i.bak "s/PHP_VERSION=7.4/PHP_VERSION=8.1/" .env
sed -i.bak "s/MYSQL_VERSION=5.7.31/MYSQL_VERSION=8.0/" .env
