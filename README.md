# GrapeApiary

[![Code Climate](https://codeclimate.com/github/connexio-labs/grape-apiary.png)](https://codeclimate.com/github/connexio-labs/grape-apiary)
[![Build Status](https://travis-ci.org/connexio-labs/grape-apiary.png?branch=master)](https://travis-ci.org/connexio-labs/grape-apiary)
[![Coverage Status](https://coveralls.io/repos/connexio-labs/grape-apiary/badge.png)](https://coveralls.io/r/connexio-labs/grape-apiary)
[![Dependency Status](https://gemnasium.com/connexio-labs/grape-apiary.png)](https://gemnasium.com/connexio-labs/grape-apiary)
[![Gem Version](https://badge.fury.io/rb/grape-apiary.png)](http://badge.fury.io/rb/grape-apiary)

Auto generates an [Apiary Blueprint](http://apiary.io) from the docuementation that is created by your [Grape](https://github.com/intridea/grape) API.

### NOTE

This is an early implementation that makes some assumptions about your API (follows a standard REST pattern) that works with our implementation of Grape API's. There is a new an [unreleased feature in Grape](https://github.com/intridea/grape#parameter-documentation) that allows for appending additional documentation. This project is dependent on this feature in order to create example JSON requests and responses.

## Installation

Add this line to your application's Gemfile:

    gem 'grape', github: 'intridea/grape' # see note above
    gem 'grape-apiary'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install grape-apiary

## Usage

Add some metadata about your API and then execute the `generate` method on the `GrapeApiary::Blueprint` class.

### Configuration

Configure details about your api in an initializers or similar:

```ruby
GrapeApiary.config do |config|
  # your apiary.io host name
  config.host               = 'http://awesome-api.apiary.io'
  # the name of your api
  config.name               = 'Awesome API'
  # a description for your api
  config.description        = 'The awesome description'
  # the type to use for generated sample id's (`integer` or `uuid`)
  config.example_id_type    = :uuid
  # resources you do not want documented
  config.resource_exclusion = [:admin, :swagger_doc]
  # whether or not examples should include a root element (default: false)
  config.include_root       = true
end

# request headers you want documented
GrapeApiary.config.request_headers = [
  { 'Accept-Charset' => 'utf-8' },
  { 'Connection'     => 'keep-alive' }
]

# response headers you want documented
GrapeApiary.config.response_headers = [
  { 'Content-Length' => '21685' },
  { 'Connection'     => 'keep-alive' }
]
```

### Generation

```ruby
# supply the class you'd like to document and generate your blueprint
GrapeApiary::Blueprint.new(AwesomeAPI).generate
```

## TODO

* Add a rake task to simplify generation
* ~~Add support for listing all of a resources attributes at the resource level as a markdown table~~
* Handle ever changing sample id's (don't want git diff's after every generation)
* Add option to change or remove the sample id field (eg. `_id` vs `id`)
* What if someone does not use JSON?!?
* ~~Create sample response for list endpoints (array)~~
* Add support for writing the blueprint to disk
* Add an option to include root in json

## Contributing

1. Fork it ( http://github.com/connexio-labs/grape-apiary/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
