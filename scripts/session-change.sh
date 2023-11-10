#!/usr/bin/env bash
tmux switch -t $(tmux ls -F "#{session_name}" | fzf)
