Twitter Consumer
================

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

Ruby on Rails
-------------

This application requires:

- Ruby 2.2.2
- Rails 4.2.3

App design
---------------
 - Using twitter gem to search tweets
 - Due to be a simple application i was chosen to use a helper instead decorators to link twitter URL in mentions
 - For the same reason above, I didn't use database_cleaner or other similar gem to clean db. I used a simple ```ActiveRecord::Base.subclasses.each(&:delete_all)```

Setup
-------------------------
- cp .env.sample .env
- set your credentials in .env file
- rake db:migrate
- rails s

Deploy
-------------------------
- Set .env variables in the server
- Add heroku remote
- git push heroku master
- heroku run rake db:migrate
