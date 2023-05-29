#!/usr/bin/env bash

# Show the latest updated date of all the files in the current directory
_git-ls() {
    for gitfile in $(git ls-tree --name-only HEAD);
    do
        echo "$( git log -1 --format="%ad %ae" --date=iso -- $gitfile ) $gitfile"
    done
}

_git-ls | column -t
