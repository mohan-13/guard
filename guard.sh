#!/usr/bin/env bash
NOCOLOR='\033[0m'
RED='\033[0;31m'
if [ $# == 0 ]
then
    echo -e "${RED}ERR! Guard expects a path to scan${NOCOLOR}"
    exit 2
fi
