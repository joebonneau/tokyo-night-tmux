#!/bin/bash
cd $1
BRANCH=$(git branch --show-current 2>/dev/null)
STATUS=$(git status --porcelain 2>/dev/null | egrep "^(M| M)" | wc -l)
MAX_LENGTH=20
if test "$BRANCH" != ""; then
  if test ${#BRANCH} -gt $MAX_LENGTH; then
    prefix=$(echo "$BRANCH" | cut -d "_" -f 1)
    suffix=$(echo "$BRANCH" | cut -d "_" -f 2-)
    last_chars=$(echo "$suffix" | rev | cut -c 1-20 | rev)
    echo "#[fg=black,bg=#41a6b5,nobold,noitalics,nounderscore]#[fg=black,bg=#41a6b5,bold]  $prefix...$last_chars"
  else
    echo "#[fg=black,bg=#41a6b5,nobold,noitalics,nounderscore]#[fg=black,bg=#41a6b5,bold]  $BRANCH"
  fi
fi
