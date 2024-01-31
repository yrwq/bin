#!/bin/sh

#
# push - pushes a branch to every remote found
# gum, 

if [ ! -d .git ]; then
    gum log --structured --level fatal "not a git repository"
    exit
fi

repo_name="$(basename `git rev-parse --show-toplevel`)"
branch=$(git branch | grep "*" | awk '{print $2}')

for remote in $(git remote)
do
    gum log --structured --level info "pushing" remote ${remote} repo ${repo_name}
    git push -u ${remote} $branch
done
