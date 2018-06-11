#!/bin/bash
# 

cd tests/_output

# config
git config --global user.email "gowravvishwakarma@gmail.com"
git config --global user.name "Gowrav Vishwakarma"

mkdir ~/temp
mv * ~/temp

mkdir "${REPORT_FOLDER}"
mv ~/temp/* ./"${REPORT_FOLDER}"

git init
git remote add origin https://github.com/xepan/xepan2.git
git pull origin gh-pages
git add -A .
git commit -m "Travis Report"
git push --force --quiet "https://${GITHUB_TOKEN}@github.com/${GITHUB_REPO}.git" master:gh-pages
