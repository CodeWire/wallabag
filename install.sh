#! /usr/bin/env bash

if [[ $ASSETS == 'nobuild' ]]; then
    composer install --no-interaction --no-progress --prefer-dist -o
else
    echo "Installing PHP dependencies through Composer..."
    SYMFONY_ENV=prod composer install --no-dev -o --prefer-dist

    echo "Downloading javascript librairies through npm..."
    vendor/mouf/nodejs-installer/bin/local/npm install

    echo "Downloading fonts librairies through bower..."
    node_modules/bower/bin/bower install

    echo "Concat, minify and installing assets..."
    node_modules/grunt/bin/grunt

    echo "Installing wallabag..."
    php bin/console wallabag:install --env=prod

fi
