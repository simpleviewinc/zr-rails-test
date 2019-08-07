#!/bin/bash

# To run
# Requires a unix terminal
# bash ./run.sh ...params

ZR_ENV=development
ZR_PORT=3001

zerista_check_args(){

  # Check for ENV override
  if [[ "$ENV" || "$RAILS_ENV" ]]; then
    ZR_ENV=$ENV
  elif [[ "$RAILS_ENV" ]]; then
    ZR_ENV=$RAILS_ENV
  fi
  
  # Check for port override
  if [[ "$PORT" ]]; then
    ZR_PORT=PORT
  fi

}

# Start the server
# Example => bash ./run.sh
zerista_run_server(){
  RAILS_ENV=$ZR_ENV ./bin/bundle exec puma -C config/puma.rb -p $ZR_PORT
}

# Install the gems
# Example => bash ./run.sh bundle
zerista_run_bundler(){
  ./bin/bundle install
}

# Setup the database
# Example => bash ./run.sh db
zerista_run_db_setup(){
  ./bin/rails db:drop
  ./bin/rails db:create
  ./bin/rails db:migrate
  ./bin/rails db:seed
}

# Run any tests
# Example => bash ./run.sh test
zerista_run_tests(){
  ./bin/bundle exec rspec
}

# Format the code
# Example => bash ./run.sh format
zerista_run_format(){
  rubocop -a
}

# Run an action based on passed in param
zerista_run_action(){
  if [[ -z "$1" ]]; then
    # Default to just running the server
    zerista_run_server
  elif [[ "$1" == "bundle" ]]; then
    zerista_run_bundler
  elif [[ "$1" == "db" ]]; then
    zerista_run_db_setup
  elif [[ "$1" == "test" ]]; then
    zerista_run_tests
  elif [[ "$1" == "format" ]]; then
    zerista_run_format
  fi
}

zerista_run_action $@