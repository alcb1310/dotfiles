#!/bin/bash

file=`ls *.md | fzf | cut -d '.' -f1`

pandoc $file.md -f markdown -t pptx -s -o $file.pptx
