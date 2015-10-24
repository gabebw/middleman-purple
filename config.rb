require './lib/helpers'

Time.zone = 'UTC'

activate :syntax

activate :blog do |blog|
  env = ENV.fetch("RACK_ENV", "development")

  blog.prefix = "blog"
  blog.layout = "blog"
  blog.paginate = false
  blog.publish_future_dated = (env != "production")
end

helpers Helpers

set :theme, "purple"
set :purple, {
  google_analytics_id: "UA-nnnnnnnnnn",
  # shown in header
  header: {
    full_name: "Your Full Name",
    email: "you@example.com",
    github_name: "example",
    twitter_name: "example",
  },
  feed: {
    title: "Your Site Title",
    root: "http://gabebw.com/",
    feed_url: "http://gabebw.com/feed.xml",
    author_name: "Gabe Berke-Williams",
  },
}

page '/feed.xml', layout: false

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true, tables: true,
  autolink: true, with_toc_data: true
set :trailing_slash, false

# about.html gets turned into about/index.html on build
activate :directory_indexes

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :gzip
  # Enable application-da39a3ee.js instead of application.js
  activate :asset_hash
end
