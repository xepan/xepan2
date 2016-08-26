#!/bin/bash
# 

cd tests/_output

# config
git config --global user.email "gowravvishwakarma@gmail.com"
git config --global user.name "Gowrav Vishwakarma"

mkdir ${GITHUB_REPO}
mv !(${GITHUB_REPO}) ${GITHUB_REPO}

git init
git remote add origin https://github.com/xavoctechnocratspvtltd/xepan2.git
git pull origin gh-pages
git add -A .
git commit -m "Travis Report"
git push --force --quiet "https://${GITHUB_TOKEN}@github.com/${GITHUB_REPO}.git" master:gh-pages
