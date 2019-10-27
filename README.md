# riotrb

fully featured Riot Games API V4 wrapper

[![Build Status](https://travis-ci.org/drish/riotrb.svg?branch=master)](https://travis-ci.org/drish/riotrb)

## Installation

Add this line to your application’s Gemfile:

```ruby
gem 'riotrb'
```

## Getting Started

```ruby
client = Riotrb::Client.new(api_key, region)
client.third_party_code.by_summoner(encrypted_summoner_id: "")
```





## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/drish/riotrb/issues)
- Fix bugs and [submit pull requests](https://github.com/drish/riotrb/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features

To get started with development and testing:

```sh
git clone https://github.com/drish/riotrb.git
cd riotrb
bundle install
bundle exec rake test
```
