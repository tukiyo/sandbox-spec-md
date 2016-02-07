#!/bin/sh
installcheck(){
  test -z `which npm`      && sudo apt-get install -y npm
  test -z `which spec-md`  && sudo npm install -g spec-md
  test -z `which node`     && ln -s /usr/bin/nodejs ~/bin/node
  test -z dist -a -d specs && mkdir dist specs
  test -z dist/highlight.css && cp -a /usr/local/lib/node_modules/spec-md/css/highlight.css dist
  test -z dist/spec.css && cp -a /usr/local/lib/node_modules/spec-md/css/spec.css dist
  #npm install --save-dev spec-md
}
installcheck

spec-md README.md > dist/index.html
firefox dist/index.html
