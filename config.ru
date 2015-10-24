require "bundler/setup"
Bundler.require

Rack::Zippy.configure do |config|
  # Search for .xml and .json files too
  config.static_extensions.push("xml", "json", "csv")
end

use Rack::Zippy::AssetServer, "./build"

# Serve 404 messages if we get past Rack::Zippy
app = lambda do |env|
  not_found_page = File.read("./build/404/index.html")

  [404, {"Content-Type" => "text/html"}, [not_found_page]]
end

run app
