# Estimator

Requirements:

* Postgres 14+
* Ruby 3.2.2
* Python 3.11.3

Setup steps:

1. Use asdf to manage tool versions using `asdf install`
2. Install Ruby dependencies using `bundle install`
3. Sigh, Python `pip3 install -r requirements.txt`
4. Set up the local database `bin/rails db:setup`
5. Start the Rails server `heroku local -f Procfile.dev`
