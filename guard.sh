#!/usr/bin/env bash
if [ $# == 0 ]
then
    echo -e "ERR! Guard expects a path to scan"
    exit 2
fi
