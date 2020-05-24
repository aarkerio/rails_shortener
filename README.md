# README

Install:

$ git clone git@github.com:aarkerio/rails_shortener.git

$ cd rails_shortener

Add the username/password to config/database.yml

$ ENV_RAILS=development rails db:create db:migrate

In another console start the queue:

$ bundle exec rake environment resque:work QUEUE=get_title

Start the server:

$ ENV_RAILS=development rails s

Start resque:

$ bundle exec rake environment resque:work QUEUE=get_title


