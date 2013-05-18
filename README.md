# Launchbg

Permite iniciar commando del sistema operativo en background y retorna inmediatamente. Si Rails.env.production? es verdadero entonces utiliza Heroku::API para iniciar un "one-off dyno" para procesar el trabajo

## Installation

Add this line to your application's Gemfile:

    gem 'launchbg'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install launchbg

## Usage

To use in production environment with heroku you must config the environment variable HEROKU_APP to the name of your application on heroku:

`heroku config:set HEROKU_APP=my_app_name`

Example case of use:

lib/task/rake/works.rake:

    desc "a very large job to process for a user"
    task :veryLargeJobForUser, [:user_id] => [:environment] do |t,args|
        user = User.find(args[:user_id])
        #sleep 600
        #.... do a very large task ...
        #.... and then notify the user that the job has finished...
        Mailer.job_finish(user)
    end

    

app/controller/test_controller.rb

    def test
        u = User.find(params[:id])
        #be extremely carefull about what parameters do you pass to work in background, because they are not sanitized
        Launchbg.start("rake veryLargeJobForUser[#{u.id}]")
        #launchbg returns immediately and the output can not be captured on the controller
    end


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
