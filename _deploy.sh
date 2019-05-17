#!/bin/sh

[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "bluesshown@gmail.com"
git config --global user.name "chinhungtseng"

git clone -b gh-pages \
  https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git \
  book-output
cd book-output
git rm -rf *
cp -r ../_book/* ./
git add --all *
git commit -m"Update the book"
git push -q origin gh-pages