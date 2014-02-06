# GrapeApiary

[![Code Climate](https://codeclimate.com/github/connexio-labs/grape-apiary.png)](https://codeclimate.com/github/connexio-labs/grape-apiary)
[![Build Status](https://travis-ci.org/connexio-labs/grape-apiary.png?branch=master)](https://travis-ci.org/connexio-labs/grape-apiary)
[![Coverage Status](https://coveralls.io/repos/connexio-labs/grape-apiary/badge.png)](https://coveralls.io/r/connexio-labs/grape-apiary)
[![Dependency Status](https://gemnasium.com/connexio-labs/grape-apiary.png)](https://gemnasium.com/connexio-labs/grape-apiary)
[![Gem Version](https://badge.fury.io/rb/grape-apiary.png)](http://badge.fury.io/rb/grape-apiary)

Auto generates an [Apiary Blueprint](http://apiary.io) from the docuementation that is created by your Grape API.

## Installation

Add this line to your application's Gemfile:

    gem 'grape-apiary'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install grape-apiary

## Usage

### Configuration

Configure details about your api in an initializers or similar

```ruby
GrapeApiary.config do |config|
  # your apiary.io host name
  config.host               = 'http://awesome-api.apiary.io'
  # the name of your api
  config.name               = 'Awesome API'
  # a description for your api
  config.description        = 'The awesome description'
  # resources you do not want documented
  config.resource_exclusion = [:admin, :swagger_doc]
end

# headers you want documented
GrapeApiary.config.request_headers = [
  { 'Accept-Charset' => 'utf-8' },
  { 'Connection'     => 'keep-alive' },
  { 'Content-Type'   => 'application/json' }
]

GrapeApiary.config.response_headers = [
  { 'Content-Length' => '21685' },
  { 'Connection'     => 'keep-alive' },
  { 'Content-Type'   => 'application/json' }
]
```

### Generation

```ruby
# supply the class you'd like to document and generate your blueprint
GrapeApiary::Blueprint.new(AwesomeAPI).generate
```

## TODO


## Contributing

1. Fork it ( http://github.com/<my-github-username>/grape-apiary/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
