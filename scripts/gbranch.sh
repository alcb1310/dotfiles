#!/bin/bash

branch=`git branch --all | fzf`

if [[ -z $branch ]]; then
     echo "No branch selected"
     exit 1
else
     git checkout $branch
fi
