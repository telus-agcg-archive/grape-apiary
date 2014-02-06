# GrapeApiary

[![Code Climate](https://codeclimate.com/github/connexio-labs/grape-apiary.png)](https://codeclimate.com/github/connexio-labs/grape-apiary)
[![Build Status](https://travis-ci.org/connexio-labs/grape-apiary.png?branch=master)](https://travis-ci.org/connexio-labs/grape-apiary)
[![Coverage Status](https://coveralls.io/repos/connexio-labs/grape-apiary/badge.png)](https://coveralls.io/r/connexio-labs/grape-apiary)

Auto generates an [Apiary Blueprint](http://apiary.io) from the docuementation that is created by your Grape API.

## Installation

Add this line to your application's Gemfile:

    gem 'grape-apiary'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install grape-apiary

## Usage

```ruby
GrapeApiary.config do |config|
  config.host               = 'http://awesome-api.apiary.io'
  config.name               = 'Awesome API'
  config.description        = 'The awesome description'
  config.resource_exclusion = [:admin, :swagger_doc]
end

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


GrapeApiary::Blueprint(AwesomeAPI).generate
```

## TODO


## Contributing

1. Fork it ( http://github.com/<my-github-username>/grape-apiary/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
