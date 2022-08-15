#!/bin/bash
rm -rf dist;
yarn build;
cd dist; 
git init;
git remote add origin git@github.com:xiekuozhi/vue-notebook.git; 
git add . ; 
git commit -am \"modify\";
git branch -M main
git push -f origin main &&
exit 0