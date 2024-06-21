#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle db:migrate
bundle exec rails db:seed
