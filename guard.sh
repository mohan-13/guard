#!/usr/bin/env bash
NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[4;33m'

if [ $# == 0 ]
then
    echo -e "${RED}ERR! Guard expects a path to scan${NOCOLOR}"
    exit 2
fi
if [ ! -d $1 ]
then
    echo -e "${RED}ERR! Given directory is invalid${NOCOLOR}"
    exit 2
fi

echo -e "${YELLOW}Scanning for Git Repos inside $1 ............${NOCOLOR}"

gitRepos=$(find $1 -type d -name .git)
gitRepos=(${gitRepos//".git"/ })

echo -e "${GREEN}Found ${#gitRepos[@]} git repositories.${NOCOLOR}"
