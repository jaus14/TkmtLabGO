#! /bin/bash                                                                                                       
set -eu

date "+%Y/%m/%d-%H:%M:%S"
cd /Users/rails/Work/TkmtLabGO
echo "working directory is changed"

echo "Fetching..."
git fetch origin --prune
if [ "$(git rev-parse origin/master)" != "$(git rev-parse master)" ]; then
    echo "Service downing..."
    /usr/local/bin/docker-compose -f /Users/rails/Work/TkmtLabGO/docker/docker-compose.yml down
    echo "Pulling"
    git pull
    echo "Removing Docker Network"
    docker network rm $(docker network ls -q) || true
    echo "Docker Building.."
    /usr/local/bin/docker-compose -f /Users/rails/Work/TkmtLabGO/docker/docker-compose.yml build --no-cache
    echo "Service starting..."
    /usr/local/bin/docker-compose -f /Users/rails/Work/TkmtLabGO/docker/docker-compose.yml up -d
else
    if [ $(/usr/local/bin/docker-compose -f /Users/rails/Work/TkmtLabGO/docker/docker-compose.yml ps -q | wc -l) -eq 0 ]; then
	# コンテナが起動していなければ, 起動する.
	echo "Service starting..."
	/usr/local/bin/docker-compose -f /Users/rails/Work/TkmtLabGO/docker/docker-compose.yml up -d
    fi
fi
