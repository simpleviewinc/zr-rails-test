#!/bin/bash
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
zerista_run_server(){
  RAILS_ENV=$ZR_ENV ./bin/bundle exec puma -C config/puma.rb -p $ZR_PORT
}

# Install the gems
zerista_run_bundler(){
  ./bin/bundle install
}

# Setup the database
zerista_run_db_setup(){
  ./bin/rails db:drop
  ./bin/rails db:create
  ./bin/rails db:migrate
  ./bin/rails db:seed
}

# Run any tests
zerista_run_tests(){
  ./bin/bundle exec rspec
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
  fi
}

zerista_run_action $@