#!/bin/bash

set -e

cd "$(dirname "$0")"

cd server
./build
cd ..

cd client
npm install
npm run build
cd ..

rm -rf neko_dist && mkdir neko_dist
cp -r client/dist neko_dist/neko_static
cp server/bin/neko neko_dist/
zip -r neko_dist.zip neko_dist

echo "Build done: neko_dist.zip"
