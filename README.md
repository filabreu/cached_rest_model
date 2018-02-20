# CachedRestModels

`CachedRestModels` is a gem that attempts to solve performance issues
on calling APIs on a centralized way for all applications.

API endpoints are referenced as Attributes, which can be used to compose
cached models for your application.

`CachedRestModels` is based on composition for each model attributes
and handle each set of attribute with a separated cache.

`CachedRestModels` uses `ActiveSupport::Cache` and `Redis` as backend.

## Goals

The goal of `CachedRestModels` is to be used as a centralized cache
for API calls for all applications.

By using the same cache server (based on Redis), applications doesn't need
to hold shared copies of the same data and can rely on the same data.

This is easier for teams to mantain and we can have a single focus point
on how to improve performance.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cached_rest_model'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cached_rest_model

## Usage

Create your own cached model class and extend it from `CachedRestModel::Base`

Example

```
class CachedUser < CachedRestModel::Base
end
```

Create your own cached model attribute module and put it inside `CachedRestModel::Attributes` module.

Use the `Attributes.get` method from `CachedRestModel::Attributes` passing your web service endpoint

Example:

```
module CachedRestModel
  module Attributes
    module Profile
      def profile
        Attributes.get("profiles/#{self.send(self.class.key_name)}")
      end
    end
  end
end
```

Include your attributes modules from the on your model class

Example:
```
class CachedUser < CachedRestModel::Base
  include CachedRestModel::Attributes::Profile
end
```

## TODO

- Configure REST hosts based on environment
- Configure external Redis server
- Handle HTTP errors
- Parse HTTP responses into objects instead of returning a string
- Change cache keys to use URN instead of endpoint addresses
- Expire caches based on events
- Define a main `Attribute` to define the existence of the model entity

## Dependencies

`ActiveSupport`
`Redis`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/filabreu/cached_rest_model.

For more info email me at <mailto:filabreu@gmail.com>
