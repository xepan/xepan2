#!/bin/bash
# 

cd tests/_output

# config
git config --global user.email "gowravvishwakarma@gmail.com"
git config --global user.name "Gowrav Vishwakarma"


git init
git add .
git commit -m "Travis Report"
git push --force --quiet "https://${GITHUB_TOKEN}@github.com/${GITHUB_REPO}.git" master:gh-pages
