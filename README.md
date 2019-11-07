# rioter (wip)

Riot Games API ruby gem.

[![Build Status](https://travis-ci.org/drish/rioter.svg?branch=master)](https://travis-ci.org/drish/rioter)

## Installation

Add this line to your application’s Gemfile:

```ruby
gem 'rioter'
```

## Getting Started

```ruby
client = Rioter::Client.new(api_key, region)

# third party code fetching
client.third_party_code.by_summoner(encrypted_summoner_id: "")
```


## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/drish/rioter/issues)
- Fix bugs and [submit pull requests](https://github.com/drish/rioter/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features

To get started with development and testing:

```sh
git clone https://github.com/drish/rioter.git
cd rioter
bundle install
bundle exec rake test
```
