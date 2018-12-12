#!/bin/sh

./node_modules/.bin/firebase-server -e -b -p 5000 -a 0.0.0.0&
gulp
