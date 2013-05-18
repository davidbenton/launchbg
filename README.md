# Launchbg

Permite iniciar commando del sistema operativo en background y retorna inmediatamente. Si Rails.env.production? entonces utiliza Heroku::API para iniciar un "one-off dyno" para procesar el trabajo

## Installation

Add this line to your application's Gemfile:

    gem 'launchbg', :git => "git://github.com:mabahamo/launchbg.git"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install launchbg

## Usage

To use in production environment with heroku you must config the environment variable HEROKU_APP to the name of your application on heroku:

heroku config:set HEROKU_APP=my_app_name

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
