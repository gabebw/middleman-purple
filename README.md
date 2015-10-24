# middleman-purple

A [Middleman](http://middlemanapp.com) template that works on Heroku.

![](https://cloud.githubusercontent.com/assets/257678/10712968/98483f92-7a5f-11e5-849c-dac25a232e2f.png)

Features:

* A good-looking, responsive, 1-column theme to display your articles
* SCSS is built on [Bourbon] and [Neat]
* A good-looking 404 page from [here][error]
* All set up with [middleman-blog](https://middlemanapp.com/basics/blogging/)
* Support for linking to external blog posts (see "Blogging", below)
* Configurable via the `purple` options in `config.rb`
* Syntax highlighting in blog posts that Just Works
* Redcarpet's extended Markdown features are enabled in `config.rb`
* Automatically serves gzipped assets using [rack-zippy]
* Google Analytics (only enabled when `RACK_ENV` is not `development`, so local
  development won't mess with the stats)
* Click on your name in the header to go to the About page, click it again to go
  back to the index

[Bourbon]: http://bourbon.io/
[Neat]: http://neat.bourbon.io/
[rack-zippy]: http://gabebw.com/blog/2015/08/04/middleman-rack-zippy-is-a-gzipped-peanut-butter-cup
[error]: https://github.com/alexbaldwin/error

## Installation

```bash
$ gem install middleman
$ mkdir -p ~/.middleman
$ git clone git@github.com:gabebw/middleman-purple.git ~/.middleman/purple
$ middleman init my_cool_website --template purple
```

## Setup

* Check out the `purple` configuration in `config.rb`
* Change the `title` in `source/index.html.erb`

You should set the following environment variables on Heroku:

* `RACK_ENV`: your Rack environment, like `staging` or `production`. It defaults
  to "production".

## Deployment

    git push heroku master

It's detected as a standard Ruby/Rack app and is served using the `config.ru`.

## Blogging

Docs: http://middlemanapp.com/basics/blogging/

Create a new article in `source/blog/`:

    middleman article 'This is my new title'

It will automatically show up in the index.

### External Blog Posts

To add a blog post that shows up on the index but links to an external URL, make
a file in `source/blog/` with a `url:` key in the frontmatter:

```
---
title: "Let's Build a Sinatra"
url: https://robots.thoughtbot.com/lets-build-a-sinatra
---
```

Now when people click the blog post title, they'll be taken to that URL.
