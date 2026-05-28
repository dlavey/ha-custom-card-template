#!/bin/sh

AUTHOR_NAME=`git config get  user.name`
AUTHOR_EMAIL=`git config get user.email`
REPOSITORY_NAME=`git config get remote.origin.url | sed 's/https:\/\/github.com\///'`
CARD_NAME=`git config get remote.origin.url | sed 's/https:\/\/github.com\///' |cut -d "/" -f 2 |cut -d "." -f 1`

echo $AUTHOR_NAME
echo $AUTHOR_EMAIL
echo $REPOSITORY_NAME
echo $CARD_NAME

sed "s/__GITHUB_CARD_NAME__/$CARD_NAME/g" .devcontainer/devcontainer.json hacs.json README rollup.config.js rollup.config.dev.js

mv src/ha-custom-card-template.ts src/$CARD_NAME.ts

sed "s/__GITHUB_REPO__/$REPOSITORY_NAME/g" package.json
sed "s/__GITHUB_AUTHOR_NAME__/$AUTHOR_NAME/g" package.json

