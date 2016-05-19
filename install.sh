#! /usr/bin/env bash

if [[ $ASSETS == 'nobuild' ]]; then
    composer install --no-interaction --no-progress --prefer-dist -o
else
    echo "Installing PHP dependencies through Composer..."
    composer install
    echo "Downloading javascript librairies through npm..."
    npm install
    echo "Downloading fonts librairies through bower..."
    bower install
    echo "Concat, minify and installing assets..."
    grunt
fi
