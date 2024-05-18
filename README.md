# cook_book

A new Flutter project.

## Deploying

flutter clean
flutter pub get

flutter build web --base-href /cook_book.io/ --release

cd build/web
git init
git add .
git add --all
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/Ushie-E/cook_book.io.git
git push -u origin main

git push -u --force origin main