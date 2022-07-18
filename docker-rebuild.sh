#!/bin/bash

echo "WARNING: This will completely destroy your containers and you will lose any cached data."
echo "WARNING: It will also likely re-download a lot of docker image data."
echo "Continue?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
            echo "Stopping containers..."
            docker-compose kill
            echo "Rebuilding containers..."
            docker-compose build --no-cache nginx php-fpm mysql workspace
            break;;
        No )
            echo "Aborting..."
            exit;;
    esac
done
