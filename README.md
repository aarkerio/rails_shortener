# README

Install:

$ git clone git@github.com:aarkerio/rails_shortener.git

$ cd rails_shortener

Add the username/password to config/database.yml

$ ENV_RAILS=development rails db:create db:migrate

In another console start the queue:

$ bundle exec rake environment resque:work QUEUE=get_title

$ ENV_RAILS=development rails s


Things you may want to cover:

* Ruby version: '2.6.5'

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
