#!/usr/bin/env bash

# git co - smart checkout
# - no arg: fzf picker over all branches
# - "-": checkout previous branch
# - <query>: match local branches first, then all; auto-select if one match, fzf if multiple

FZF_OPTS="--layout=reverse --no-info --height=10"

checkout_with_query() {
    local query="$1"

    local branch
    branch=$(git for-each-ref --sort=committerdate refs/heads/ --format='%(refname:short)' \
        | fzf $FZF_OPTS --select-1 --exit-0 -q "$query")

    if [ -z "$branch" ]; then
        branch=$(git for-each-ref --sort=committerdate refs/heads/ refs/remotes/ --format='%(refname:short)' \
            | fzf $FZF_OPTS --select-1 --exit-0 -q "$query")
    fi

    if [ -n "$branch" ]; then
        git checkout "$branch"
    else
        git checkout "$query"
    fi
}

if [ "$1" = "-" ]; then
    git checkout -
elif [ -z "$1" ]; then
    branch=$(git for-each-ref --sort=committerdate refs/heads/ refs/remotes/ --format='%(refname:short)' \
        | fzf $FZF_OPTS)
    [ -n "$branch" ] && git checkout "$branch"
else
    checkout_with_query "$1"
fi
