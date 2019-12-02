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

# entries by tier
entries = client.leagues.by_queue_tier_division(queue: "RANKED_SOLO_5x5", tier: "IRON" , division: "IV", page: 3)

# apex leagues
grandmaster_entries = client.leagues.by_grandmaster_league(queue: "RANKED_SOLO_5x5")
challenger_entries = client.leagues.by_challenger_league(queue: "RANKED_SOLO_5x5")
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
