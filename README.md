# Mischief

CLI that checks the status of a site (default: https://github.com) and reports an average response time after checking the site by x (default: 10) times. Both number_of_requests and site should be configurable.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mischief'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mischief

## Usage

```ruby
Mischief::Site.new.ping # => https://github.com (10 requests) took 7.3321 seconds 🤔
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/hahmed/mischief. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Mischief project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/hahmed/mischief/blob/master/CODE_OF_CONDUCT.md).
