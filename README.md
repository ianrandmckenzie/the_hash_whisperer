# The Hash Whisperer
The n+1 brute force machine for getting what you want. This project was inspired by thecreation of a (now long dead) social media aggregator app and being sick of how tedious it was parsing through enormous, confusing hashes and json responses. This library is probably not very efficient, but if you're a new developer working with APIs, it will save you a lot of grief and help you get your API-related college project finished.

## Installation

Add this line to your application’s Gemfile:

```ruby
gem "the_hash_whisperer"
```

Or, for non-framework projects, simply type this into your terminal:

```bash
gem install the_hash_whisperer
```

## Usage

### Get all values identified by a specified a key
```ruby
whisperer = TheHashWhisperer.new
values = whisperer.find_all_values_for('title', JSON.parse(json))
# => ["Example Article Title 1", "Example Article Title 2", "Example Comment Title 1"]
```

### Get all values specified by a direct path to that key
```ruby
whisperer = TheHashWhisperer.new
values = whisperer.drill_into_and_find('data.article.comments.title', json, true)
# => ["Example Comment Title 1"]
```

### Yes, it works for the shallower values, too
```ruby
whisperer = TheHashWhisperer.new
values = whisperer.drill_into_and_find('data.article.title', json, true)
# => ["Example Article Title 1", "Example Article Title 2"]
```

## History

View the [changelog](https://github.com/ianrandmckenzie/the_hash_whisperer/blob/main/CHANGELOG.md)

## Contributing

Everyone is encouraged to help improve this project. Here are a few ways you can help:

- [Report bugs](https://github.com/ianrandmckenzie/the_hash_whisperer/issues)
- Fix bugs and [submit pull requests](https://github.com/ianrandmckenzie/the_hash_whisperer/pulls)
- Write, clarify, or fix documentation
- Suggest or add new features

To get started with development and testing:

```sh
git clone https://github.com/ianrandmckenzie/the_hash_whisperer.git
cd the_hash_whisperer
bundle install
bundle exec rake test
```

For security issues, send an email to the address on [this page](https://github.com/ianrandmckenzie).