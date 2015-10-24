require "bundler/setup"

# Heroku automatically runs `rake assets:precompile` when you deploy any Rack
# app.
# Thus Heroku automatically runs `middleman build` every time this is deployed.
namespace :assets do
  task :precompile do
    sh "middleman build"
  end
end
