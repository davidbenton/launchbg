require "launchbg/version"

module Launchbg
  def self.start(cmd)
    if Rails.env.production? and ENV['HEROKU_APP']    
      heroku = Heroku::API.new
      heroku.post_ps(ENV['HEROKU_APP'],cmd)
    else
      system "#{cmd} 2>&1 >> #{Rails.root}/log/launchbg.log &"
    end
  end
end
