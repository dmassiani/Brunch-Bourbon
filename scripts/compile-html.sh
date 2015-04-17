#!/bin/bash

node_modules/.bin/jade app/index.jade --pretty --out public/
node_modules/.bin/jade app/partials/ --pretty --out public/partials/

rm app/index.jade && rm -rf app/partials/
