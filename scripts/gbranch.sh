#!/bin/bash

branch=`git branch --all | fzf --reverse --preview 'git log --oneline --abbrev-commit --reverse --color=always {1}'`

if [[ -z $branch ]]; then
     echo "No branch selected"
     exit 1
else
     toCheckout=`echo $branch | sed "s/.* //" | sed "s#remotes/[^/]*/##"`
     git checkout $toCheckout
fi
