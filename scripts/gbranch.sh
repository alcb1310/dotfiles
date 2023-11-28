#!/bin/bash

branch=`git branch --all | fzf`

if [[ -z $branch ]]; then
     echo "No branch selected"
     exit 1
else
     toCheckout=`echo $branch | sed "s/.* //" | sed "s#remotes/[^/]*/##"`
     git checkout $toCheckout
fi
