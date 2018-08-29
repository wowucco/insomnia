#! /bin/bash

apps=(
    'insomnia-api'
)

currentDir=$(cd $(dirname $BASH_SOURCE) && pwd)
projectDir="${currentDir}/../.."

for app in ${apps[*]};
do
    appDir="${projectDir}/${apps[app]}"

    if [ ! -d ${appDir} ]; then
       git clone "git@github.com:wowucco/${apps[app]}.git" ${appDir}
    fi
done

wait

docker-compose up