#!/bin/bash
# 

cd tests/_output

# config
git config --global user.email "gowravvishwakarma@gmail.com"
git config --global user.name "Gowrav Vishwakarma"


git init
git add .
git commit -m "Travis Report"
git remote add report "https://${GITHUB_TOKEN}@github.com/xavoctechnocratspvtltd/xepan2.git"
git push --force --quiet report gh-pages 
