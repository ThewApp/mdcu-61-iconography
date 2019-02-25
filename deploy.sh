#!/bin/sh

# remove 'dist' directory
rm -rf dist

for directory in */; do
    # check .gitignore
    ignored=`git check-ignore $directory`
    if [[ -z $ignored ]]; then
        # mdx-deck build
        mkdir -p dist/$directory
        cp -r $directory/. dist/$directory
        echo Building... $directory
        npx mdx-deck build $directory/deck.mdx -d dist/$directory
    fi
done


cd dist

email=$(git config user.email)
name=$(git config user.name)
url=$(git remote get-url origin)

git init
git config user.email $email
git config user.name $name
git remote add origin $url
git checkout -b gh-pages
git add .
git commit -m "Deploy gh-pages"
git push -f origin gh-pages

rm -rf .git