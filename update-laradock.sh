#!/bin/bash

# Update the laradock submodule
git submodule update --remote || git submodule update --init;

# Copy the env example
cp .env ../.laradock.env.bak || true;
cp .env.example .env;

# update the .env with the specific parameters we know are required to make portal work
#
# TODO: Come up with a better way of locating the evironment variable and changing the value
#       (rather than using the whole line as the target)
#       These lines will break when the default values from Laradock are changed
#
#       Initially I attempted the regex '/(COMPOSE_PROJECT_NAME).*\n/' as the target
#       but for whatever reason while it's a perfectly legitimate capture group and works
#       in other regex environments it doesn't work for sed.     
#
# TODO: Perhaps find a way to execute all of these in a single `sed` command
#
sed -i.bak "s/COMPOSE_PROJECT_NAME=laradock/COMPOSE_PROJECT_NAME=ci_laradock_host/" .env
sed -i.bak "s/WORKSPACE_INSTALL_MYSQL_CLIENT=false/WORKSPACE_INSTALL_MYSQL_CLIENT=true/" .env
sed -i.bak "s/WORKSPACE_BROWSERSYNC_HOST_PORT=3000/WORKSPACE_BROWSERSYNC_HOST_PORT=4000/" .env
sed -i.bak "s/WORKSPACE_BROWSERSYNC_UI_HOST_PORT=3001/WORKSPACE_BROWSERSYNC_UI_HOST_PORT=4001/" .env
sed -i.bak "s/PHP_VERSION=7.3/PHP_VERSION=7.4/" .env
sed -i.bak "s/PHP_VERSION=7.2/PHP_VERSION=7.4/" .env
sed -i.bak "s/MYSQL_VERSION=latest/MYSQL_VERSION=5.7.31/" .env
# sed -i.bak "s/MYSQL_DATABASE=default/MYSQL_DATABASE=homestead/" .env
# sed -i.bak "s/MYSQL_USER=default/MYSQL_USER=homestead/" .env
sed -i.bak "s/WORKSPACE_TIMEZONE=UTC/WORKSPACE_TIMEZONE=Australia\/Melbourne/" .env
sed -i.bak "s/PHP_FPM_INSTALL_MEMCACHED=false/PHP_FPM_INSTALL_MEMCACHED=true/" .env
