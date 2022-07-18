#!/bin/bash
# Clean docker containers, taken from https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes

echo "WARNING: This will clean up docker all resources — images, containers, volumes, and networks."
echo "You can choose to remove all, or just the ones that are dangling (not associated with a container)."

PS3='Choose your preferred option: '
options=("All" "Dangling")
select chosen in "${options[@]}"; do
    case $chosen in
        "All")
            docker system prune -a
	        break
            ;;
        "Dangling")
            docker system prune
	        break
            ;;
    esac
done
