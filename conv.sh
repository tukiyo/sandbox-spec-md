#!/bin/sh
installcheck(){
  test -e `which npm`     || sudo apt-get install -y npm
  test -e `which spec-md` || sudo npm install -g spec-md
  test -e `which node`    || ln -s /usr/bin/nodejs ~/bin/node
  test -d dist -a -d specs|| mkdir dist specs
  test -e dist/highlight.css || cp -a /usr/local/lib/node_modules/spec-md/css/highlight.css dist
  test -e dist/spec.css || cp -a /usr/local/lib/node_modules/spec-md/css/spec.css dist
  #npm install --save-dev spec-md
}
installcheck

spec-md README.md > dist/index.html
firefox dist/index.html
