#!/bin/bash

bundle check || bundle install

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

bundle exec rake db:nonexists && bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake data:migrate

foreman start --procfile=Procfile.docker
