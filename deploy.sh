#!/bin/bash

# Ensure the script is executed in the correct directory
cd $(dirname "$0")

# Setup Git for deployment
git config --global user.email "actions@github.com"
git config --global user.name "GitHub Actions"

# Create a new branch for GitHub Pages if it doesn't exist
if [ ! -d ".git" ]; then
    git init
    git remote add origin https://github.com/${GITHUB_REPOSITORY}.git
fi

# Switch to the GitHub Pages branch
git checkout -B gh-pages

# Copy the files to the root of the gh-pages branch
cp -R * .

# Commit and push the changes
git add .
git commit -m "Deploy to GitHub Pages"
git push origin gh-pages --force
