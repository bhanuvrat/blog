#!/bin/bash
cd build
git init
git config user.name "Travis-CI"
git config user.email "travis@email.com"
git add .
git commit -m "Deployed to Github Pages"
git push --force --quiet "https://${GH_TOKEN}@github.com/gh_user/gh_repo" master:gh-pages > /dev/null 2>&1
