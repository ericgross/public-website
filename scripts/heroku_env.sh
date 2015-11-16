#!/bin/bash
set -eux

figaro heroku:set -e staging --app ericgross-website-staging
figaro heroku:set -e production --app ericgross-website-production
