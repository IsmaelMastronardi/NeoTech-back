#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bin/rails db:migrate
bundle exec rails db:seed
