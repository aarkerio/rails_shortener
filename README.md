# README

Demo:  https://rashortener.herokuapp.com/

Install:

$ git clone git@github.com:aarkerio/rails_shortener.git

$ cd rails_shortener

Add the username/password to config/database.yml. Do the DB related stuff:

$ ENV_RAILS=development bin/rails db:create db:migrate db:test:prepare

In another console start the queue:

$ bundle exec rake environment resque:work QUEUE=get_title &

Start the server:

$ ENV_RAILS=development bin/rails s

Run the tests:

$ RAILS_ENV=test bin/bundle exec rspec spec/

$ script/cucumber -s

Pending stuff:

1) If the URL already exists, present the short link instead of the Rails message.
2) Refactor the "decode_url" method in the Url model to use a reducer.

