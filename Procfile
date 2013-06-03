web: bundle exec thin start -p $PORT -e $RACK_ENV
worker: bundle exec sidekiq -c 3 -q default -e $RACK_ENV