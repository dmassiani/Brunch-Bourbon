node_modules/.bin/jade app/index.jade --pretty --out public/
node_modules/.bin/jade app/partials/ --pretty --out public/partials/

del app/index.jade 
rd /s /q app/partials/
