#!/usr/bin/env bash
NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[4;33m'

scanRepo(){
    git -P grep --heading -f ~/.guard/patterns.yml
}

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
echo -e "${YELLOW}Starting scan for secrets inside repositories.....${NOCOLOR}"

hasSecrets=0
for repo in "${gitRepos[@]}";
do
    cd $repo
    scanRepo
    scanResult=$?
    if [ $scanResult == 0 ]
    then
        hasSecrets=1
    fi
    cd $1
done

if [ $hasSecrets == 0 ]
then
    echo "No secrets found inside the given directory."
fi
