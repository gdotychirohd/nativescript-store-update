#!/bin/bash

SOURCE_DIR=../src;
TO_SOURCE_DIR=src;
PACK_DIR=package;
ROOT_DIR=..;
PUBLISH=--publish

install(){
    npm i
}

pack() {

    echo 'Clearing /src and /package...'
    rm -rf "$TO_SOURCE_DIR"
    rm -rf "$PACK_DIR"

    # copy src
    echo 'Copying src...'
    cp -R "$SOURCE_DIR" "$TO_SOURCE_DIR"

    # copy README & LICENSE to src
    echo 'Copying README and LICENSE to /src...'
    cp -R "$ROOT_DIR"/LICENSE "$TO_SOURCE_DIR"/LICENSE
    cp -R "$ROOT_DIR"/README.md "$TO_SOURCE_DIR"/README.md

    # compile package and copy files required by npm
    echo 'Building /src...'
    cd "$TO_SOURCE_DIR"
    npm i
    npx tsc
    find ./ -name "*.ts" -delete
    rm -rf node_modules

    # echo 'Creating package...'
    # create package dir
    # mkdir "$PACK_DIR"

    # create the package
    # cd "$PACK_DIR"
    # npm pack ../"$TO_SOURCE_DIR"

    # delete source directory used to create the package
    # cd ..
    # node_modules/.bin/rimraf "$TO_SOURCE_DIR"
}

install && pack