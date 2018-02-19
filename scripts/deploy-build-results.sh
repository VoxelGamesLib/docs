#!/bin/bash
echo "clean deploy folder"
rm -rf deploy-stuff

echo "setup git"
git config --global user.email "vglbot@minidigger.me"
git config --global user.name "VoxelGamesLibBot"

echo "clone repo"
git clone --depth 10 -b gh-pages "https://${GITHUB_TOKEN}@github.com/VoxelGamesLib/docs.git" deploy-stuff

ls -R . | grep ':$' | sed -e 's/:$//' -e 's/[^\/]*\//|  /g' -e 's/|  \([^|]\)/|–– \1/g' 

echo "copy stuff to deploy"
cp -R /home/travis/build/VoxelGamesLib/docs/site/ deploy-stuff/

echo "add to repo"
cd deploy-stuff
git add .
echo "commit"
git commit -m "Deploy to Github Pages (docs)"
echo "push"
git push --force "https://${GITHUB_TOKEN}@github.com/VoxelGamesLib/docs.git" gh-pages:gh-pages
echo "DONE"
