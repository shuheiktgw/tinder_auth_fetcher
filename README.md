# TinderAuthFetcher

TinderAuthFetcher is inspired by [@andrewpeterprifer](https://github.com/andrewpeterprifer)'s [tinder-token-retriever](https://github.com/andrewpeterprifer/tinder-token-retriever) written in Python.

Thank you Andrew! :smile:

## Description
TinderAuthFetcher is used for fetching Facebook auth token to use Tinder API. TinderAuthFetcher automatically crawls Facebook and retrieves the token which is necessary to send a request to Tinder API. More information about Tinder API is [here](https://gist.github.com/rtt/10403467).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tinder_auth_fetcher'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tinder_auth_fetcher

## Usage
First thing is first. Make sure that you've required tinder_auth_fetcher.
$ gem install tinder_auth_fetcher


```ruby
require 'tinder_auth_fetcher'
```

Now all you need to do is just call #TinderAuthFetcher.fetch_token with target facebook email address and password. Then it will return the token. 

```ruby
token = TinderAuthFetcher.fetch_token(facebook_email, facebook_password)
``` 

## Test
I wrote only two test cases, one that asserts it raises `TinderAuthFetcher::FacebookAuthenticationError` when it fails to fetch the token and the one which asserts it fetches the token correctly.

First you have to provide valid Facebook email and password through environment variables.

    $ export export TINDER_AUTH_EMAIL="you_facebook_email@gmail.com"
    $ export TINDER_AUTH_PASSWORD="you_facebook_password"

Then all you need to do is just runing the RSpec.

    $ rspec

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/shuheiktgw/tinder_auth_fetcher. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

