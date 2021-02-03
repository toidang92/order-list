#!/bin/bash

bundle check || bundle install
yarn install

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

bundle exec rake db:nonexists && bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake data:migrate

foreman_missing=$(gem list '^foreman$' -i)
if [ "$foreman_missing" = false ] ; then
  gem install foreman --source https://rubygems.org
fi

foreman start --procfile=Procfile.docker
